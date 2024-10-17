HOST = $(shell uname -n)

install:
ifeq ($(HOST), domum)
	cd nix/nixos/domum; make upgrade; make copy-grub-theme
endif
ifeq ($(HOST), milkyway)
	cd nix/nixos/milkyway; make upgrade; make copy-grub-theme
endif
ifeq ($(HOST), luna)
	cd nix/luna; make install
endif

rebuild:
ifeq ($(HOST), domum)
	cd nix/nixos/domum; make rebuild
endif
ifeq ($(HOST), milkyway)
	sudo nixos-rebuild switch --flake .#milkyway --show-trace
endif
ifeq ($(HOST), luna)
	cd nix/luna; make rebuild
endif

update:
ifeq ($(HOST), luna)
	cd nix/luna; make update
else
	cd nix/nixos/domum; make update
endif

upgrade: update rebuild

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d

update-theme-var:
	./scripts/variable_nix_update.sh

copy-grub-theme:
	sudo cp -r -u ./grub/hyperfluent /boot/grub/themes

