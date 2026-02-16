# PyRust

Using a Nix Flake to provision requirements for a
Rust library accessible via Python.

The flake.nix file sets us up with a development environment
(by running `nix develop`),
building the Rust source so you can immediately open a Python terminal
and `import pyrust` which has a function, `fib(i)` that returns the ith
fibonacci number, calculated recursively. This function is useful for
speed performance comparisons between Rust called from Python and
native Python.


## Contents

- flake.nix provisions requirements
- pyproject.toml - builds using maturin
- Cargo.toml - requires pyo3, makes a cdylib
- src/lib.rs - rust pymodule implementation
- fib.py - test and see the performance difference between native Python and calling Rust from Python

When launching the dev environment you'll get three lockfiles: flake.lock
will pin the version of Python, rustc, and cargo, Cargo.lock will pin
the numerous Rust requirements, and 
uv.lock pins the Python requirements obtained from pyproject.yaml.

Note I am not committing any lock-files because I intend this repo to be
a timeless example. If things eventually break (I suppose they probably will)
let me know and I'll update.

## Try it out

0. git clone this repository and cd to this directory
1. (be sure nix is installed and setup for flakes or use
   `--experimental-features 'nix-command flakes'` when calling) `nix develop`
2. run the test with `python -m fib` (tweak the fib.py file if this test takes
   too long for you.)

The test output looks something like this:

```
$ python -m fib

    python_time=150.9842184879817
    rust_time=3.1513066409970634
    Rust was (python_time/rust_time)=47.911623871744446 times as fast as Python
```
