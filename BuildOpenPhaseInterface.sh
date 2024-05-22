#bin/bash
make clean
make
cd examples/TQ4lib/Cpp/Matthias
make clean
cp ../../../../*.mod .
cp ../../../../*.o .
cp ../../../../libs/*.a .
make
