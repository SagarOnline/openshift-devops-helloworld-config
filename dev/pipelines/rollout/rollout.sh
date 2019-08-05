#login to openshift cluster
oc login -u developer -p developer

# create new project for 'helloworld' application release 'v1' 
oc new-project helloworld-v1-dev

# Run Jenkins pod inside the project. It is used to run pipeline which builds application.
oc new-app jenkins-ephemeral


# Process Release Management Template to create a release for helloworld v1. This will create a "helloworld-v1-dev-rollout" pipeline in cluster to deploy a helloworld application in cluster.
oc process -f dev/pipelines/rollout/application-template.yaml --param-file application.properties --ignore-unknown-parameters=true | oc apply -f -
