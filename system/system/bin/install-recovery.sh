#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery:12083200:cd3ef7a2069b21df3ed57448f6d586abea0fa06e; then
  applypatch  EMMC:/dev/block/platform/soc/11230000.mmc/by-name/boot:6653952:d15c71e54a2649da48b0e32f6ba53c84525d410a EMMC:/dev/block/platform/soc/11230000.mmc/by-name/recovery f14cb32ee527bece0a5f5e9ed6aae31e3b38e272 12081152 d15c71e54a2649da48b0e32f6ba53c84525d410a:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/soc/11230000.mmc/by-name/recovery bs=1 seek=12081152 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
