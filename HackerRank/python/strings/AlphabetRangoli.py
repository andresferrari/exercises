#!/usr/bin/env python3

"""
Prints a Rangoli-style tapestry of the given size.

Example Rangoli with n = 3:

    ----c----
    --c-b-c--
    c-b-a-b-c
    --c-b-c--
    ----c----
"""

def print_rangoli(n):
    if n == 0:
        print()
        return
    elif n == 1:
        print('a')
        return
        
    H = n - 1
    K = H*2
    N = K*2 + 1
    chars = [chr(x) for x in range(ord('a'), ord('z') + 1)][0:n]
    rev_chars = chars[::-1]

    def print_line(i):
        P = K - i*2
        left = '-'*P
        rc = rev_chars[:(i+1)]
        rrc = rc[::-1][1:]
        center = '-'.join(rc) + ('-' + '-'.join(rrc) if rrc else '')
        right = '-'*P
        print(left + center + right)
    
    # Top
    for i in range(H):
        print_line(i)

    # Middle
    print('-'.join(rev_chars) + '-' + '-'.join(chars[1:]))

    # Bottom
    for i in reversed(range(H)):
        print_line(i)

if __name__ == '__main__':
    n = int(input('Enter size of Alphabet Rangoli (0 to 27): '))
    print_rangoli(n)
