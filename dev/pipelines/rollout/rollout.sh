#!/bin/bash

oc login -u developer -p developer

devProjectName="helloworld-v1-dev"

oc get project > projects.txt
projects=$(<projects.txt)

if [[ $projects == *$devProjectName* ]]; then
  oc project $devProjectName
else
    oc new-project $devProjectName
fi

# create new project for 'helloworld' application release 'v1' 
#oc new-project helloworld-v1-dev
oc get dc > deployments.txt
deployments=$(<deployments.txt)
if [[ $deployments == *"jenkins"* ]]; then
  echo "jenkins-ephemeral already present"
else
    oc new-app jenkins-ephemeral
fi

oc process -f dev/pipelines/rollout/application-template.yaml --param-file application.properties --ignore-unknown-parameters=true | oc replace -f -
