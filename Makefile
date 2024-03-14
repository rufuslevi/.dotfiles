install:
	# TODO : Add command

switch-darwin:
	nix run nix-darwin -- switch --flake . --show-trace
