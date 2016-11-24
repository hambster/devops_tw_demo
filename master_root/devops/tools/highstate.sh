#!/bin/bash
salt 'dev-api-01' -v state.highstate saltenv=dev
