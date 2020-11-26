#! /usr/bin/env python
#
#

import sys, os

def par(u1,e1,np,un,en):
    """   amdahl's law  """
    r1 = un/u1
    r2 = en/(e1/np)
    if np > 1:
        fp = (np-r2)/(np-1)
    else:
        fp = 1.0
    # print(r1,r2,fp)
    return (r1,r2,fp)

def hms2s(hms):
    w = hms.split(':')
    if len(w) == 1:
        return float(w[0])
    elif len(w) == 2:
        return float(w[0])*60 + float(w[1])
    elif len(w) == 3:
        return float(w[0])*3600 + float(w[1])*60 + float(w[0])
    else:
        return -1.0

def readf1(filename):
    """  example line:
         2  72.24 10.58 1:47.36  
    """
    lines = open(filename).readlines()
    for line in lines:
        if line[0] == '#': continue
        w = line.strip().split()
        n = int(w[0])
        u0 = float(w[1])
        s0 = float(w[2])
        e0 = hms2s(w[3])
        if n == 1:
            un0 = u0
            sn0 = s0
            en0 = e0
        (r10,r20,fp0) = par(un0,en0,n,u0,e0)
        print("%d %g %g %g  %g %g %g" % (n,u0,s0,e0, r10,r20,fp0))
    

def readf2(filename):
    """  example line:
         2  72.24 10.58 1:47.36   882.77  33.23 14:37.16
    """
    lines = open(filename).readlines()
    for line in lines:
        if line[0] == '#': continue
        w = line.strip().split()
        n = int(w[0])
        u0 = float(w[1])
        s0 = float(w[2])
        e0 = hms2s(w[3])
        u1 = float(w[4])
        s1 = float(w[5])
        e1 = hms2s(w[6])
        if n == 1:
            un0 = u0
            sn0 = s0
            en0 = e0
            un1 = u1
            sn1 = s1
            en1 = e1
        (r10,r20,fp0) = par(un0,en0,n,u0,e0)
        (r11,r21,fp1) = par(un1,en1,n,u1,e1)
        print(n,u0,s0,e0,u1,s1,e1, r10,r20,fp0, r11,r21,fp1)

        

readf1(sys.argv[1])        
