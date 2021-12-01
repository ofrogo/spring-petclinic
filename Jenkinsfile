#!groovy

pipeline {
  agent none
  stages {
    stage('Docker Build') {
        agent any
        steps {
            sh 'docker build -t danil/spring-petclinic:latest .'
        }
    }
    stage('Docker run') {
        agent any
        steps {
            sh 'docker run -d -p 8081:8080 danil/spring-petclinic:latest'
        }
    }
  }
}
