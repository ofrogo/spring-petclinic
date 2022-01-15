#!groovy

pipeline {
  agent none
  stages {
    stage('Docker Build') {
        agent any
        steps {
            TAG = VersionNumber(versionNumberString: '${BUILDS_ALL_TIME}')
            sh 'docker build -t danil/spring-petclinic:$TAG .'
        }
    }
    stage('Docker run') {
        agent any
        when {
            branch 'main'
        }
        steps {
            TAG = VersionNumber(versionNumberString: '${BUILDS_ALL_TIME}')
            sh 'docker run -d -p 8081:8080 danil/spring-petclinic:$TAG'
        }
    }
  }
}
