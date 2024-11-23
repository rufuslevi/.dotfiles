install:
	nix run nix-darwin -- switch --flake .#milkyway --show-trace

rebuild:
	sudo nixos-rebuild switch --flake .#milkyway --show-trace

update:
	nix flake update

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d
