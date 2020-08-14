#!/bin/bash

set -e

if [ "$#" -ne 3 ]; then
	echo "Usage: updateRoute.sh <SCG-SI> <APP-NAME> <NewRouteConfig>"
	exit 1;
fi

SINAME=$1
APPNAME=$2
ROUTECONFIG=$3

SIROUTE=$(cf service hpgw | grep dashboard | awk '{print $2}' | sed 's|\(.*\)/.*|\1|')
APPGUID=$(cf app $APPNAME --guid)
TOKEN=$(cf oauth-token)

curl -k -X PUT $SIROUTE/actuator/bound-apps/$APPGUID/routes -d "$ROUTECONFIG" -H "Authorization: $TOKEN"  -H "Content-Type: application/json"
