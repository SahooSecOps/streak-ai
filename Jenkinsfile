pipeline {
    stages {
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
