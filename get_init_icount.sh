#!/bin/bash

#FIXME start
PIN_ROOT="/hdd2/hklee/pin-3.2-81205-gcc-linux/"
BENCH_ROOT="/hdd1/hynix-cxl/text_attention/"
#FIXME end

BENCH_NAME=
COUNT_TOOL_ROOT=

# Directory of this script
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUT_PATH=$DIR"/output"
mkdir -p $OUT_PATH

ARGC=$#
if [ $ARGC != 1 -a $ARGC != 2 ]; then
    echo "Arguments are required! [workload name, init count tool path]"
    exit
fi

BENCH_NAME=$1

if [ $ARGC == 2 ]; then
    COUNT_TOOL_ROOT=$2
else
    COUNT_TOOL_ROOT=$DIR
fi

BENCH_BIN_PATH=$BENCH_ROOT'build/TransformerNLP'

# Determine skip count
cd $OUT_PATH

# Prepare necessary files
cp -R -u -p $BENCH_ROOT"/dictionary" $OUT_PATH
cp -R -u -p $BENCH_ROOT"/sentence" $OUT_PATH
cp -R -u -p $BENCH_ROOT"/params" $OUT_PATH

RUN_PATH=$OUT_PATH'/'$BENCH_NAME
cp -R -u -p $COUNT_TOOL_ROOT"/obj-intel64" $RUN_PATH

mkdir -p $RUN_PATH
cd $RUN_PATH

# Run extraction
echo "$PIN_ROOT/pin -ifeellucky -t $COUNT_TOOL_ROOT/obj-intel64/init_instcount.so -o $BENCH_NAME.info -- $BENCH_BIN_PATH -m $BENCH_NAME"
$PIN_ROOT"/pin" -ifeellucky -t $COUNT_TOOL_ROOT"/obj-intel64/init_instcount.so" -o $BENCHNAME".info" -- $BENCH_BIN_PATH -m $BENCH_NAME
