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
                sh 'ls -lrst'
                //sh 'oc login https://2886795352-8443-cykoria05.environments.katacoda.com:443 -u admin -p admin --insecure-skip-tls-verify'
                //sh 'oc new-project helloworld-v1'
                //sh 'oc new-app jenkins-ephemeral'
                //sh 'oc apply -f https://raw.githubusercontent.com/SagarOnline/openshift-devops-simple-global-config/master/release/release-management-template.yaml'
                
                
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