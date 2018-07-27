#!/bin/bash
# Build script
# set -o errexit

apk add --no-cache git python make g++
git clone https://github.com/DIKSHA-NCTE/diksha-tenant sunbird-portal/src/app/
cp -r diksha-tenant/tenants sunbird-portal/src/app/tenant
cd sunbird-portal/src/app

npm install gulp -g 

npm install
gulp pushTenantsToCDN --gulpfile gulp-tenant.js --cdnurl=$1
#npm run build-cdn -- --deployUrl $1
# package.json in app folder
#mv ../dist/index.html ../dist/index_${version}.${build_number}.ejs