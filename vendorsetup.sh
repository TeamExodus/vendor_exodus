while read combo
do
        echo -e "combo='${combo}'" >null
        if [[ "$combo" =~ \#.* ]];then
           echo $combo >null
        else
            add_lunch_combo $combo
        fi
done <vendor/exodus/devices/exodus-build-targets
