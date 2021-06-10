import numpy as np
import matplotlib.pyplot as plt

N=512
n=np.arange(N)
w=np.array(2*np.pi*n/N)
x0=1-np.cos(w)
x=np.around(x0*1024)

#plt.hist(x,512)
#plt.show()
xd=np.int16(x)
uniqe=list(set(xd))
#for d in enumerate(xd):
    #print((d))

d={}
for i,v in enumerate(xd):    
    if d.get(v):
        d[v].append(i)
    else:
        d.update({v:[i]})

for k in d.keys():
    if (k==0):
        pass
    else:
        print('\t\t', end='')
        for c, v in enumerate(d[k]):
            if (c==len(d[k])-1):
                print(v,':',sep='', end='')
            else:
                print(v,', ',sep='', end='')
        print('')
        print('\t\t\t\t value <= ',k,';', sep='')
