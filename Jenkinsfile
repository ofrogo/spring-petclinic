#!groovy

pipeline {
  agent any
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
            sh 'docker build -t danil/spring-petclinic:1 .'
        }
    }
    stage('Docker run') {
        when {
            branch 'main'
        }
        steps {
            sh 'docker ps -q --filter publish=8081 | xargs docker stop'
            sh 'docker run -d -p 8081:8080 danil/spring-petclinic:1'
        }
    }
  }
}
