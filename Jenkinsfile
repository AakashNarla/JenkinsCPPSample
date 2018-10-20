pipeline {
    agent {
       docker { 
            image 'gcc:5' 
            args '-v ${PWD}:/app -w /app'
        }
    }
        
    stage('Clean && Build') {            
        steps {
            sh  "chmod a+x build.sh" 
            sh  "ls -altr" 
            sh  "pwd" 
            sh  "./build.sh" 
            sh  "pwd" 
            sh  "ls -altr"
            
        }
    }
        
        stage('Execute') {
            steps {
                sh  "pwd" 
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
