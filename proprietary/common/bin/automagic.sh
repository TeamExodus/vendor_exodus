#!/sbin/sh
#
# Proactive handling of possible dirty-flash issues
#

export OUTFD=$(ps | grep -v "grep" | grep -o -E "update_binary(.*)" | cut -d " " -f 3); #BIG props to Chainfire
[ ! $OUTFD ] && export OUTFD=$(ps | grep -v "grep" | grep -o -E "/tmp/updater(.*)" | cut -d " " -f 3); #BIG props nuclearmistake for TWRP-izing
ui_print() { if [ $OUTFD ]; then echo "ui_print $*" 1>&$OUTFD; else echo $*; fi; return 0; }

# reset quickboot properties in case they're invalid, and because we're flashing a zip, so they're at LEAST irrelevant
for x in /data/property/*quickboot*; do
    rm -f $x
done

exit 0
