#login to openshift cluster
oc login -u developer -p developer

# create new project for 'helloworld' application release 'v1' 
oc new-project helloworld-v1-it

#oc project helloworld-v1-it


oc get dc,svc,route,is -o=yaml  --export -l app=helloworld,release=v1,environment=dev > state.yaml

# Process Release Management Template to create a release for helloworld v1. This will create a "helloworld-v1-dev-rollout" pipeline in cluster to deploy a helloworld application in cluster.

sed -i 's/namespace:.*//g' state.yaml
sed -i 's/clusterIP:.*//g' state.yaml
sed -i 's/host:.*//g' state.yaml
oc apply -f state.yaml