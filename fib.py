import pyrust
import timeit


def fib(i):
    if i <= 1:
        return i
    return fib(i-1) + fib(i-2)


def main():
    python_time = min(timeit.repeat(lambda: fib(40), number=10))
    rust_time = min(timeit.repeat(lambda: pyrust.fib(40), number=10))
    print(f'''
    {python_time=}
    {rust_time=}
    Rust was {(python_time/rust_time)=} times as fast as Python
    ''')


if __name__ == '__main__':
    main()
