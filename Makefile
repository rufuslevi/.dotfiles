install-luna:
	nix run nix-darwin -- switch --flake .#luna --show-trace

install-milkyway: upgrade-milkyway copy-grub-theme
install-domum-light: upgrade-domum-light copy-grub-theme
install-domum-dark: upgrade-domum-dark copy-grub-theme

upgrade-luna: update-flake rebuild-luna
upgrade-milkyway: update-flake rebuild-milkyway
upgrade-domum-dark: update-flake rebuild-domum-dark
upgrade-domum-light: update-flake rebuild-domum-light

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d

update-flake:
	nix flake update

update-theme-var:
	./scripts/variable_nix_update.sh

rebuild-luna:
	darwin-rebuild switch --flake .#luna --show-trace

rebuild-milkyway:
	sudo nixos-rebuild switch --flake .#milkyway --show-trace

rebuild-domum-light:
	sudo nixos-rebuild switch --impure --flake .#domum-light --show-trace

rebuild-domum-dark:
	sudo nixos-rebuild switch --impure --flake .#domum-dark --show-trace

copy-grub-theme:
	sudo cp -r -u ./grub/hyperfluent /boot/grub/themes

