 pipeline {
    agent {label 'slave'}
    stages {

        stage('build image') {
            steps {
             
             sh 'chmod 666 /var/run/docker.sock
              sh 'docker build -t djangoapp .'
            }
            }

        stage('push image') {
            steps {
              withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
              sh 'docker login --username $USERNAME --password $PASSWORD'
              sh 'docker push djangoapp'
              }
            }
        }

        stage('deploy') {
          steps {
            sh 'docker run -d -p 7070:8000 djangoapp'
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
