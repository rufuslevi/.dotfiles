install:
	sudo nixos-install --flake .#milkyway --show-trace

rebuild:
	sudo nixos-rebuild switch --flake .#milkyway --show-trace

update:
	sudo nix flake update

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d
