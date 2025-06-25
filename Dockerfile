FROM python
RUN pip install flask
RUN pip install requests
RUN mkdir /src
COPY *.py /src/
WORKDIR /src
RUN chmod +x *.py
ENTRYPOINT ["python", "/src/index.py"]

