#!groovy

pipeline {
  agent none
  environment {
     TAG = VersionNumber(versionNumberString: '${BUILDS_ALL_TIME}')
  }
  stages {
    stage('Docker Build') {
        agent any
        steps {
            sh 'docker build -t danil/spring-petclinic:$TAG .'
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
