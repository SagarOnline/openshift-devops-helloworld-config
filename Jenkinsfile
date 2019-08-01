pipeline {
    agent any

    stages {
        
        stage('Build') {
            agent{
                docker{
                    image 'openshift/origin-cli'
                    label 'oc'
                }
            }
            steps {
                echo 'Building..'
                 echo 'oc version'
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