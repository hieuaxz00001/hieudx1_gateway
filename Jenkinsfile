pipeline {
    agent any

    environment {
        registryUserName = '0967840437'
        registryPassword = 'Anhhieu159220'
        NAME = 'gateway'
        MOBILE = '0967840437'
        VERSION = "${env.BUILD_ID}"
        PORT = '5000'
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
                sh "docker login --username ${registryUserName} --password ${registryPassword}"
                sh "docker tag ${NAME}:latest ${MOBILE}/${NAME}:${VERSION}"
                sh "docker push ${MOBILE}/${NAME}:${VERSION}"
                sh "docker rmi ${MOBILE}/${NAME}:${VERSION}"
                sh "docker rmi ${NAME}:latest"
            }
        }

        stage('Deploy Service') {
            steps {
                // echo 'Start Deploy Service'
                // sh "helm uninstall ${NAME}"
                sh "helm install -n default ${NAME} deployment/${NAME}/"
            }
        }
    }
}
