#!/bin/sh
cd /app
source opcua/bin/activate
uaserver -v INFO
