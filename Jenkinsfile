pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                sh 'git clone git@github.com:SahooSecOps/streak-ai.git'
            }
        }
        stage('build') {
            steps {
                 sh ' docker build -t test .'
            }
        }
        stage('tag') {
            steps {
                 sh ' docker tag  test localhost:5001/test:r1'
            }
        }
        stage('push') {
            steps {
                 sh ' docker push localhost:5001/test:r1'
            }
        }
        stage('run container') {
            steps {
                 sh 'docker run -d -p 5000:5000   --name test  localhost:5001/test:r1 && sleep 5 && curl localhost:5000'
            }
        }
        
    }
    
    post {
         success {
             
                 sh ' docker rm -f test'
        }
         failure {
             
                 sh ' docker rm -f test'
        }
        
    }
}

