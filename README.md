#  Dynatrace Lab - Monitoring as Code with Monaco v2

![image](https://user-images.githubusercontent.com/40337213/145724361-890e0ba2-80ce-4b80-bd2b-ce8fd313180e.png)

In this lab you will import all json configurations with [monaco v2](https://www.dynatrace.com/support/help/manage/configuration-as-code) : 
We will use the lab VM as a tooling host and not as an application host.      

    application-web
    app-detection-rule
    management-zone
    autotag
    alerting-profile
    notification
    maintenance-window
    host-naming
    processgroup-naming
    sevice-naming
    dashboard
    

## Step 0 : a tool host for monaco 

    Monaco can be installed anywhere, on your desktop : linux, windows, or on a tooling k8s, but never on an application host! 
    (except during this training)

## Step 1 : clone this git  

    cd
    git clone https://github.com/dynatrace-ace-services/dynatrace-lab
    echo "the lab is copy here "`pwd`"/dynatrace-lab"
    

## Step 2 : install monaco V2

    cd;cd dynatrace-lab/
    curl -L https://github.com/Dynatrace/dynatrace-configuration-as-code/releases/latest/download/monaco-linux-amd64 -o monaco
    chmod +x monaco
    echo "monaco v2 is installed on your host"
    
## Step 3 : my first deployment with monaco v2 
use this script to configure the variables on linux environment  

    cd;cd dynatrace-lab
    sh my_first_deployment_with_monaco_v2.sh

