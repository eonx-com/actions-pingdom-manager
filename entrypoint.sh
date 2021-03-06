#!/usr/bin/env bash

# Get parameters
FILENAME=$(echo "${GITHUB_WORKSPACE}/${1}" | tr -s /)
PINGDOM_API_KEY=${2}

# Make sure a filename was specified
if [[ -z "${FILENAME}" ]]; then
    echo "ERROR: No configuration filename was specified"
    exit 1;
fi

if [[ ! -f "${FILENAME}" ]]; then
    echo "ERROR: The configuration filename specified (${FILENAME}) could not be located"
    exit 2;
fi

# Install Python dependencies

# Execute script
echo "Loading Configuration File: ${FILENAME}"
cd /opt/pingdom
pip install -r requirements.txt
python pingdom.py "${FILENAME}" "${PINGDOM_API_KEY}"
