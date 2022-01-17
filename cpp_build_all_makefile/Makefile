SRCS:=$(wildcard *.cpp)
OBJS:=$(SRCS:.cpp=.o)
DEPS:=$(SRCS:.cpp=.d)

CXXFLAGS+=-Wall
CXXFLAGS+=-std=c++17

.PHONY: all
all: debug

.PHONY: debug
debug: MODE_FLAGS=-g3 -fsanitize=address
debug: build

.PHONY: release
release: MODE_FLAGS=-O3 -DNDEBUG
release: build

.PHONY: build
build: a.out

%.out: $(OBJS)
	$(CXX) $(CXXFLAGS) $(MODE_FLAGS) -o "$@" $(OBJS)

%.o: %.cpp Makefile
	$(CXX) $(CXXFLAGS) $(MODE_FLAGS) -c "$<"

-include $(DEPS)

.PHONY: clean
clean:
	rm -vf a.out $(OBJS) $(DEPS)
