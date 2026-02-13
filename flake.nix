{
  description = "Python + Rust dev environment with Rust-backed Python module";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      python = pkgs.python314;
    #   pythonEnv = python.withPackages (ps: [
    #     ps.pip
    #     ps.setuptools
    #     ps.wheel
    #     ps.numpy
    #   ]);
    in
    {
      devShells."${system}".default = pkgs.mkShell {
        packages = [
          pkgs.uv # manage Python virtualenv?
          python
          #pythonEnv
          pkgs.rustc
          pkgs.cargo
          pkgs.rustfmt
          pkgs.rust-analyzer
          pkgs.maturin
          pkgs.clippy
          pkgs.openssl
          pkgs.pkg-config
        ];

        # Required for PyO3
        env = {
          PYO3_PYTHON = "${python}/bin/python";
          RUST_BACKTRACE = "1";
          OPENSSL_DIR = "${pkgs.openssl.dev}";
          OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
          OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
        };

        shellHook = ''
          echo "Python: $(python --version)"
          echo "Rust: $(rustc --version)"
          echo "Use 'maturin develop --uv' to build the Rust module"
          uv sync
          source .venv/bin/activate
        '';
      };
  };
}
