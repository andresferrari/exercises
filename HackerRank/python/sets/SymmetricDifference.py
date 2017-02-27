#!/usr/bin/env python3

"""
Print the symmetric difference between two sets of integers, in ascending order.
"""

def symmetric_difference(s1, s2):
    return s1.difference(s2).union(s2.difference(s1))

if __name__ == '__main__':
    input() # discard
    s1 = set(list(map(int, input().split())))
    input() # discard
    s2 = set(list(map(int, input().split())))
    d = symmetric_difference(s1, s2)
    [print(x) for x in sorted(list(d))]
    
