install:
	sudo nixos-install --flake .#domum --show-trace

rebuild:
	sudo nixos-rebuild switch --flake .#domum --show-trace

rebuild-bootloader:
	sudo nixos-rebuild --install-bootloader boot --flake .#domum --show-trace

update:
	sudo nix flake update

clear-cache:
	nix-store --gc

clear-all-old-generations:
	sudo nix-collect-garbage -d
