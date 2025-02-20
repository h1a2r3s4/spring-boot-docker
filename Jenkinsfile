pipeline {
    agent any

     tools {
            maven "Maven 3.9.9"
      }

    stages {
        stage('Docker') {
            steps {
              sh 'docker build -t springboot .'
            }
        }

        stage('Build') {
            agent {
                docker {
                    image 'springboot'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    ls -la
                    mvn --version
                    mvn clean install
                    ls -la
                '''
            }
        }
    }
}
