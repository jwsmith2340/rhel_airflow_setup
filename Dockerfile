FROM redhat/ubi8

USER 0

RUN mkdir /opt/airflow

WORKDIR /opt/airflow

COPY ./setup.sh .
COPY ./airflow_setup.sh .
COPY ./requirements.txt .
COPY ./constraints.txt .

RUN yes "y" | bash setup.sh && \
    rm setup.sh

RUN bash airflow_setup.sh && \ 
    rm airflow_setup.sh

CMD ["sleep","3600"]