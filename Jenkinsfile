pipeline {
    agent {
        docker {
            image 'node:lts-bullseye-slim' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
    }
}