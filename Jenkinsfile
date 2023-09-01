pipeline {
    agent any

    environment {
        registry = '0967840437/repository_hieudx'
        registryCredential = 'dckr_pat_3EfgGocyQRcmJ5k-Vv9UnIifrB4'
        registryUserName = '0967840437'
        registryPassword = 'Anhhieu159220'
        dockerImage = ''
        NAME = 'gateway'
        VERSION = "${env.BUILD_ID}"
        IMAGE = "${NAME}:${VERSION}"
        BRAND_NAME = "${env.BRANCH_NAME}"
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
                sh "docker tag ${NAME}:latest localhost:8081/library/${NAME}:${VERSION}"
                sh "docker push localhost:8081/library/${NAME}:${VERSION}"
            }
        }
    }
}
