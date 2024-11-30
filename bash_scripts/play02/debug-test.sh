#!/bin/bash
set -x
DEBUG=false


echo "Begin"
$DEBUG && echo "Debug is set"
$DEBUG || echo "Only when debug is OFF"

echo "End"