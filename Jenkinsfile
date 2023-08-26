pipeline {
    agent any

    environment {
        registry = '0967840437/repository_hieudx'
        registryCredential = 'dckr_pat_3EfgGocyQRcmJ5k-Vv9UnIifrB4'
        registryUserName = '0967840437'
        registryPassword = 'Anhhieu159220'
        dockerImage = ''
    }

    stages {
        stage('Check version docker') {
            steps {
                sh '''
                docker --version
                docker compose version
                '''
            }
        }
        stage('Maven Install') {
            steps('Compilation') {
                sh 'chmod +x mvnw'
                sh './mvnw clean install -DskipTests'
            }
        }

        // stage('Tests and Deployment') {
        //     steps('Runing unit tests') {
        //         sh './mvnw test -Punit'
        //     }
        // }
        stage('Docker login') {
            steps {
                    sh 'docker login -u 0967840437 -p Anhhieu159220'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t hieudx1/gateway:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push hieudx1/gateway:latest'
            }
        }
    }
}
