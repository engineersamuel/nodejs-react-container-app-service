#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start

node index.js