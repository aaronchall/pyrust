PyRust

Using Nix Flake to provision requirements for a rust library accessible via Python.

- flake.nix provisions requirements
- pyproject.toml - builds using maturin
- Cargo.toml - requires pyo3, makes a cdylib
- src/lib.rs - rust pymodule implementation
- fib.py - test and see the performance difference between native Python and calling Rust from Python

To try this out:
0. git clone and cd to this directory
1. (be sure nix is installed and) `nix develop`
2. run the test with `python -m fib`

