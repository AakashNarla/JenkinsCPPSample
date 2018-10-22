#!/bin/bash

cd Debug/src/
echo "Generate Corbetura Report"
gcovr -r .  --xml-pretty -o coverage.xml
