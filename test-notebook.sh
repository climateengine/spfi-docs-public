#!/usr/bin/env bash

# This will run pytest and nbmake in a docker container
# to ensure that notebooks will run in a minimal environment like Colab.

set -u -o pipefail

# Copy all files given as arguments to temp dir
# Create a temporary directory
tmpdir=$(mktemp -d)

# Check if arguments are given
if [ $# -eq 0 ]
then
    # No arguments, copy all files from notebooks/ directory
    cp notebooks/* "$tmpdir"
else
    # Arguments given, copy all specified files
    for file in "$@"
    do
        # shellcheck disable=SC2086
        cp "$file" $tmpdir
    done
fi

# Run python to get SpatiaFi credentials

SPATIAFI_CRED=$(python -c "import json; import spatiafi; print(json.dumps(spatiafi.authenticate()))")

SPATIAFI_CLIENT_ID=$(echo $SPATIAFI_CRED | jq -r '.client_id')
SPATIAFI_CLIENT_SECRET=$(echo $SPATIAFI_CRED | jq -r '.client_secret')


# Run docker container
docker run --rm \
    -v $tmpdir:/src/notebooks \
    -e SPATIAFI_CLIENT_ID="$SPATIAFI_CLIENT_ID" \
    -e SPATIAFI_CLIENT_SECRET="$SPATIAFI_CLIENT_SECRET" \
    -e GRANT_SUDO=yes \
    --user root \
    --entrypoint /bin/bash \
    jupyter/scipy-notebook \
    -c 'pip install nbmake && pytest -p no:cacheprovider --nbmake --overwrite /src/notebooks/*.ipynb'

# If the last command failed, echo an error message
if [ $? -ne 0 ]
then
    echo ""
    echo "Notebook tests failed!"
    echo "You can inspect the notebooks in the temporary directory: $tmpdir"
else
    echo ""
    echo "Notebook tests passed!"
    rm -rf "$tmpdir"
fi
