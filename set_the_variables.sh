#!/bin/bash
. ./env.sh
info_var='# => info var:'
info_monaco=' => info monaco:'

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
        echo 
        ####################################################
        echo "A) Backup json config> ./monaco download manifest -e MyEnv"
        echo "B) Deploy json config> ./monaco deploy manifest"
        echo "C) Delete json config> ./monaco delete"
        echo 
        echo "Q) Quit or run monaco manually"
        echo
        echo "## info => "$info 
        echo ""
        sleep 0.2
        read  -p "Input Selection (0, 1, 2, 3, 4 or A, B, C, Q ): " reponse

        case "$reponse" in
                "0") read  -p "0) export DT_TENANT_URL=https://" value
                     sed -i 's/DT_TENANT_URL=.*$/DT_TENANT_URL=\"https\:\/\/'$value'\"/g' ./env.sh;. ./env.sh
                     export info="var DT_TENANT_URL has been set for the manifest.yaml"
                ;;
                "1") read  -p "1) export DT_API_TOKEN=" value
                     sed -i s/DT_API_TOKEN=.*$/DT_API_TOKEN=\"$value\"/g ./env.sh;. ./env.sh
                     export info="var DT_API_TOKEN has been set for the manifest.yaml"
                ;;
                "2") read  -p "2) export HostGroupName=" value
                     sed -i s/HostGroupName=.*$/HostGroupName=\"$value\"/g ./env.sh;. ./env.sh
                     if [[ ! -f ./project/config.yml.old ]]; then
                        mv project/config.yml project/config.yml.ref
                        mv delete.yaml delete.yaml.ref
                     fi
                     sed "s/config-id/$HostGroupName/g" project/config.yml.ref > project/config.yml
                     sed "s/config-id/$HostGroupName/g" delete.yaml.ref > delete.yaml
                     export info="var HostGroupName has been set for ManagementZone, AlertingProfile, MaintenanceWindow \n => File : project/config.yml has a unique id: "$HostGroupName" \n File : delete has been modify for id : "$HostGroupName
                ;;
                "3") read  -p "3) export DomainName=" value
                     sed -i s/DomainName=.*$/DomainName=\"$value\"/g ./env.sh;. ./env.sh
                     export info_var="var DomainName has been set for application ans dashbaord markrdown"
                ;;
                "4") read  -p "4) export Email=" value
                     sed -i s/Email=.*$/Email=\"$value\"/g ./env.sh;. ./env.sh
                     export info_var="var Email has been set for dashboard owner and email notification"
                ;;
                #############################################################
                "A") read  -p "A) Backup json config> ./monaco download manifest -e MyEnv  [Y/N]" value
                   if [[ ${value^} = Y ]]; then
                     ./monaco download manifest.yaml -e MyEnv
                     export info_monaco="Json config has been downloaded on the local host with monaco v2"
                   fi
                     read  -p "Press any key to continue " pressanycase
                ;;
                "B") read  -p "B) Deploy json config> ./monaco deploy manifest  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                     ./monaco deploy manifest.yaml
                      export info_monaco=$HostGroupName" config has been deployed on your tenant "$DT_TENANT_URL
                   fi
                      read  -p "Press any key to continue " pressanycase
                ;;
                "C") read  -p "C) Delete json config> ./monaco delete  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                     ./monaco delete
                     export info_monaco=$HostGroupName" config has been deleted on your tenant "$DT_TENANT_URL
                   fi
                      read  -p "Press any key to continue " pressanycase
                ;;
                "Q") APPLY="Y"
                        echo
                        echo "if you want to run monaco manually:"
                        echo " - export the variables on local session:      . env.sh"
                        echo " - deploy json configurations with monaco:     ./monaco deploy manifest.yaml"
                        echo " - backup json configurations with monaco:     ./monaco download manifest.yaml -e MyEnv"
                        echo " - (optional) delete config with monaco:       ./monaco delete"
                        echo
                        echo
                        echo "validate the result on dynatrace UI : "
                        echo " - application-web : $DT_TENANT_URL/#uemapplications"
                        echo " - app-detection-rule: $DT_TENANT_URL/ui/settings/builtin:rum.web.app-detection"
                        echo " - management-zone: $DT_TENANT_URL/ui/settings/builtin:management-zones"
                        echo " - autotag: $DT_TENANT_URL/ui/settings/builtin:tags.auto-tagging"
                        echo " - alerting-profile: $DT_TENANT_URL/ui/settings/builtin:alerting.profile"
                        echo " - notification: $DT_TENANT_URL/ui/settings/builtin:problem.notifications"
                        echo " - maintenance-window: $DT_TENANT_URL/ui/settings/builtin:alerting.maintenance-window"
                        echo " - host-naming: $DT_TENANT_URL/#settings/hostnamingsetting"
                        echo " - processgroup-naming: $DT_TENANT_URL/#settings/pgnamingsettings"
                        echo " - sevice-naming: $DT_TENANT_URL/#settings/servicenamingsettings"
                        echo " - dashboard: $DT_TENANT_URL/ui/dashboards"
                ;;
        esac
done
echo "Let's start deployment for "$HostGroupName
