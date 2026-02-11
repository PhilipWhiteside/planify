{
	description = "Nix development flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = {
		nixpkgs,
		flake-utils,
		...
	}:
		flake-utils.lib.eachDefaultSystem (system: let
				pkgs = import nixpkgs {inherit system;};
				planify = pkgs.callPackage ./package.nix {};
			in {
				packages.default = planify;

				devShells.default =
					pkgs.mkShell {
						inputsFrom = [planify];
						buildInputs = [
							pkgs.flatpak-builder
							pkgs.appstream
						];
					};
			});
}
