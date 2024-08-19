install:
	# TODO : Add command

switch-theme-nixos: update-theme-var switch-nixos

switch-milkyway: rebuild-milkyway copy-grub-theme

switch-domum-light: rebuild-domum-light copy-grub-theme

switch-domum-dark: rebuild-domum-dark copy-grub-theme

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d

update-flake:
	nix flake update

install-luna:
	nix run nix-darwin -- switch --flake .#luna --show-trace

update-theme-var:
	./scripts/variable_nix_update.sh

rebuild-luna:
	darwin-rebuild switch --flake .#luna --show-trace

rebuild-milkyway:
	sudo nixos-rebuild switch --flake .#milkyway --show-trace

rebuild-domum-light:
	sudo nixos-rebuild switch --flake .#domum-light --show-trace

rebuild-domum-dark:
	sudo nixos-rebuild switch --flake .#domum-dark --show-trace

copy-grub-theme:
	sudo cp -r -u ./grub/hyperfluent /boot/grub/themes

