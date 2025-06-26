pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                script {
                    def projectDir = 'streak-ai'
                    if (fileExists(projectDir)) {
                        echo "Directory ${projectDir} exists. Deleting..."
                        sh "rm -rf ${projectDir}"
                    }
                }
                sh 'git clone git@github.com:SahooSecOps/streak-ai.git'
            }
        }
        stage('build') {
            steps {
                 sh ' docker build -t streakai .'
            }
        }
        stage('tag') {
            steps {
                 sh ' docker tag  streakai localhost:5001/streakai:r1'
            }
        }
        stage('push') {
            steps {
                 sh ' docker push localhost:5001/streakai:r1'
            }
        }
        stage('run container') {
            steps {
                 sh 'docker rm -f streakai && docker run -d -p 5000:5000   --name streakai  localhost:5001/streakai:r1 && sleep 5 && curl localhost:5000 && docker rm -f streakai'
            }
        }
        stage('Test') {
            steps {
                 script {
                     def status = sh(script: './test_api.sh', returnStatus: true)
                     if (status != 0) {
                         error("API test failed!")
                     }
                }
        }
        
      }
        stage('deploy to k8s') {
            steps {
                    sh '''
                        kubectl apply -f ./app.yaml
                        kubectl rollout restart deploy streak-ai -n workspace
                        kubectl rollout status deploy streak-ai -n workspace
                   '''
                }
        }
    }
    
    post {
         success {
             
                 sh ' docker rm -f streakai'
        }
         failure {
             
                 sh ' docker rm -f streakai'
        }
        
    }
}

