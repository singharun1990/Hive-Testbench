#!/bin/bash

SCALE=1000
if [ "X$TPCH_SCALE_FACTOR" != "X" ]
then
    SCALE=$TPCH_SCALE_FACTOR
fi
WORKLOAD=tpch
CONNECTION_STRING=jdbc:hive2://localhost:10001
WAREHOUSE_DIR=abfs://tpchcontainer1@bn3blobfs.dfs.core.windows.net/hive/warehouse
RAWDATA_DATABASE=tpch_text_${SCALE}
QUERY_DATABASE=tpch_partitioned_orc_${SCALE}
TABLES="part partsupp supplier customer orders lineitem nation region"
DEBUG_ON=true
RAWDATA_DIR=abfs://tpchcontainer1@bn3blobfs.dfs.core.windows.net/tmp/tpch-generate
RUN_ANALYZE=true
CURRENT_DIRECTORY=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
LOADTIMES_DIR=${CURRENT_DIRECTORY}/../../output/$WORKLOAD/loadtimes/
LOADTIMES_FILE=${LOADTIMES_DIR}/loadtimes.csv
MAVEN_HOME=${CURRENT_DIRECTORY}/apache-maven-3.0.5
PATH=$PATH:$MAVEN_HOME/bin





