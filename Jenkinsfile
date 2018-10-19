pipeline {
    agent { label 'cpp-slave' }

    stages {
        stage('Checkout Repo') {
            steps {
              checkout scm
            }
        }
        
        stage('Check for GCC Version') {
            steps {
            
                    sh 'g++ --version'
                
            }
        }
        stage('Clean && Build') {
            steps {
                	sh 'cd Debug'
                    sh 'make clean'
                    sh 'ls -altr'
                    sh 'make all'
            }
        }
        stage('Execute') {
            steps {
                
                    sh 'make clean'
                    sh 'ls -altr'
                    sh 'make all'
                
            }
        }
    }
    post {
        always{
        	xunit thresholds: [failed(unstableThreshold: '1')], tools: [GoogleTest(deleteOutputFiles: true, failIfNotNew: false, pattern: 'XML_Report.xml', skipNoTestFiles: false, stopProcessingIfError: true)]
        }
    }
}