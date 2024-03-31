install:
	# TODO : Add command

switch-theme-nixos: update-theme-var switch-nixos

switch-domum:
	sudo nixos-rebuild switch --flake .#domum --show-trace

switch-luna:
	nix run nix-darwin -- switch --flake .#luna --show-trace

update-theme-var:
	./scripts/variable_nix_update.sh
	
