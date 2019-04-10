#!/bin/bash
npm run build
aws s3 sync build/ $DEPLOYMENT_BUCKET

