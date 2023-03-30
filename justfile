build:
	@echo "[INFO] Rebuilding NixOS..."
	sudo nixos-rebuild switch --flake .#

test:
	@echo "[INFO] Test rebuilding NixOS..."
	sudo nixos-rebuild test --flake .#

update:
  @echo "[INFO] Updating flake..."
  nix flake update

default: build

alias b := build
alias u := update
