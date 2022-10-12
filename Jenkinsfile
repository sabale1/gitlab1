pipeline {
    agent any
    stages {
        stage('Test'){
            steps {
                sh "run_tests.bash"
            }
        }
    }
    post {
        always{
            xunit (
                thresholds: [ skipped(failureThreshold: '0'), failed(failureThreshold: '0') ],
                tools: [ BoostTest(pattern: 'boost/*.xml') ]
            )
        }
    }
 }
