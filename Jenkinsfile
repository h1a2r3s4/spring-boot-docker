pipeline {
    agent any

    tools {
        maven "M3"
    }

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.9.9'
                    reuseNode true
                }
            }
            steps {
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                sh 'docker build -t sbootapp .'
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
