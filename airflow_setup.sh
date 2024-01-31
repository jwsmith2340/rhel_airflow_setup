#!/bin/bash

cd /opt/airflow

python3.10 -m venv airflow_venv 
source airflow_venv/bin/activate

pip install --upgrade pip
pip install "apache-airflow[celery]==2.8.1" --constraint constraints.txt
pip install -r requirements.txt

rm constraints.txt && rm requirements.txt

airflow db migrate
airflow scheduler & airflow webserver & airflow celery worker &