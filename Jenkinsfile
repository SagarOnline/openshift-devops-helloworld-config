pipeline {
    agent any

    stages {
        
        stage('Setup Release') {
            agent{
                docker{
                    image 'openshift/origin-cli'
                    label 'docker-agent'
                }
            }
            steps {
                echo 'Building..'
                sh 'ls -lrst'
                sh 'oc login https://2886795273-8443-cykoria05.environments-katacoda.com:443:443 -u admin -p admin --insecure-skip-tls-verify'
                sh 'oc new-project helloworld-v1'
                sh 'oc new-app jenkins-ephemeral'
                sh 'oc apply -f https://raw.githubusercontent.com/SagarOnline/openshift-devops-simple-global-config/master/release/release-management-template.yaml'
                sh 'oc process release-management-template --param-file=release/release.properties --ignore-unknown-parameters=true | oc create -f -'
                sh 'oc start-build helloworld-v1-dev-build'
                sh 'oc start-build helloworld-v1-dev-rollout'
                
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