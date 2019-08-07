#!/bin/bash

oc login -u developer -p developer

devProjectName="helloworld-v1-dev"
itProjectName="helloworld-v1-it"

oc get project > projects.txt
projects=$(<projects.txt)

if [[ $projects == *$itProjectName* ]]; then
  oc project $itProjectName
else
    oc new-project $itProjectName
fi

oc project $devProjectName

oc get dc,svc,route,is -o=yaml  --export -l app=helloworld,release=v1 >state.yaml

sed -i 's/namespace:.*//g' state.yaml 
sed -i 's/clusterIP:.*//g' state.yaml
sed -i 's/host:.*//g' state.yaml
                    
                   
sed -i 's/annotations:*//g' state.yaml
sed -i 's/.*last-applied-configuration.*//g' state.yaml
sed -i 's/.*{\".*}//g' state.yaml
sed -i 's/.*host.generated.*//g' state.yaml
                    
oc project $itProjectName

oc apply -f state.yaml