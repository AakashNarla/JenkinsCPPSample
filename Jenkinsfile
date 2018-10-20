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
              sh 'docker run --rm -i -v "$PWD":/app -w /app --name GCC gcc:5'
              sh 'pwd'
            }
        }
        
        stage('Clean && Build') {
            docker.image('gcc:5').withRun('-v "$PWD":/app -w /app') { c ->
                sh  "chmod a+x build.sh" 
                sh  "ls -altr" 
                sh  "pwd" 
                sh  "./build.sh" 
            }
            steps {
                sh  "docker ps -a" 
               
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
