install:
	# TODO : Add command

switch-theme-nixos: update-theme-var switch-nixos

switch-nixos:
	sudo nixos-rebuild switch --flake . --show-trace

switch-darwin:
	nix run nix-darwin -- switch --flake . --show-trace

update-theme-var:
	./scripts/variable_nix_update.sh
	
