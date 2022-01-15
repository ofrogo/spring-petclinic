#!groovy

pipeline {
  agent none
  environment {
     TAG = VersionNumber(versionNumberString: '${BUILDS_ALL_TIME}')
  }
  stages {
    stage('Test') {
            steps {
                sh './mvnw test'
            }
        }
    stage('Build') {
      steps {
         sh './mvnw package'
      }
    }
    stage('Docker run') {
        agent any
        when {
            branch 'main'
        }
        steps {
            sh 'docker run -d -p 8081:8080 danil/spring-petclinic:$TAG'
        }
    }
  }
}
