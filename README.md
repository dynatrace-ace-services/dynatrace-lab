#  Dynatrace Lab - Monitoring as Code with Monaco v2
## Automated app onboardings
![image](https://user-images.githubusercontent.com/40337213/234709083-8521cd8d-001d-4cdb-ad79-bda704477057.png)

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

![image](https://user-images.githubusercontent.com/40337213/234709653-0d377eea-7bf7-4bac-b49c-bf5b19414a89.png)

    - Set the variables
    - Run monaco backup
    - Run monaco deploy
    - Validate new configuration in Dynatrace UI
    (optional run monaco delete)

## Step 4 (optional) : redeploy specific management-zone configuration from backup json 

download mz configuration 

    cd;cd dynatrace-lab
    . env.sh
    ./monaco download manifest.yaml -e MyEnv -a management-zone -o backup-mz
    
modifiy config.yaml for mz

    cd backup-mz/project_MyEnv/management-zone
    nano config.yaml

keep only your id in this file (delete the ohers) and change the name like here : 
    
    delete the id section dfferent to your managament-zone
    rename your management-zone
    
![image](https://user-images.githubusercontent.com/40337213/231716709-8bf56d5c-df96-4b50-95b2-9ed2a8a8f577.png)

 redeploy 
    
    cd;cd dynatrace-lab/backup-mz
    ../monaco deploy manifest.yaml
    
On Dynatrace UI, verify that you have a new management zone : `My_easytravelXX`, similair to the previous one `lab_easytravelxx`

    echo "Go to the mz settings on the UI : "$DT_TENANT_URL"/ui/settings/builtin:management-zones"
