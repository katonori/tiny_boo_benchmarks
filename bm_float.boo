#!/usr/bin/env booi

"""
Semi-micro benchmark for floating point performance.

# This is a port for boo language of python benchmark(https://code.google.com/p/unladen-swallow/wiki/Benchmarks)
"""

import System
import System.Diagnostics


class Point(object):
    m_x as double
    m_y as double
    m_z as double
    def constructor(i as int):
        m_x = x = Math.Sin(i)
        m_y = Math.Cos(i) * 3
        m_z = (x * x) / 2

    def normalize():
        norm = Math.Sqrt(m_x ** 2 + m_y ** 2 + m_z ** 2)
        m_x = m_x / norm
        m_y = m_y / norm
        m_z = m_z / norm

    def maximize(other as Point):
        if m_x <= other.m_x:
            m_x = other.m_x
        if m_y <= other.m_y:
            m_y = other.m_y
        if m_z <= other.m_z:
            m_z = other.m_z
    def dump():
        print m_x.ToString("0.00000000") + "," + m_y.ToString("0.00000000") + "," + m_z.ToString("0.00000000")

def maximize(points as List):
    #points = iter(points)
    #cur = points.next()
    cur as Point = points[0]
    for p in points[1:]:
        cur.maximize(p)
    return cur


def benchmark(isDump as int):
    points = []
    for i in range(20000):
        points.Add(Point(i))
    if isDump != 0:
        for p as Point in points:
            p.dump()
            p.normalize()
    else:
        for p as Point in points:
            p.normalize()
    rv = maximize(points)
    #rv.dump()

def test_float(count as int, isDump as int):
    times = []
    for _ in range(count):
        sw = Stopwatch()
        sw.Start()
        benchmark(isDump)
        sw.Stop()
        times.Add(sw.ElapsedMilliseconds)
    return times


def main(argv as (string)):
    if len(argv) != 2:
        print "usage: cmd num dumpFlag"
        return 1
    num = int.Parse(argv[0])
    isDump = int.Parse(argv[1])
    total = 0.0
    times = test_float(num, isDump)
    for i as double in times:
        total += i
    ave = total/len(times)
    ave /= 1000.0
    print "ave: " + ave + " sec"
    return 0
main(argv)
