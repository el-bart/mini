#
# rand_junk build
#
# downloaded from http://www.baszerr.eu
#

CXX:=g++
CXXFLAGS:=-Wall -O3 -DNDEBUG -std=c++11 -pipe -lpthread
#CXXFLAGS:=-Wall -g3 -std=c++11 -pipe -lpthread

#CXX:=g++-4.6
#CXXFLAGS:=-Wall -O3 -DNDEBUG -std=c++0x -pipe -lpthread
#CXXFLAGS:=-Wall -g3 -std=c++0x -pipe -lpthread


.PHONY: all
all: rand_junk.out check.out repeated_data.out

%.out: %.cpp Makefile
	$(CXX) $(CXXFLAGS) $*.cpp -o $@

.PHONY: clean
clean:
	rm -vf *.o *.out
