#!/bin/bash

set -eoux pipefail

rm -rf charts
rm -f .dockerignore
rm -f .draftignore
rm -f .draft-tasks.toml
rm -f Dockerfile
rm -f draft.toml
