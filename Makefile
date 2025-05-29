# Variables
CXX := g++
CXXFLAGS := -std=c++17 -Wall -O2 -static -static-libgcc -static-libstdc++
LDFLAGS := -lssl -lcrypto -lws2_32 -lwsock32 -lcrypt32

SRC := src/main.cpp
OUT := bin/server

# Compilar
$(OUT): $(SRC)
	clear
	@mkdir -p $(dir $(OUT))
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $(OUT) $(SRC) $(LDFLAGS)

# Limpiar
clean:
	rm -rf bin/

.PHONY: clean
