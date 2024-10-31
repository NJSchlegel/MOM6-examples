#!/bin/bash
mkdir -p build/bergs_fms1/
(cd build/bergs_fms1/; rm -f path_names; \
 ../../src/mkmf/bin/list_paths -l ../../src/icebergs/src)
(cd build/bergs_fms1/; \
../../src/mkmf/bin/mkmf -t ../../src/mkmf/templates/ncrc5-intel.mk -o '-I../fms' -p libbergs.a -l '-L../fms -lfms' -c '-Duse_libMPI -Duse_netCDF' path_names )
source ./build/env_c5
make -C ./build/bergs_fms1 NETCDF=3 REPRO=1 libbergs.a -j
