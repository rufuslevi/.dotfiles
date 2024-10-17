install:
	nix run nix-darwin -- switch --flake .#luna --show-trace

rebuild:
	sudo nixos-rebuild switch --flake .#domum --show-trace

update:
	nix flake update

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d
