#!/bin/bash
. ./lab_env.sh
#config=`cat project/config.yml | grep -m1  "\- id:"|cut -d " " -f  3`

while [ "$APPLY" !=  "Y" ]
do
        clear
        echo "Variables : "
        echo ""
        echo "0) export DT_TENANT_URL="$DT_TENANT_URL
        echo "1) export DT_API_TOKEN="$DT_API_TOKEN
        echo "2) export Appname="$Appname
        echo "3) export Hostname="$Hostname
        echo "4) export Email="$Email
        echo "5) project/config.yaml, create a unique -id: "$config 
        echo "A) Apply the configuration (Ctrl/c to quit)"
        echo ""
        sleep 0.2
        read  -p "Input Selection (0, 1, 2, 3, 4, 5 or A ): " reponse

        case "$reponse" in
                "0") read  -p "0) export DT_TENANT_URL=https://" value
                     sed -i 's/DT_TENANT_URL=.*$/DT_TENANT_URL=\"https\:\/\/'$value'\"/g' ./lab_env.sh;. ./lab_env.sh
                ;;
                "1") read  -p "1) export DT_API_TOKEN=" value
                     sed -i s/DT_API_TOKEN=.*$/DT_API_TOKEN=\"$value\"/g ./lab_env.sh;. ./lab_env.sh
                ;;
                "2") read  -p "2) export Appname=" value
                     sed -i s/Appname=.*$/Appname=\"$value\"/g ./lab_env.sh;. ./lab_env.sh
                ;;
                "3") read  -p "3) export Hostname=" value
                     sed -i s/Hostname=.*$/Hostname=\"$value\"/g ./lab_env.sh;. ./lab_env.sh
                ;;
                "4") read  -p "4) export Email=" value
                     sed -i s/Email=.*$/Email=\"$value\"/g ./lab_env.sh;. ./lab_env.sh
                ;;
                "5") if [[ $config-id == "id" ]];then
                      config=`uuidgen`
                      sed -i "s/config-id/$config/g" project/config.yml
                      sed -i "s/config-id=id/config-id=$config/g" ./lab_env.sh;. ./lab_env.sh
                     fi
                     
                ;;
                "A") APPLY="Y"
                     . ./lab_env.sh
                ;;
        esac
done
echo "to apply the variables run:   . lab_env.sh"
echo "and deploy monaco :           ./monaco deploy manifest.haml"
