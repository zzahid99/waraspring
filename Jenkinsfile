pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
               sh './gradlew clean'
                sh './gradlew assemble'
               }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
    }
}
