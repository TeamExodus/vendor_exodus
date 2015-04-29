for combo in $(curl -s https://raw.githubusercontent.com/TeamExodus/exodus-devices/EXODUS-5.1/exodus-build-targets | sed -e 's/#.*$//' | grep exodus-5.1 | awk {'print $1'})
do
    add_lunch_combo $combo
done
