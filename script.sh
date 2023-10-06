#!/bin/bash
docker build -t openinterpreter .
docker run --rm -it -v $(pwd)/workdir:/workdir openinterpreter
