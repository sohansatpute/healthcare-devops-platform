pipeline {

    agent any

    stages {

        stage('Checkout') {

            steps {
                checkout scm
            }
        }

        stage('Verify Workspace') {

            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Verify Tools') {

            steps {
                sh 'java --version'
                sh 'git --version'
                sh 'docker --version'
                sh 'aws --version'
            }
        }

        stage('Build Docker Image') {

            steps {

                dir('application') {

                    sh '''
                    docker build \
                    -t healthcare-app:${BUILD_NUMBER} \
                    -t healthcare-app:latest .
                    '''
                }
            }
        }

        stage('List Docker Images') {

            steps {
                sh 'docker images'
            }
        }
    }

    post {

        success {

            echo "Docker image built successfully."
        }

        failure {
            
            echo "Pipeline failed."
        }
    }
}