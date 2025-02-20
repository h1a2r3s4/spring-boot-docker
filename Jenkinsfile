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

    }
     post {
     success {
           junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
           }
     }
}
