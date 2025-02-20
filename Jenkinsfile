pipeline {
    agent any

    tools {
        maven "M3"
    }

    environment {
        SERVICE_CREDS = credentials('dockerhub')
    }

    stages {

        stage('Example Username/Password') {
            steps {
                 sh 'echo "Service user is $SERVICE_CREDS_USR"'
                 sh 'echo "Service password is $SERVICE_CREDS_PSW"'
            }
        }


        stage('Build') {
            steps {

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean install"
            }

        }
        stage('Docker') {
            steps {
                sh "docker build -t mithra2020/springbootapp ."
                sh 'docker images'
            }
        }

        stage('Docker Push') {
              agent any
              steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                  sh "docker login -u ${env.SERVICE_CREDS_USR} -p ${env.SERVICE_CREDS_USR}"
                  sh 'docker push springbootapp'
                }
              }
        }

    }
     post {
     success {
           junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
           }
     }
}
