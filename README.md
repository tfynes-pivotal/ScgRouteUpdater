# ScgRouteUpdater

Bash script to leverage the Tanzu Spring Cloud Gateway API support for route updating

Usage: updateRoute.sh <SCG-SI> <APP-NAME> <NewRouteConfig>


e.g.

	SpringCloud Gateway - Service instance name = hpgw

	Facaded Application name = hp

old route configuration: 
	'{"routes": [{"path": "/hp/**"}]}'

new route configuration:
	'{"routes": [ {"path": "/**", "filters": ["StripPrefix=1"]}]}'


./updateRoute.sh hpgw hp '{"routes": [ {"path": "/**", "filters": ["StripPrefix=1"]}]}'
