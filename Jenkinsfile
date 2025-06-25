pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                sh 'git clone https://github.com/SahooSecOps/test1.git'
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
        stage('remove obsolete') {
            steps {
                 sh 'rm -rf /var/lib/jenkins/workspace/test*'
            }
        }
        stage('run container') {
            steps {
                 sh 'docker run localhost:5001/test:r1 -p 5000:5000 --name test'
            }
        }
        
    }
}

