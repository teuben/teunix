#! /usr/bin/env python
#
#

import sys, os

def par(u1,e1,np,un,en):
    """   amdahl's law
       R1 = ratio of user portion of CPU, should be 1
       R2 = ratio of normalized elapsed time, should be 1
       FP = derived fraction of code that is parallel
    """
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

def readf(filename):
    """  example line:
         2  72.24 10.58 1:47.36  
    """
    lines = open(filename).readlines()
    for line in lines:
        if line[0] == '#': continue
        w = line.strip().split()
        n = int(w[0])
        u0 = float(w[1].replace('user',''))
        s0 = float(w[2].replace('system',''))
        e0 = hms2s(w[3].replace('elapsed',''))
        if n == 1:
            un0 = u0
            sn0 = s0
            en0 = e0
        (r10,r20,fp0) = par(un0,en0,n,u0,e0)
        print("%d %g %g %g  %g %g %g" % (n,u0,s0,e0, r10,r20,fp0))
    
def readf1(filename, label=True):
    """  example line can be one of two:
         2      72.24 10.58 1:47.36   (here 2 means number of processors)
         name   72.24 10.58 1:47.36   (here name is the name of computer)
    """
    lines = open(filename).readlines()
    retval = {}
    for line in lines:
        if line[0] == '#': continue
        w = line.strip().split()
        if label:
            n = 0
            name = w[0]
        else:
            n = int(w[0])
        u0 = float(w[1].replace('user',''))
        s0 = float(w[2].replace('system',''))
        e0 = hms2s(w[3].replace('elapsed',''))
        if not label and n == 1:
            un0 = u0
            sn0 = s0
            en0 = e0
        if not label:
            (r10,r20,fp0) = par(un0,en0,n,u0,e0)
            print("%d %g %g %g  %g %g %g" % (n,u0,s0,e0, r10,r20,fp0))
            retval[n] = [u0,s0,e0, r10,r20,fp0]
        else:
            retval[name] = [u0,s0,e0]
    return retval
    
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

        
if __name__ == "__main__":
    readf1(sys.argv[1],False)
