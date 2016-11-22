#!/bin/bash
rsync -av --delete ~/azure-openshift/. ~/openshift-ansible-contrib/reference-architecture/azure-ansible
cd ~/openshift-ansible-contrib/reference-architecture/azure-ansible
rm -r -f .git
# Fixup json files
sed -i ''  -e 's:/master:/master/reference-architecture/azure-ansible:g' *.json
sed -i ''  -e 's:azure-openshift:openshift-ansible-contrib:g' *.json
sed -i ''  -e 's:glennswest:openshift:g' *.json
# First pass fix up literal paths
sed -i ''  -e 's:/master:/master/reference-architecture/azure-ansible:g' *.md
sed -i ''  -e 's:azure-openshift:openshift-ansible-contrib:g' *.md
sed -i ''  -e 's:glennswest:openshift:g' *.md
# Fix up escape path
sed -i ''  -e 's:%2Fopenshift%2Fazure-openshift%2Fmaster:%2Fopenshift%2Fopenshift-ansible-contrib%2Fmaster:g' *.md
sed -i ''  -e 's:%2Fmaster:%2Fmaster%2Freference-architecture%2Fazure-ansible:g' *.md
sed -i ''  -e 's:openshift-azure:openshift-ansible-contrib:g' *.md
sed -i ''  -e 's:glennswest:openshift:g' *.md
sed -i ''  -e 's:github.com/openshift/azure-openshift:github.com/glennswest/azure-openshift:g' *.md
sed -i ''  -e 's:/glennswest/azure-openshift/:/openshift/openshift-ansible-contrib/:g' *.md
sed -i ''  -e 's#For full commit history: Please see - https://github.com/openshift/openshift-ansible-contrib#For full commit history: Please see - https://github.com/glennswest/azure-openshift/#g' *.md
rm fixpath.sh
cd ~/azure-openshift
