#!/sbin/sh
#
# Backup and restore addon /system files
#

export C=/tmp/backupdir
export S=/system
export V=5.0

export OUTFD=$(ps | grep -v "grep" | grep -o -E "update_binary(.*)" | cut -d " " -f 3); #BIG props to Chainfire
[ ! $OUTFD ] && export OUTFD=$(ps | grep -v "grep" | grep -o -E "/tmp/updater(.*)" | cut -d " " -f 3); #BIG props nuclearmistake for TWRP-izing
ui_print() { if [ $OUTFD ]; then echo "ui_print $*" 1>&$OUTFD; else echo $*; fi; return 0; }

# Scripts in /system/addon.d expect to find backuptool.functions in /tmp
cp -f /tmp/install/bin/backuptool.functions /tmp

# Preserve /system/addon.d in /tmp/addon.d
preserve_addon_d() {
  mkdir -p /tmp/addon.d/
  cp -a /system/addon.d/* /tmp/addon.d/
  chmod 755 /tmp/addon.d/*.sh
}

# Restore /system/addon.d in /tmp/addon.d
restore_addon_d() {
  cp -a /tmp/addon.d/* /system/addon.d/
  rm -rf /tmp/addon.d/
}

# Proceed only if /system is the expected major and minor version
check_prereq() {
if ! grep -q "^ro.modversion=$V.*" /system/build.prop && ! grep -q "^ro.exodus.base=$V.*" /system/build.prop; then
  ui_print "Not backing up files from incompatible version: $V"
  return 0
fi
return 1
}

check_blacklist() {
  if [ -f /system/addon.d/blacklist ];then
      ## Discard any known bad backup scripts
      cd /$1/addon.d/
      for f in *sh; do
          s=$(md5sum $f | awk {'print $1'})
          grep -q $s /system/addon.d/blacklist && rm -f $f
      done
  fi
}

check_whitelist() {
  found=0
  if [ -f /system/addon.d/whitelist ];then
      ## forcefully keep any version-independent stuff
      cd /$1/addon.d/
      for f in *sh; do
          s=$(md5sum $f | awk {'print $1'})
          grep -q $s /system/addon.d/whitelist
          if [ $? -eq 0 ]; then
              found=1
          else
              rm -f $f
          fi
      done
  fi
  return $found
}

# Execute /system/addon.d/*.sh scripts with $1 parameter
run_stage() {
for script in $(find /tmp/addon.d/ -name '*.sh' |sort -n); do
  /sbin/sh $script $1
done
}

backup() {
  ui_print "backuptool: backup"
  if check_prereq; then
    if check_whitelist system; then
      ui_print "Failed to check whitelist!"
      exit 127
    fi
  fi
  check_blacklist system
  preserve_addon_d
  run_stage pre-backup
  run_stage backup
  run_stage post-backup
}

restore() {
  ui_print "backuptool: restore"
  if check_prereq; then
    if check_whitelist tmp; then
      ui_print "Failed to check whitelist!"
      exit 127
    fi
  fi
  check_blacklist tmp
  run_stage pre-restore
  run_stage restore
  run_stage post-restore
  restore_addon_d
  rm -rf $C
  sync
}

case "$1" in
  backup|restore)
    mkdir -p $C
    $1
  ;;
  *)
    ui_print "Usage: $0 {backup|restore}"
    exit 1
esac

exit 0
