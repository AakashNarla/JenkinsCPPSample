pipeline {
    agent { label 'master' }
    environment {
        CPP_CMD ='docker run --rm -v "$PWD":/app -w /app gcc:5 /bin/bash '
    }

    stages {
        stage('Checkout Repo') {
            steps {
              checkout scm
            }
        }
        stage('Checkout GCC Image') {
            steps {
              sh "docker pull gcc:5"
            }
        }
        
        stage('Clean && Build') {
            steps {
                sh  "${CPP_CMD} build.sh"               
            }
        }
        
        stage('Execute') {
            steps {
                sh './Debug/google_test_sample --gtest_output="xml:XML_Report.xml"'
            }
        }
    }
    post {
        always{
        	xunit thresholds: [failed(unstableThreshold: '1')], tools: [GoogleTest(deleteOutputFiles: true, failIfNotNew: false, pattern: 'XML_Report.xml', skipNoTestFiles: false, stopProcessingIfError: true)]
        }
    }
}
