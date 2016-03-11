while read device
do
        echo -e "device='${device}'" >null
        if [[ "$device" =~ \#.* ]];then
           echo $device >/dev/null
        else
            add_lunch_combo exodus_$device-user
            add_lunch_combo exodus_$device-userdebug
        fi
done <vendor/exodus/devices/exodus-build-targets
