#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -f "peglib.h" ]; then return; fi
URL="https://github.com/yhirose/cpp-peglib/raw/refs/heads/master/peglib.h"
FILE="peglib.h"

# Download the release
if [ ! -f "$FILE" ]; then
  echo "Downloading $FILE from $URL ..."
  curl -L "$URL" -o "$FILE"
  echo ""
fi
}


# Test the project
test() {
echo "Running 01-calc.cxx ..."
clang++ -std=c++17 -I. -o 01.exe examples/01-calc.cxx  && ./01.exe "1+2*3" && echo -e "\n"
echo "Running 02-calc2.cxx ..."
clang++ -std=c++17 -I. -o 02.exe examples/02-calc2.cxx && ./02.exe "1+2*3" && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
