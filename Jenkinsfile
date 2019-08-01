pipeline {
    agent any

    stages {
        
        stage('Build') {
            agent{
                docker{
                    image 'openshift/origin-cli'
                    label 'docker-agent'
                }
            }
            steps {
                echo 'Building..'
                 sh 'oc explain -h'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying Test Again....'
            }
        }
    }
}