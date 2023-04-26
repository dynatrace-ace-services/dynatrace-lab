#!/bin/bash
. ./env.sh
info=''

if [[ ! -f ./project/config.yml.ref ]]; then
  mv project/config.yml project/config.yml.ref
  mv delete.yaml delete.yaml.ref
fi
sed "s/config-id/$HostGroupName/g" project/config.yml.ref > project/config.yml
sed "s/config-id/$HostGroupName/g" delete.yaml.ref > delete.yaml

while [ "$APPLY" !=  "Y" ]
do
        clear
        echo "my_first_deployment_with_monaco_v2.sh"
        echo ""
        echo "Set variables"
        echo "0) export DT_TENANT_URL="$DT_TENANT_URL
        echo "1) export DT_API_TOKEN="${DT_API_TOKEN:0:32}"*****"
        echo "2) export HostGroupName="$HostGroupName
        echo "3) export DomainName="$DomainName
        echo "4) export Email="$Email
        echo " #####################"
        echo "Run monaco"
        echo "A) Backup json config> ./monaco download manifest -e MyEnv"
        echo "B) Deploy json config> ./monaco deploy manifest"
        echo "C) Delete json config> ./monaco delete"
        echo " #####################"
        echo "Q) Quit or run monaco manually"
        echo "## info => "$info 
        sleep 0.2
        read  -p "Input Selection (0, 1, 2, 3, 4 or A, B, C, Q ): " reponse

        case "$reponse" in
                "0") read  -p "0) export DT_TENANT_URL=https://" value
                     sed -i 's/DT_TENANT_URL=.*$/DT_TENANT_URL=\"https\:\/\/'$value'\"/g' ./env.sh;. ./env.sh
                     export info="DT_TENANT_URL has been set for the manifest.yaml - example : https://abcdd.live.dynatrace.com.com"
                ;;
                "1") read  -p "1) export DT_API_TOKEN=" value
                     sed -i s/DT_API_TOKEN=.*$/DT_API_TOKEN=\"$value\"/g ./env.sh;. ./env.sh
                     export info="DT_API_TOKEN has been set for the manifest.yaml - example : dt.ABCDEFGH.0123456789"
                ;;
                "2") read  -p "2) export HostGroupName=" value
                     sed -i s/HostGroupName=.*$/HostGroupName=\"$value\"/g ./env.sh;. ./env.sh
                     sed "s/config-id/$HostGroupName/g" project/config.yml.ref > project/config.yml
                     sed "s/config-id/$HostGroupName/g" delete.yaml.ref > delete.yaml
                     export info="HostGroupName is used by ManagementZone, AlertingProfile, MaintenanceWindow - example : <env>_<app> & the file project/config.yml has a unique id: "$HostGroupName
                ;;
                "3") read  -p "3) export DomainName=" value
                     sed -i s/DomainName=.*$/DomainName=\"$value\"/g ./env.sh;. ./env.sh
                     export info="DomainName is used by application and dashbaord markdown - example : mydomain.com"
                ;;
                "4") read  -p "4) export Email=" value
                     sed -i s/Email=.*$/Email=\"$value\"/g ./env.sh;. ./env.sh
                     export info="Email is used by dashboard owner and email notification - example : myemail@mail.com"
                ;;
                #############################################################
                "A") read  -p "A) ./monaco download manifest -e MyEnv  [Y/N]" value
                   if [[ ${value^} = Y ]]; then
                     echo
                     echo "./monaco download manifest.yaml -e MyEnv"
                     ./monaco download manifest.yaml -e MyEnv
                     export info="all json config has been downloaded on the local host with monaco v2"
                     read  -p "Press any key to continue " pressanycase
                   fi
                ;;
                "B") read  -p "B) ./monaco deploy manifest  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                      echo
                      echo "./monaco deploy manifest.yaml"
                      ./monaco deploy manifest.yaml
                      export info=$HostGroupName" config has been deployed on your tenant "$DT_TENANT_URL
                      read  -p "Press any key to continue " pressanycase
                   fi
                ;;
                "C") read  -p "C) ./monaco delete  [Y/N]" value
                   if [[ "$value" = "Y" ]] || [[ "$value" = "y" ]]; then
                      echo
                      echo "./monaco delete"
                      ./monaco delete
                      export info=$HostGroupName" config has been deleted on your tenant "$DT_TENANT_URL
                      read  -p "Press any key to continue " pressanycase
                   fi
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
                        echo "if you want to sse monaco configuration files:"
                        echo " - cat manifest.yaml"
                        echo " - more project/config.yml"
                        echo " - ls -lrt project"
                        echo " - cat delete.yaml"
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
                        echo " - dashboard: $DT_TENANT_URL/ui/dashboards?showAll=true&filters=owner%3D"$Email
                ;;
        esac
done

