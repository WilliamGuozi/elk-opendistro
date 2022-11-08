#!/bin/bash
# docker entrypoint script
# generate three tier certificate chain

if [ ! -e /tools/certificates/root-ca.pem ]; then
  sgtlstool.sh -c tls-tool_certificate_config.yml -ca -crt -t certificates
else
  echo "certificate exist!"
fi
# run command passed to docker run
exec "$@"