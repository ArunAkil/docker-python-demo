pipeline {
    environment {
       registry = "arunakilan/python-demo"
       registryCredential = 'docker'
       dockerImage = ''
    }
    agent any
       stages {
        stage('Cloning Git') {
            steps {
               git 'https://github.com/ArunAkil/docker-python-demo.git'
            }
        }
        stage('build image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker') {
                        dockerImage.push("${env.BUILD_NUMBER}")
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}
