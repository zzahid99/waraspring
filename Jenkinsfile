pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                sh './gradlew clean build'
                sh './gradlew assemble'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Results') {
            steps {
                archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
                junit 'build/test-results/test/*.xml'
            }
        }
    }
}
