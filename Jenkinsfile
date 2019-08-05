pipeline {
    agent none

    stages {

        stage('Update Application Resources') {
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
                    

                    // Login to OpenShift Cluster
                    //TODO : Credentials are currently hardcoded for Demo, these should be parameterized
                    sh "oc login $props.OPENSHIFT_CLUSTER_URL -u developer -p developer  --insecure-skip-tls-verify"

                    def projectName = "$props.APP_NAME-$props.RELEASE_NAME-dev"
                    echo "Setting up release management pipelines for $projectName "
                    sh "oc get project > projects.txt"
                    if (!readFile("projects.txt").contains(projectName)){
                        //Create Project for Application in Dev environment
                        sh "oc new-project $props.APP_NAME-$props.RELEASE_NAME-dev"
                    }

                    sh "oc get dc > deployments.txt"
                    if (!readFile("deployments.txt").contains("jenkins")){
                        // Run Jenkins pod to run OpenShift pipelines
                        sh 'oc new-app jenkins-ephemeral'
                    }

                    // Setup Application Dev Environment
                    
                    sh 'oc process -f dev/application-template.yaml --param-file application.properties --ignore-unknown-parameters=true | oc apply -f -'
                }
            }
        }
    }
}