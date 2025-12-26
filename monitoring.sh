#!/bin/bash

# architecture
arc=$(uname -a)

# physical processors
cpup=$(grep "physical id" /proc/cpuinfo | wc -l)
