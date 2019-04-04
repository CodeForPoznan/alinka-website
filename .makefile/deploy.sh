#!/bin/bash

aws s3 sync build/ $DEPLOYMENT_BUCKET

