
# coding: utf-8

# In[ ]:

import sys
for line in sys.stdin:
    for word in line.split():
        print "%s\t%s" % (word,1)
        

