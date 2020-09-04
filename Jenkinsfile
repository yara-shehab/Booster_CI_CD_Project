 stages {
        stage('Preparation') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Ayman1231/Booster_CI_CD_Project/find/master'
            }
         stage('Preparation') {
            steps {
                // checkout the code
                git 'https://github.com/yara-shehab/Booster_CI_CD_Project'
            }
           stage('build') {
            steps {
                // build the docker 
                sh 'docker build -f Dockerfile . -t Dockerfile'
            }
            stage('push') {
            steps {
                withCredentials([usernamePassword(credentialId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")])
                {
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'docker push Dockerfile' 
                }
            }
            
            stage('deploy') {
            steps {
                // 
                sh 'docker run -d -p 7070:8000 Dockerfile'
            }

            post {
                    sucess
                    {}
                    failure
                    {}
                    aborted
                    {}
                 }
            }
        }
    }
}
