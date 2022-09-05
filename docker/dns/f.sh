#!/bin/bash
docker ps -a
docker rm -f dns_dns_1
docker volume prune
