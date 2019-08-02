pipeline {
    agent none

    stages {
        stage('Setup Release') {
            agent{
                docker{
                    image 'openshift/origin-cli'
                    label 'docker-agent'
                }
            }
            steps {
                script{
                    sh 'ls -lrst'

                    def props = readProperties  file: 'application.properties'

                    echo "Setting up release management pipelines for $props.APP_NAME-dev "

                    // Login to OpenShift Cluster
                    //TODO : Credentials are currently hardcoded for Demo, these should be parameterized
                    sh "oc login $props.OPENSHIFT_CLUSTER_URL -u developer -p developer  --insecure-skip-tls-verify"

                    //Create Project for Application in Dev environment
                    sh "oc new-project $props.APP_NAME-dev"

                    // Run Jenkins pod to run OpenShift pipelines
                    sh 'oc new-app jenkins-ephemeral'
                    
                    // Setup Application Dev Environment
                    
                    sh 'oc process -f dev/application-template.yaml --param-file application.properties --ignore-unknown-parameters=true | oc apply -f -'
                }
            }
        }

        /*
        stage('Setup Release') {
            agent any

            steps {
                script {
                    def props = readProperties  file: 'release/release.properties'
                    assert props['APP_NAME'] == 'helloworld'
                    sh "mkdir $props.APP_NAME"
                    sh 'ls -lrst'
                }

                
            }
        }
        */
    }

    
}