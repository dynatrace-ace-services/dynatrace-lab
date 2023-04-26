#!/bin/bash
. ./env.sh
info_var=''
info_monaco=''

while [ "$APPLY" !=  "Y" ]
do
        clear
        echo "Variables : "
        echo ""
        echo "0) export DT_TENANT_URL="$DT_TENANT_URL
        echo "1) export DT_API_TOKEN="$DT_API_TOKEN
        echo "2) export HostGroupName="$HostGroupName
        echo "3) export DomainName="$DomainName
        echo "4) export Email="$Email
        echo $info_var
        ####################################################
        echo "A) ./monaco download manifest -e MyEnv"
        echo "B) ./monaco deploy manifest"
        echo "C) ./monaco delete"
        echo $info_monaco
        echo "Q) Quit (or Ctr+C)"
        echo ""
        sleep 0.2
        read  -p "Input Selection (0, 1, 2, 3, 4 or A, B, C, Q ): " reponse

        case "$reponse" in
                "0") read  -p "0) export DT_TENANT_URL=https://" value
                     sed -i 's/DT_TENANT_URL=.*$/DT_TENANT_URL=\"https\:\/\/'$value'\"/g' ./env.sh;. ./env.sh
                     info_var="=> Var DT_TENANT_URL has been set for the manifest.yaml"
                ;;
                "1") read  -p "1) export DT_API_TOKEN=" value
                     sed -i s/DT_API_TOKEN=.*$/DT_API_TOKEN=\"$value\"/g ./env.sh;. ./env.sh
                     info_var="=> Var DT_API_TOKEN has been set for the manifest.yaml"
                ;;
                "2") read  -p "2) export HostGroupName=" value
                     sed -i s/HostGroupName=.*$/HostGroupName=\"$value\"/g ./env.sh;. ./env.sh
                     if [[ ! -f ./project/config.yml.old ]]; then
                        mv project/config.yml project/config.yml.ref
                        mv delete.yaml delete.yaml.ref
                     fi
                     sed "s/config-id/$HostGroupName/g" project/config.yml.ref > project/config.yml
                     sed "s/config-id/$HostGroupName/g" delete.yaml.ref > delete.yaml
                     info_var= "=> Var HostGroupName has been set for ManagementZone, AlertingProfile, MaintenanceWindow \n => File : project/config.yml has a unique id: "$HostGroupName" \n File : delete has been modify for id : "$HostGroupName
                ;;
                "3") read  -p "3) export DomainName=" value
                     sed -i s/DomainName=.*$/DomainName=\"$value\"/g ./env.sh;. ./env.sh
                     info_var= "=> Var DomainName has been set for application ans dashbaord markrdown"
                ;;
                "4") read  -p "4) export Email=" value
                     sed -i s/Email=.*$/Email=\"$value\"/g ./env.sh;. ./env.sh
                     info_var= "=> Var Email has been set for dashboard owner and email notification"
                ;;
                #############################################################
                "A") read  -p "A) Backup json config> ./monaco download manifest -e MyEnv  [Y/N]" value
                   if [[ ${value^} = Y ]]; then
                     ./monaco download manifest.yaml -e MyEnv
                     info_monaco = "Json config has been downloaded on the local host with monaco v2"
                   fi
                ;;
                "B") read  -p "B) Deploy json config> ./monaco deploy manifest  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                     ./monaco deploy manifest.yaml
                      info_monaco = $HostGroupName" config has been deployed on your tenant "$DT_TENANT_URL
                   fi
                ;;
                "C") read  -p "C) Delete json config> ./monaco delete  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                     ./monaco delete
                     info_monaco = $HostGroupName" config has been deleted on your tenant "$DT_TENANT_URL
                   fi
                ;;
                "Q") APPLY="Q"

                      echo "Go to dynatrace UI configuration : "
                      echo "- project/config.yml, is configured with the unique id: "$HostGroupName
                      echo
                ;;
        esac
done
echo "Let's start deployment for "$HostGroupName
echo " - export the variables on local session:      . env.sh"
echo " - deploy json configurations with monaco:     ./monaco deploy manifest.yaml"
echo " - backup json configurations with monaco:     ./monaco download manifest.yaml -e MyEnv"
echo " - (optional) delete config with monaco:       ./monaco delete"

