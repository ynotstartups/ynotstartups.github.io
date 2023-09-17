# TIL - How does docker use cache?                                   - 27/Aug/23

**Docker uses cache when the following two rules are met.**

1. when the docker command is not `ADD` or `COPY`, e.g. `RUN`
   a. given parent image in cache
   b. look at next instruction
   c. if there is any child image (derived from parents) with the *exact same
   instruction use* it as cache
1. For `ADD` and `COPY` command, compare checksum of each file with exsiting
   images, if checksum is different then cache is invalidated
