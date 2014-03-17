SRCS:=$(wildcard *.cpp)
OPT:=$(SRCS:.cpp=.out)
BINS:=$(SRCS:.cpp=.out-nonopt) $(SRCS:.cpp=.out-opt)

TIME:=/usr/bin/time

.PHONY: all
all: $(BINS)

%.out-opt: %.cpp
	g++ -Wall -O3 -ftemplate-depth-5000 -o $@ -DMAKE_OPT_VERSION $<

%.out-nonopt: %.cpp
	g++ -Wall -O3 -ftemplate-depth-5000 -o $@ $<

.PHONY: run
run: $(BINS)
	@echo "######### RUNNING TESTS #########"
	@echo "exit status is only a sort of check sum, to see if both implementations give the same results"
	@echo "+++++++++++++++"
	@for f in `ls $(BINS) | sort` ; \
     do \
       echo $$f ; $(TIME) ./$$f ; echo +++++++ ; \
     done

.PHONY: clean
clean:
	rm -fv $(BINS)
