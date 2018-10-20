pipeline {
    agent { label 'master' }
    environment {
        CPP_CMD ='docker run --rm -v "$PWD":/app -w /app registrynxbnsf.azurecr.io/gcc:latest /bin/bash '
    }

    stages {
        stage('Checkout Repo') {
            steps {
              checkout scm
            }
        }
        stage('Checkout GCC Image') {
            steps {
              sh "docker pull registrynxbnsf.azurecr.io/gcc:latest"
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