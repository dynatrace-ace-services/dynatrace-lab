# 02-deploy-configjson-with-Monaco

In this lab we will import these configurations in your Dynatrace environment.  

You will import :  
- application-web 
- app-detection-rule 
- management-zone
- autotag
- alerting-profile 
- notification
- maintenance-window
- host-naming
- processgroup-naming
- sevice-naming
- dashboard

1) your variables  
	   
	   export NEW_CLI=1
	   export MyTenant=<YYYY>.live.dynatrace.com
	   export MyToken=<dt.1234567890>
	   export Appname=easytravel<XX>
	   export Hostname=dynatracelab<XX>.<AzureRegion>.cloudapp.azure.com
	   export Email=<your email of Dynatrace saas tenant connection>

  
2) validate the env variables 

       echo "NEW_CLI="$NEW_CLI;echo "MyTenant=https://"$MyTenant;echo "MyToken="$MyToken;echo "Appname="$Appname;echo "Hostname="$Hostname;echo "Email="$Email 


3) deploy the configuration 

       cd;cd dynatrace-lab-onboarding;
       ./monaco deploy -e=environments.yaml -s=free_trial 02-deploy-configjson-with-Monaco
       
# Result  
verify on your Dynatrace tenant the result of the imported configurations  
 
- **application-web and app-detection-rule** : _Settings > Web and mobile monitoring > Application detection_ 
![image](https://user-images.githubusercontent.com/40337213/116122980-b6763b00-a6c2-11eb-93f3-dde596728237.png)

- **management-zone** : _Settings > Preferences > Management Zones_ 
![image](https://user-images.githubusercontent.com/40337213/115960930-6c4f5700-a514-11eb-9b6d-952b86a17730.png)

- **autotag** : _Settings > Tags > Automatically applied tags_
![image](https://user-images.githubusercontent.com/40337213/115961025-e2ec5480-a514-11eb-9e7d-667f54ebf7a3.png)

- **alerting-profile** : _Settings > Alerting > Alerting profiles_
![image](https://user-images.githubusercontent.com/40337213/115961162-7c1b6b00-a515-11eb-9df8-69bec4a2c8ad.png)

- **notifiaction** : _Settings > Integration > Integrate Dynatrace with 3rd party systems_
![image](https://user-images.githubusercontent.com/40337213/115961294-1b406280-a516-11eb-83ec-689b7ccd90ee.png)

- **maintenance-window** : _Settings > Maintenance windows for monitoring, alerting and availability_
![image](https://user-images.githubusercontent.com/40337213/115961411-7a9e7280-a516-11eb-99eb-58d258e7a9f6.png)

- **host-naming** : _Settings > Monitoring > Host naming_  
 Click on Preview botton to display the result of this configuration 
![image](https://user-images.githubusercontent.com/40337213/116593772-c0e24000-a921-11eb-849b-849ee7050113.png)

- **processgroup-naming** : _Settings > Processes and containers > Process group naming_  
Click on Preview botton to display the result of this configuration 
![image](https://user-images.githubusercontent.com/40337213/116593829-d0618900-a921-11eb-951d-bbf3de4bcca1.png)

- **sevice-naming** : _Settings > Server-side service monitoring > Custom service detection_  
Click on Preview botton to display the result of this configuration 
![image](https://user-images.githubusercontent.com/40337213/116593961-fab34680-a921-11eb-896b-38852940446e.png)

- **My awesome dasboard for easytravel !** 
 Find your Dahsboard in the menu _Dashboard
 If your Dashboard is not here, click on *Show all tenant dashbords*.  
![image](https://user-images.githubusercontent.com/40337213/116607293-19213e00-a932-11eb-9d12-a26173a4a7e7.png)

Dynatrace dashboards : you can find more smart dashboards on bizopsconfigurator which is Open Source Software with a GitOps approach. 
And later you could share your own awesome dashboards on this plateform ==> [bizopsconfigurator](https://dynatrace.github.io/BizOpsConfigurator/index.html#miscTools)  


# Troubleshoot  
If the downlaod doesn't work, verify thes configurations :   

| Step  | test |Status |
| --------------- | --------------- | --------------- | 
| export NEW_CLI=1 | echo "NEW_CLI="$NEW_CLI  | ✔️ |
| export MyTenant=<YYYY>.live.dynatrace.com | echo "MyTenant=https://"$MyTenant  | ✔️ |
| export MyToken=<dt.1234567890>| echo "MyToken="$MyToken | ✔️ |
| MyToken is an API Token| with all the privileges | ✔️ |
| OneAgent installed with host-group=appname | service oneagent status | ✔️ |
| easytravel installed and started (accessible from your browser) | docker ps --format "{{.ID}}\t{{.Status}}\t{{.Names}}" | ✔️ |
| cd;git clone https://github.com/dynatrace-ace-services/dynatrace-lab-onboarding (this lab) | cd;ls -lrt dynatrace-lab-onboarding | ✔️ |
| monaco installed with NEW_CLI=1 (new monaco cli version) | cd;cd dynatrace-lab-onboarding;./monaco --version  | ✔️ |
| monaco download -e=environments.yaml mydownload (for backup) | cd;ls -lrt dynatrace-lab-onboarding/mydownload/free_trial | ✔️ |
       
