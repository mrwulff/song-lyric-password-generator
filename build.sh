#!/bin/bash
abort() {
  local message=$1
  echo $message
  exit -1
}
[ -z $FTP_PASS ] && abort "FTP_PASS is undefined"
[ -z $FTP_USER ] && abort "FTP_USER is undefined"
[ -z $FTP_SITE ] && abort "FTP_SITE is undefined"
lftp -c "open -u $FTP_USER,$FTP_PASS ftp.travisawagner.com; set ssl:verify-certificate no; mirror -R ~/ /travisaw.com/test-production/synth-patch-name-generator"
