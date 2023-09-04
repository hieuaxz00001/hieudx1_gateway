pipeline {
    agent any

    environment {
        registryUserName = 'admin'
        registryPassword = 'Harbor12345'
        NAME = 'gateway'
        VERSION = "${env.BUILD_ID}"
        PORT="5000"
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
                sh './mvnw -Dmaven.repo.local=/var/lib/jenkins/.m2 clean install -DskipTests'
            }
        }

        // stage('Tests and Deployment') {
        //     steps('Runing unit tests') {
        //         sh './mvnw test -Punit'
        //     }
        // }
        // stage('Docker login') {
        //     steps {
        //             sh 'docker login -u 0967840437 --password-stdin Anhhieu159220'
        //     }
        // }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${NAME} ."
            }
        }

        stage('Docker push image') {
            steps {
                echo "Running ${VERSION} on ${env.JENKINS_URL}"
                sh "docker login --username ${registryUserName} --password ${registryPassword} localhost:${PORT}"
                sh "docker tag ${NAME}:latest localhost:${PORT}/library/${NAME}:${VERSION}"
                sh "docker push localhost:${PORT}/library/${NAME}:${VERSION}"
                sh "docker rmi localhost:${PORT}/library/${NAME}:${VERSION}"
                sh "docker rmi ${NAME}:latest"
            }
        }
    }
}
