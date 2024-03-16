''
  menuentry 'Windows Boot Manager (the right one) (on /dev/nvme0n1p1)' --class windows --class os $menuentry_id_option 'osprober-efi-FAF9-831B' {
    insmod part_gpt
    insmod fat
    search --no-floppy --fs-uuid --set=root FAF9-831B
    chainloader /Microsoft/Boot/bootmgfw.efi
  }
'';
