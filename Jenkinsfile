pipeline {
    agent any

    tools {
        maven "M3"
    }

    environment {
        SERVICE_CREDS = credentials('dockerhub')
    }

    stages {
        stage('Build') {
        agent {
                        docker {
                            image 'mithra2020/springbootapp'
                            reuseNode true
                        }
                    }

            steps {

                // Run Maven on a Unix agent.
                sh "ls -la"
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
