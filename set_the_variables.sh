#!/bin/bash
. ./lab_env.sh

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
        echo "A) apply  "
        echo ""
        sleep 0.1
        read  -p "Input Selection (0, 1, 2, 3, 4 or A): " reponse

        case "$reponse" in
                "0") read  -p "0) export DT_TENANT_URL=" value
                     sed -i s/DT_TENANT_URL=.*$/DT_TENANT_URL=\"$value\"/g ./lab_env.sh;. ./lab_env.sh
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
                "A") APPLY="Y"
        esac
done
echo "Great - the variables have been setted"
echo "end step 3"
