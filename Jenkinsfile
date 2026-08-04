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

        stage('Login to Amazon ECR') {

            steps {

                sh '''

                aws ecr get-login-password --region ap-south-1 | \
                docker login \
                --username AWS \
                --password-stdin 963910217596.dkr.ecr.ap-south-1.amazonaws.com
                '''

            }
        }

        stage('Tag Docker Image') {

            steps {

                sh '''
                docker tag healthcare-app:${BUILD_NUMBER} \
                963910217596.dkr.ecr.ap-south-1.amazonaws.com/healthcare-app:${BUILD_NUMBER}

                docker tag healthcare-app:${BUILD_NUMBER} \
                963910217596.dkr.ecr.ap-south-1.amazonaws.com/healthcare-app:latest
                '''
            }
        }

        stage('Push Docker Image') {

            steps {

                sh '''

                docker push 963910217596.dkr.ecr.ap-south-1.amazonaws.com/healthcare-app:${BUILD_NUMBER}

                docker push 963910217596.dkr.ecr.ap-south-1.amazonaws.com/healthcare-app:latest

            }
        }

        stage('Deploy application to EC2') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no ec2-user@10.0.1.98 'bash -s' < scripts/deploy.sh
                '''
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