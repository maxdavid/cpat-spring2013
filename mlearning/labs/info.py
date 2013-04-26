############
# compute information of a list of probabilities
############

from math import *

def info(lst):
    total = 0
    for p in lst:
        total += p * log(p, 2)
    return -total

def main():
    list = [9.0/14, 5.0/14]
    print (info(list))

main()
