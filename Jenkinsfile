pipeline {
    agent none

    stages {
        /*
        stage('Setup Release') {
            agent{
                docker{
                    image 'openshift/origin-cli'
                    label 'docker-agent'
                }
            }
            steps {
                echo 'Setting up release management pipelines for "${APP_NAME}"-"${RELEASE_NAME}" '
                sh 'ls -lrst'
                // Login to OpenShift Cluster
                //TODO : Credentials are currently hardcoded for Demo, these should be parameterized
                sh 'oc login "${OPENSHIFT_CLUSTER_URL}" -u developer -p developer  --insecure-skip-tls-verify'

                //Create Project for Application Release
                sh 'oc new-project "${APP_NAME}"-"${RELEASE_NAME}"'

                // Run Jenkins pod to run OpenShift pipelines
                sh 'oc new-app jenkins-ephemeral'
                
                // Create Release Management Piplelines for project
                sh 'oc process -f release/release-management-setup-template.yaml --param-file=release/release.properties --ignore-unknown-parameters=true | oc create -f -'
                
            }
        }
        */

        stage('Setup Release') {
            agent any

            steps {
                script {
                    def props = readProperties  file: 'release/release.properties'
                    assert props['APP_NAME'] == 'helloworld'
                    sh 'echo $props["APP_NAME"]'
                }

                
            }
        }
    }

    
}