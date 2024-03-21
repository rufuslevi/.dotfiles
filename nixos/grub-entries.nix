''
    menuentry 'Windows Boot Manager (on /dev/nvme0n1p1)' --class windows --class os $menuentry_id_option 'osprober-efi-FAF9-831B' {
      insmod part_gpt
      insmod fat
      search --no-floppy --fs-uuid --set=root FAF9-831B
      chainloader /Microsoft/Boot/bootmgfw.efi
    }
    menuentry 'KDE neon 6.0 (22.04) (on /dev/sdb2)' --class neon --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  	insmod part_gpt
  	insmod ext2
  	set root='hd1,gpt2'
  	if [ x$feature_platform_search_hint = xy ]; then
  	  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  	else
  	  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  	fi
  	linux /boot/vmlinuz-6.5.0-21-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro quiet splash $vt_handoff
  	initrd /boot/initrd.img-6.5.0-21-generic
  }
  submenu 'Advanced options for KDE neon 6.0 (22.04) (on /dev/sdb2)' $menuentry_id_option 'osprober-gnulinux-advanced-24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  	menuentry 'Neon GNU/Linux (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.5.0-21-generic--24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  		insmod part_gpt
  		insmod ext2
  		set root='hd1,gpt2'
  		if [ x$feature_platform_search_hint = xy ]; then
  		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		else
  		  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		fi
  		linux /boot/vmlinuz-6.5.0-21-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro quiet splash $vt_handoff
  		initrd /boot/initrd.img-6.5.0-21-generic
  	}
  	menuentry 'Neon GNU/Linux, with Linux 6.5.0-21-generic (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.5.0-21-generic--24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  		insmod part_gpt
  		insmod ext2
  		set root='hd1,gpt2'
  		if [ x$feature_platform_search_hint = xy ]; then
  		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		else
  		  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		fi
  		linux /boot/vmlinuz-6.5.0-21-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro quiet splash $vt_handoff
  		initrd /boot/initrd.img-6.5.0-21-generic
  	}
  	menuentry 'Neon GNU/Linux, with Linux 6.5.0-21-generic (recovery mode) (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.5.0-21-generic--24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  		insmod part_gpt
  		insmod ext2
  		set root='hd1,gpt2'
  		if [ x$feature_platform_search_hint = xy ]; then
  		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		else
  		  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		fi
  		linux /boot/vmlinuz-6.5.0-21-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro recovery nomodeset dis_ucode_ldr
  		initrd /boot/initrd.img-6.5.0-21-generic
  	}
  	menuentry 'Neon GNU/Linux, with Linux 6.5.0-17-generic (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.5.0-17-generic--24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  		insmod part_gpt
  		insmod ext2
  		set root='hd1,gpt2'
  		if [ x$feature_platform_search_hint = xy ]; then
  		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		else
  		  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		fi
  		linux /boot/vmlinuz-6.5.0-17-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro quiet splash $vt_handoff
  		initrd /boot/initrd.img-6.5.0-17-generic
  	}
  	menuentry 'Neon GNU/Linux, with Linux 6.5.0-17-generic (recovery mode) (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-6.5.0-17-generic--24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  		insmod part_gpt
  		insmod ext2
  		set root='hd1,gpt2'
  		if [ x$feature_platform_search_hint = xy ]; then
  		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		else
  		  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		fi
  		linux /boot/vmlinuz-6.5.0-17-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro recovery nomodeset dis_ucode_ldr
  		initrd /boot/initrd.img-6.5.0-17-generic
  	}
  	menuentry 'Neon GNU/Linux, with Linux 5.15.0-97-generic (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-5.15.0-97-generic--24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  		insmod part_gpt
  		insmod ext2
  		set root='hd1,gpt2'
  		if [ x$feature_platform_search_hint = xy ]; then
  		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		else
  		  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		fi
  		linux /boot/vmlinuz-5.15.0-97-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro quiet splash $vt_handoff
  		initrd /boot/initrd.img-5.15.0-97-generic
  	}
  	menuentry 'Neon GNU/Linux, with Linux 5.15.0-97-generic (recovery mode) (on /dev/sdb2)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-5.15.0-97-generic--24e3a706-998f-43d8-b34e-0eaf9a504f6b' {
  		insmod part_gpt
  		insmod ext2
  		set root='hd1,gpt2'
  		if [ x$feature_platform_search_hint = xy ]; then
  		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,gpt2 --hint-efi=hd1,gpt2 --hint-baremetal=ahci1,gpt2  24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		else
  		  search --no-floppy --fs-uuid --set=root 24e3a706-998f-43d8-b34e-0eaf9a504f6b
  		fi
  		linux /boot/vmlinuz-5.15.0-97-generic root=UUID=24e3a706-998f-43d8-b34e-0eaf9a504f6b ro recovery nomodeset dis_ucode_ldr
  		initrd /boot/initrd.img-5.15.0-97-generic
  	}
  }
''
