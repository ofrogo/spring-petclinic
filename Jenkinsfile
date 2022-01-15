#!groovy

pipeline {
  agent any
  environment {
      TAG = VersionNumber(versionNumberString: '${BUILDS_ALL_TIME}')
      OLD_TAG = TAG - 1
  }
  stages {
    stage('Build & Test') {
      steps {
          sh './mvnw package'
      }
    }
    stage('Docker build') {
      when {
            branch 'main'
        }
        steps {
            sh 'docker build -t danil/spring-petclinic:$TAG .'
        }
    }
    stage('Docker run') {
        when {
            branch 'main'
        }
        steps {
            sh 'docker stop $(docker ps -q --filter ancestor=danil/spring-petclinic:$OLD_TAG)'
            sh 'docker run -d -p 8081:8080 danil/spring-petclinic:$TAG'
        }
    }
  }
}
