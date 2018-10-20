pipeline {
    agent { label 'master' }
    environment {
        CPP_CMD ='docker run --rm -u root -v "$PWD":/app -w /app gcc:5 /bin/bash'
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
              sh "docker run --rm -u root -v "$PWD":/app -w /app --name GCC gcc:5"
            }
        }
        
        stage('Clean && Build') {
            steps {
                sh  "chmod a+x build.sh" 
                sh  "ls -altr" 
                sh  "./build.sh" 
                sh  'docker stop GCC'
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
