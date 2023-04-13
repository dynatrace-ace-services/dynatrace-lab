#  Dynatrace Lab - Monitoring as Code with Monaco v2

![image](https://user-images.githubusercontent.com/40337213/145724361-890e0ba2-80ce-4b80-bd2b-ce8fd313180e.png)

In this lab you will import all the configurations with [monaco-V2](https://www.dynatrace.com/support/help/manage/configuration-as-code) : 
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

Monaco can be installed anywhere, on your desktop : linux, windows, or on a tooling k8s, but never on an application host ! (except during this training)

## Step 1 : clone this git

    cd
    git clone https://github.com/dynatrace-ace-services/dynatrace-lab
    echo "end step 1"
    

## Step 2 : install monaco V2

    cd;cd dynatrace-lab/
    curl -L https://github.com/Dynatrace/dynatrace-configuration-as-code/releases/latest/download/monaco-linux-amd64 -o monaco
    chmod +x monaco
    echo "end step 2"
    
## Step 3 : set the variables 

use this script to set the variables on linux environment  

    sh set_the_variables.sh
    echo "end step 3"

OR open the file `lab_env.sh` and configure the variables manually
    
    vim lab_env.sh
    echo "end step 3"
     
## Step 4 : deploy with monaco 

    . lab_env.sh
    ./monaco deploy -c manifest.yaml -p project_deploy1
    sleep 5
    ./monaco deploy -c manifest.yaml -p project_deploy2
    echo "end step 4"

## Step 5 (optional) : backup with monaco 

    cd;cd dynatrace-lab/template_monaco_v2
    mkdir backup
    ./monaco download manifest.yaml -e MyEnv -o backup
    echo "end step 5"
