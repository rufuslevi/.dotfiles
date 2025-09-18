HOST = $(shell uname -n)

default: init

install:
ifeq ($(HOST), domum)
	cd nix/nixos/domum; make install; make copy-grub-theme
endif
ifeq ($(HOST), milkyway)
	cd nix/nixos/milkyway; make install; make copy-grub-theme
endif
ifeq ($(HOST), luna)
	cd nix/luna; make install
endif

rebuild-bootloader:
ifeq ($(HOST), domum)
	cd nix/nixos/domum; make rebuild-bootloader
endif

rebuild:
ifeq ($(HOST), domum)
	cd nix/nixos/domum; make rebuild
endif
ifeq ($(HOST), milkyway)
	cd nix/nixos/milkyway; make rebuild
endif
ifeq ($(HOST), luna)
	cd nix/luna; make rebuild
endif

update:
ifeq ($(HOST), domum)
	cd nix/nixos/domum; make update
endif
ifeq ($(HOST), milkyway)
	cd nix/nixos/milkyway; make update
endif
ifeq ($(HOST), luna)
	cd nix/luna; make update
endif

upgrade: update rebuild

init:
	cargo install just

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d

update-theme-var:
	./scripts/variable_nix_update.sh

copy-grub-theme:
	sudo cp -r -u ./grub/hyperfluent /boot/grub/themes

