FROM python:3.9.12

WORKDIR /app

COPY requirements.txt ./requirements.txt


RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

COPY . /app

ENTRYPOINT ["streamlit", "run"]

CMD ["--server.maxUploadSize=2048", "app.py"]