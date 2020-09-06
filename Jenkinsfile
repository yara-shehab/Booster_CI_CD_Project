 pipeline {
    agent {label 'slave'}
    stages {

        stage('build image') {
            steps {
          
              sh 'docker build -t yarashehab/djangoapp:v1.0 .'
            }
            }

        stage('push image') {
            steps {
              withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
              sh 'docker login --username $USERNAME --password $PASSWORD'
              
              sh 'docker push yarashehab/djangoapp:v1.0'
              }
            }
        }

        stage('deploy') {
          steps {
            sh 'docker run -d -p 8000:8000 yarashehab/djangoapp:v1.0'
        }
        }
    }

    post {
      success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }

      failure {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }

      aborted {
      slackSend (color: '#000000', message: "ABORTED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
      }
    }
}
