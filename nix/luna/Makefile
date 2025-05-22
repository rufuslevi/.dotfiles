install:
	nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake .#luna --show-trace

rebuild:
	sudo darwin-rebuild switch --flake .#luna --show-trace

update:
	nix flake update

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d
