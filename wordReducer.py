
# coding: utf-8

# In[ ]:

import sys

(last_key,count) = (None, 0)
for line in sys.stdin:
    (key, value) = line.strip().split("\t")
    if last_key and last_key!=key:
        print "%s\t%s" % (last_key,count)
        (last_key,count) = (key,int(value))
    else:
        (last_key,count) = (key, count + int(value))

