pipeline {

    agent any

    stages {

        stage('Checkout') {

            steps {

                checkout scm
            }
        }

        stage('Verify workspace') {

            steps {

                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Verify tools') {

            steps {

                sh 'java --version'
                sh 'git --version'
                sh 'docker --version'
                sh 'aws --version'
            }
        }
    }

    post {

        success {

            echo "Pipeline completed successfully"
        }

        failure {

            echo "Pipeline failed"
        }
    }
}