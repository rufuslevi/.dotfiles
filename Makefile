HOST = $(shell uname -n)

install:
ifeq ($(HOST), domum)
	make upgrade
	make copy-grub-theme
endif
ifeq ($(HOST), milkyway)
	make upgrade
	make copy-grub-theme
endif
ifeq ($(HOST), luna)
	nix run nix-darwin -- switch --flake .#luna --show-trace
endif

rebuild:
ifeq ($(HOST), domum)
	sudo nixos-rebuild switch --impure --flake .#domum --show-trace
endif
ifeq ($(HOST), milkyway)
	sudo nixos-rebuild switch --flake .#milkyway --show-trace
endif
ifeq ($(HOST), luna)
	darwin-rebuild switch --flake .#luna --show-trace
endif

update:
	nix flake update

upgrade: update rebuild

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d

update-theme-var:
	./scripts/variable_nix_update.sh

copy-grub-theme:
	sudo cp -r -u ./grub/hyperfluent /boot/grub/themes

