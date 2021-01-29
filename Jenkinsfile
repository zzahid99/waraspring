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
        stage('DeployToStaging') {
            when {
                branch 'main'
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'webserver_login', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'production', sshCredentials: [encryptedPassphrase: '{AQAAABAAAAAQO4RGYCfddkOfmbMGTuVYBTBaVIKpZD4/t6su6TwwQU8=}', key: '', keyPath: '', username: 'cloud_user'], transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'tmp', remoteDirectorySDF: false, removePrefix: 'build/libs/', sourceFiles: 'build/libs/*.jar')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                }
            }
        }
    }
}
