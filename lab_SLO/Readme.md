# Deploy SLO for Management Zone

Export the variable:

	 export MyTenant=<MyTenant>
	 export MyToken=<MyToken>
	 export MZ=<MZ-name>
	 export SliPerf=500

Deploy the configuration:

	cd;cd dynatrace-lab;
	./monaco deploy -e=environments.yaml lab_SLO/deploy-step1
	./monaco deploy -e=environments.yaml lab_SLO/deploy-step2
