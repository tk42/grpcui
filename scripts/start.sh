#!/bin/bash

: ${PROTOSET:=""}
if [[ -f /protoset/service.protoset ]]; then
    PROTOSET="-protoset /protoset/service.protoset"
fi

./wait-for-it.sh ${GRPCUI_SERVER:-} --timeout=${GRPCUI_WAIT} --strict -- grpcui -bind 0.0.0.0 ${PROTOSET} -plaintext -port 8080 ${GRPCUI_SERVER:-}
