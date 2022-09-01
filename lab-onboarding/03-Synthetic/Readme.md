# Deploy Synthetic

Export the variable:

   export NEW_CLI=1
   export MyTenant=<YYYY>.live.dynatrace.com
   export MyToken=<dt.1234567890>
   export Appname=easytravel<XX>
   export Hostname=dynatracelab<XX>.<AzureRegion>.cloudapp.azure.com
   export Email=<your email of Dynatrace saas tenant connection>
   export EnableSynthetic=Yes


Deploy the click-path:

	cd;cd dynatrace-lab/lab-onboarding;
	./monaco deploy -e=environments.yaml 03-Synthetic/click-path


Deploy the http-monitor:

	cd;cd dynatrace-lab/lab-onboarding;
	./monaco deploy -e=environments.yaml 03-Synthetic/http-monitor