OBJS=liboctq.o liboctqisoc.o
EXE=tqcpptest1
LIBS=../..

.PHONY : all clean

all:
	make $(EXE)
	make liboctq.so
    
clean:
	rm -f *.o *.mod $(EXE)

liboctq.o:	../liboctq.F90
	gfortran -c -fopenmp -g -fPIC -I$(LIBS) ../liboctq.F90

liboctqisoc.o:	liboctqisoc.F90
	gfortran -c -fopenmp -g -fPIC -I$(LIBS) liboctqisoc.F90
	
liboctq.so:  liboctq.o liboctqisoc.o
	g++ -std=c++17 -fopenmp -shared -o liboctq.so liboctq.o liboctqisoc.o gtp3.o matsmin.o metlib4.o oclablas.o ocnum.o pmon6.o smp2.o -lgfortran 

$(EXE): $(OBJS)
	g++ -std=c++17 -fopenmp -o $(EXE) -lstdc++ $(EXE).cpp liboctqisoc.o liboctq.o liboceq.a getkey.o M_getkey.o -lgfortran -lm
	#g++ -std=c++17 -fopenmp -shared -o liboctq.so liboctq.o 
	g++ -std=c++17 -fopenmp -lstdc++ -c -I../.. $(EXE).cpp
