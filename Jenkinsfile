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
    }
     post {
        success {
           junit '**/target/surefire-reports/TEST-*.xml'
           archiveArtifacts 'target/*.jar'
        }
     }
}
