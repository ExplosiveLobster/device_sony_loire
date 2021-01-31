def FullOTA_InstallBegin(info):
  info.script.AppendExtra('run_program("/sbin/ln", "-s", "/dev/block/bootdevice/by-name", "/dev/block/by-name");');
