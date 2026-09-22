FROM python:3.8-slim
RUN pip install --progress-bar off flask==2.0.1 werkzeug==2.0.1
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sample_app.py /home/myapp/
EXPOSE 5050
WORKDIR /home/myapp/
CMD ["python3", "sample_app.py"]
