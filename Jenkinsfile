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
                 sh 'oc login https://2886795352-8443-cykoria05.environments.katacoda.com:443 -u admin -p admin --insecure-skip-tls-verify'
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