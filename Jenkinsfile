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
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }
           stage('run') {
               steps {
                   sh 'docker run -d -it --name pythonweb -p 9090:8080 arunakilan/python-demo:19'
                   }
           }
    }
}
