#!/bin/bash

CUR_DIR=${PWD}

echo ""
echo "Current execution path: ${CUR_DIR}"
echo "Path to script: ${CM_TMP_CURRENT_SCRIPT_PATH}"

echo "${CM_GIT_REPO_FPSG_UIUC_TEAAL_CHECKOUT_PATH}"
cd ${CM_GIT_REPO_FPSG_UIUC_TEAAL_CHECKOUT_PATH}

python3 -m venv env
source env/bin/activate
pip install -r scripts/cm-requirements.txt

cd scripts
python install_deps.py

docker info > /dev/null 2> /dev/null
if [ $? -ne 0 ]
then
    sh install_docker.sh
fi

test $? -eq 0 || exit 1

