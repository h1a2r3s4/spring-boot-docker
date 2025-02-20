pipeline {
    agent any

    tools {
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }

        }
        stage('Docker') {
            steps {
                sh "docker build -t springbootapp ."
            }
        }

        stage('Docker run'){
            agent {
              docker {
                image 'springbootapp'
                reuseNode true
              }
            }
            steps {
                sh 'docker run springbootapp'
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
