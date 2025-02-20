pipeline {
    agent any

    tools {
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean install"
            }

        }
        stage('Docker') {
            steps {
                sh "docker build -t springbootapp ."
                sh 'docker images'
                sh 'docker run -p 8081:8080 springbootapp'
            }
        }

        stage('Docker Push') {
              agent any
              steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                  sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
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
