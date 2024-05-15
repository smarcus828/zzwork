#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux-gnu"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "This is a mac"
else
        echo "NFI"
fi
