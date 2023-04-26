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
    
## Step 3 : set the variables 
use this script to configure the variables on linux environment  

    cd;cd dynatrace-lab
    sh set_the_variables.sh

validation  

    HostGroupName (mandatory, contains env & app)         = <env>_<application>
    DomainName (web application)                          = <domain>.<com>
    Email (to associate dashboard and email notification) = <name>@<idp.com> 
    A) to apply the configuration : env.sh & project/config.yml 

export the variables on the local session
    
    cd;cd dynatrace-lab
    . env.sh
     
## Step 4 : deploy with monaco V2

Show the config.yaml

    cd;cd dynatrace-lab
    more project/config.yml
    
Run monaco  

    cd;cd dynatrace-lab
    ./monaco deploy manifest.yaml

## Step 5 (optional) : backup with monaco 

    cd;cd dynatrace-lab
    ./monaco download manifest.yaml -e MyEnv

## Step 6 (optional) : redeploy specific management-zone configuration from backup json 

download mz configuration 

    cd;cd dynatrace-lab
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
    
