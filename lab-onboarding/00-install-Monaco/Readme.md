# 00-install-Monaco
		   
1) download the lab  
Copy the command with the copy button in the left corner.  
Paste the command on you VM.  


       cd;
       git clone https://github.com/dynatrace-ace-services/dynatrace-lab.git;
       ls;

2) download monaco (monaco-linux-amd64 -more distrib [here](https://github.com/dynatrace-oss/dynatrace-monitoring-as-code/releases/))  

       cd;cd dynatrace-lab/lab-onboarding;
       curl -L https://github.com/dynatrace-oss/dynatrace-monitoring-as-code/releases/download/latest/monaco-linux-amd64 -o monaco;
       chmod +x monaco;
       ls;

3) new version NEW_CLI=1   
In this lab we will use only the new cli version of monaco.  
click [here](https://github.com/dynatrace-oss/dynatrace-monitoring-as-code#experimental-new-cli) for documentation   

       export NEW_CLI=1;
       cd;cd dynatrace-lab/lab-onboarding;
       ./monaco --version

- expected result 
![image](https://user-images.githubusercontent.com/40337213/116585744-fdf60480-a918-11eb-891a-8ee23dc1a5fb.png)

- to have more help 

      cd;cd dynatrace-lab/lab-onboarding;
      ./monaco -h

  ![image](https://user-images.githubusercontent.com/40337213/116579510-bd938800-a912-11eb-9ee9-ef5b32583d59.png)

4) use your API token   
as a reminder, you already have created an API Token,:  _Settings > Integration > Dynatrace API > Generate Token_   
you need these privileges at least  (more info about token permission for monaco [here)](https://github.com/dynatrace-oss/dynatrace-monitoring-as-code#supported-configuration-types-and-token-permissions):  
    <img src="https://user-images.githubusercontent.com/40337213/115959740-ffd15980-a50d-11eb-8f03-9bffeb0b1141.png" width="450" height="250">

5) the environment.yaml contains the configuration of your dynatrace tenants     
    <img src="https://user-images.githubusercontent.com/40337213/116117875-0520d680-a6bd-11eb-9085-acce6b56b395.png" width="600" height="100">   
  
	   export MyTenant=<YYYY>.live.dynatrace.com  (without **https://** and **/** at the end of the line)
	   export MyToken=<dt.1234567890>             (API Token)

# Next Step

- [01-download-with-Monaco](/lab-onboarding/01-download-with-Monaco) => to download your configuration and backup the json file

