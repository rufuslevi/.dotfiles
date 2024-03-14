install:
	# TODO : Add command

switch-nixos:
	sudo nixos-rebuild switch --flake . --show-trace

switch-darwin:
	nix run nix-darwin -- switch --flake . --show-trace
