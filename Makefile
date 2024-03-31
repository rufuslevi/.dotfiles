install:
	# TODO : Add command

switch-theme-nixos: update-theme-var switch-nixos

switch-milkyway: rebuild-milkyway copy-grub-theme

switch-domum: rebuild-domum copy-grub-theme

switch-luna:
	nix run nix-darwin -- switch --flake .#luna --show-trace

update-theme-var:
	./scripts/variable_nix_update.sh

rebuild-milkyway:
	sudo nixos-rebuild switch --flake .#milkyway --show-trace

rebuild-domum:
	sudo nixos-rebuild switch --flake .#domum --show-trace

copy-grub-theme:
	sudo cp -r -u ./grub/hyperfluent /boot/grub/themes
