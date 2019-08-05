#!/bin/bash

oc login -u developer -p developer

devProjectName = "helloworld-v1-dev"

oc get project > projects.txt
projects=$(<projects.txt)

if [[ $projects == *$devProjectName* ]]; then
  oc project $devProjectName
else
    oc new-project $devProjectName
fi

# create new project for 'helloworld' application release 'v1' 
#oc new-project helloworld-v1-dev

if [[ $projects == *"jenkins-ephemeral"* ]]; then
  echo "jenkins-ephemeral already present"
else
    oc new-app jenkins-ephemeral
fi
# Run Jenkins pod inside the project. It is used to run pipeline which builds application.

#oc new-app jenkins-ephemeral

# Process Release Management Template to create a release for helloworld v1. This will create a "helloworld-v1-dev-rollout" pipeline in cluster to deploy a helloworld application in cluster.
oc process -f dev/pipelines/rollout/application-template.yaml --param-file application.properties --ignore-unknown-parameters=true | oc apply -f -
