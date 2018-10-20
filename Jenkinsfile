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
              sh 'pwd'
            }
        }
        
        stage('Clean && Build') {
            agent {
                docker { 
                    image 'gcc:5' 
                    args '-v "$PWD":/app -w /app'
                }
            }
            steps {
                sh  "chmod a+x build.sh" 
                sh  "ls -altr" 
                sh  "pwd" 
                sh  "./build.sh" 
                sh  "pwd" 
                sh  "ls -altr"
                sh './Debug/google_test_sample --gtest_output="xml:XML_Report.xml"'
            }
            
        }
        
        stage('Execute') {
            steps {
                sh  "pwd" 
                sh  "cd Debug/" 
                sh  "pwd && ls -altr"
                sh  "cd .. && pwd"  
                
            }
        }
    }
    post {
        always{
        	xunit thresholds: [failed(unstableThreshold: '1')], tools: [GoogleTest(deleteOutputFiles: true, failIfNotNew: false, pattern: 'XML_Report.xml', skipNoTestFiles: false, stopProcessingIfError: true)]
        }
    }
}
