CXX:=g++
CXXFLAGS:=-Wall -O3 -DNDEBUG -std=c++0x -pipe -lpthread -lrt

.PHONY: all
all: rand_reads.out

%.out: %.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

.PHONY: clean
clean:
	rm -vf *.o *.out
