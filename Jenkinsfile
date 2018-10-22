pipeline {
    agent {
       docker { 
            image 'aakashn/gcovr:latest' 
            args '-v ${PWD}:/app -w /app'
        }
    }
    stages {    
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
                sh './Debug/JenkinsCPPSample --gtest_output="xml:XML_Report.xml"'
               	sh  "chmod a+x report.sh" 
                sh  "ls -altr" 
                sh  "pwd" 
                sh  "./report.sh" 
            }
        }
    }
    post {
        always{
        	xunit thresholds: [failed(unstableThreshold: '1')], tools: [GoogleTest(deleteOutputFiles: true, failIfNotNew: false, pattern: 'XML_Report.xml', skipNoTestFiles: false, stopProcessingIfError: true)]
        	cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: '**/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
        }
    }
}
