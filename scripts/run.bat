@echo off
docker run -d --env-file .env -p 42031:42031 --name ditto-stack ditto-stack