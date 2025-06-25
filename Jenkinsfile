pipeline {
    agent any 
    stages {
        stage('pullfromscm') {
            steps {
                sh 'git clone https://github.com/SahooSecOps/test1.git'
            }
        }
        stage('build') {
            steps {
                sh 'docker build -t test .'
            }
        }
        stage('tag') {
            steps {
                sh 'docker tag  test localhost:5001/test:r1'
            }
        }
        stage('push') {
            steps {
                sh 'docker push localhost:5001/test:r1'
            }
        }
    }
}
