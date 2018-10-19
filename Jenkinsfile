pipeline {
    agent any

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
                
                    sh 'make clean'
                    sh 'ls -altr'
                    sh 'make build'
                
            }
        }
    }
}