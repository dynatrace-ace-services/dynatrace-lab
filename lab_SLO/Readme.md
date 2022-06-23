# Deploy SLO for Management Zone

Export the variable:

	 export MyTenant=<MyTenant>
	 export MyToken=<MyToken>
	 export MZ=<MZ-name>
	 export SliPerf=500

Deploy the configuration:

	cd;cd quickstart-ace-configurator;
	./monaco deploy -e=environments.yaml SLO/deploy-step1
	./monaco deploy -e=environments.yaml SLO/deploy-step2
