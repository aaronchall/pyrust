use pyo3::prelude::*;

/// A Python module implemented in Rust.
#[pymodule]
mod pyrust {
    use pyo3::prelude::*;

    /// Formats the sum of two numbers as string.
    #[pyfunction]
    fn sum_as_string(a: usize, b: usize) -> PyResult<String> {
        Ok((a + b).to_string())
    }

    /// fib(i) returns the ith fibonacci number, found via recursion
    #[pyfunction]
    fn fib(i: i64) -> i64 {
        if i <= 1 {
            i
        } else {
            fib(i-1) + fib(i-2)
        }
    }
}
