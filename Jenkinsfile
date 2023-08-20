pipeline {
    environment {
        registry = '0967840437/repository_hieudx'
        registryCredential = 'dckr_pat_3EfgGocyQRcmJ5k-Vv9UnIifrB4'
        registryUserName = '0967840437'
        registryPassword = 'Anhhieu159220'
        dockerImage = ''
    }

    stages {
        stage('Maven Install') {
                docker {
                    image 'maven:3.5.0'
                }
        }

        stage('Compilation') {
            sh './mvnw clean install -DskipTests'
        }

        stage('Tests and Deployment') {
            stage('Runing unit tests') {
                sh './mvnw test -Punit'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t hieudx1/gateway:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: registryPassword, usernameVariable: registryUserName)]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push hieudx1/gateway:latest'
                }
            }
        }
    }
}
