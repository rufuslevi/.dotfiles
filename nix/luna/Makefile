install:
	sudo nix run nix-darwin/master#darwin-rebuild --extra-experimental-features "nix-command flakes" -- switch --flake .#luna --show-trace 

rebuild:
	sudo darwin-rebuild switch --flake .#luna --show-trace

update:
	sudo nix flake update

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d
