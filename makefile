run:
	nix develop . -c zsh

pure-run:
	docker build -t nix - <<EOF
		FROM nixos/nix
		RUN nix-channel --update
		WORKDIR /app
	EOF
	docker run -v .:/app -it nix
	# nix --extra-experimental-features "nix-command flakes" develop
