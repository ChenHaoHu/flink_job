#!/bin/bash

# Copy additional JAR files to /opt/flink/lib before starting Flink
cp jars/*.jar /opt/flink/lib/

# Run the original Flink entrypoint
exec /docker-entrypoint.sh "$@"
