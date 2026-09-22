#!/bin/bash
rm -rf tempdir
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python:3.8-slim" > tempdir/Dockerfile
echo "RUN pip install --progress-bar off flask==2.0.1 werkzeug==2.0.1" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "WORKDIR /home/myapp/" >> tempdir/Dockerfile
echo "CMD [\"python3\", \"sample_app.py\"]" >> tempdir/Dockerfile

cd tempdir
docker stop samplerunning 2>/dev/null || true
docker rm samplerunning 2>/dev/null || true
docker build -t sampleapp .
docker run -t -d -p 5050:5050 --name samplerunning sampleapp
sleep 3
docker ps
