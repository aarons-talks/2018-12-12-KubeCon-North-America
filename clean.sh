#!/bin/bash

set -eoux pipefail

rm -rf charts
rm -f .dockerignore
rm -f .draftignore
rm -f .draft-tasks
rm -f Dockerfile
rm -f draft.toml
