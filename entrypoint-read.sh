#!/bin/sh

set -e

echo "Start service"
exec keto serve -c /etc/config/keto/keto-read.yml
