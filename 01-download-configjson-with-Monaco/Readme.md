# 01-download-configjson-with-Monaco  
You will backup all the configuration file of the Dynatrace Saas tenant
   
1) your variables seen in the previous step  

	   export NEW_CLI=1
	   export MyTenant=<YYYY>.live.dynatrace.com
	   export MyToken=<dt.1234567890>
    
    
2) validate the main variables for monaco   

       echo "NEW_CLI="$NEW_CLI;echo "MyTenant=https://"$MyTenant;echo "MyToken="$MyToken

3) start with a backup of the configuration    
 monaco will backup your main Dynatrace configuration  
 the directory **free_trial** is created localy (lab_monaco/free_trial) with all you json configuration files exported.  
 
       cd;cd dynatrace-lab-onboarding;
       ./monaco download -e=environments.yaml mydownload
 
 - look at the configuration types backuped by monaco   

       cd;cd dynatrace-lab-onboarding;
       ls -lrt mydownload/free_trial

# Next Step

- [02-deploy-configjson-with-Monaco](https://github.com/dynatrace-ace-services/dynatrace-lab-onboarding/tree/main/02-deploy-configjson-with-Monaco) => to deploy all the configuration for easytravel on your tenant  

       
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


