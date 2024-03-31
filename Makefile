install:
	# TODO : Add command

switch-theme-nixos: update-theme-var switch-nixos

switch-milkyway: copy-grub-theme
	sudo nixos-rebuild switch --flake .#milkyway --show-trace

switch-domum: copy-grub-theme
	sudo nixos-rebuild switch --flake .#domum --show-trace

switch-luna:
	nix run nix-darwin -- switch --flake .#luna --show-trace

update-theme-var:
	./scripts/variable_nix_update.sh
	
copy-grub-theme:
	sudo cp -r -u ./grub/hyperfluent /boot/grub/themes
