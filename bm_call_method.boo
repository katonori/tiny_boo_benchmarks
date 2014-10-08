#!/usr/bin/env booi

"""Microbenchmark for method call overhead.

This measures simple method calls that are predictable, do not use varargs or
kwargs, and do not use tuple unpacking.

# This is a port for boo language of python benchmark(https://code.google.com/p/unladen-swallow/wiki/Benchmarks)
"""

import System.Diagnostics

class Foo(object):
    public m_count = 0

    def foo(a, b, c, d):
        # 20 calls
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)
        bar(a, b, c)

    def bar(a, b, c):
        # 20 calls
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)
        baz(a, b)

    def baz(a, b):
        # 20 calls
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)
        quux(a)

    def quux(a):
        # 20 calls
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()
        qux()

    def qux():
        m_count += 1
        return


def test_calls(iterations as int, isDump as int):
    times = []
    f = Foo()
    #for _ in xrange(iterations):
    #for _ in xrange(iterations):
    i = 0
    while i < iterations:
        sw = Stopwatch()
        sw.Start()
        # 20 calls
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        f.foo(1, 2, 3, 4)
        sw.Stop()
        times.Add(sw.ElapsedMilliseconds)
        #print sw.ElapsedMilliseconds
        i += 1
    #print f.m_count
    return times

def main(argv as (string)):
    if len(argv) != 2:
        print "usage: cmd num dumpFlag"
        return 1
    num = int.Parse(argv[0])
    isDump = int.Parse(argv[1])
    total = 0.0
    times = test_calls(num, isDump)
    for i as double in times:
        total += i
    ave = total/len(times)
    ave /= 1000.0
    print "ave: " + ave + " sec"
    return 0
main(argv)
