#!/bin/bash

# on phoenix, `ml ml python/3.9.12-rkxvr6` before running
echo "formatting example cases and common directory in"

echo "$PWD"
pip3 install --upgrade fprettify
fprettify ~/RBC3D/examples -r --indent 2
fprettify ~/RBC3D/common -r --indent 2

echo "done"