#!/bin/bash

: ${PROTOSET:=""}
if [[ -f /protoset/service.protoset ]]; then
    PROTOSET="-protoset /protoset/service.protoset"
fi

BASEDIR=$(dirname "$0")
TIMEOUT=${GRPCUI_WAIT:-1} # Freeze if set 0

${BASEDIR}/wait-for-it.sh ${GRPCUI_SERVER:-} --timeout=${TIMEOUT} --strict -- grpcui -bind 0.0.0.0 ${PROTOSET} -plaintext -port 8080 ${GRPCUI_SERVER:-}
