pipeline {
  agent any
  stages {
    stage('Docker Build') {
      agent {
        docker {
            image 'maven:3.9.9'
            reuseNode true
        }
      }
      steps {
        sh 'mvn clean install'
        sh 'docker build -t springbootapp .'
      }
    }
  }
}