#!/bin/bash
salt '*' state.high '{"openssl": {"pkg": ["latest"]}}'
