# Deploy SLO for Management Zone

Export the variable:

	 export MyTenant=<MyTenant>
	 export MyToken=<MyToken>
	 export MZ=<MZ-name>
	 export SliPerf=500

Deploy the configuration:

	cd;cd dynatrace-lab/lab-onboarding;
	./monaco deploy -e=environments.yaml SLO/deploy-step1
	./monaco deploy -e=environments.yaml SLO/deploy-step2
