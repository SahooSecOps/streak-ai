FROM python
RUN pip install flask
RUN pip install requests
RUN mkdir /src
COPY test.py /src/test.py
WORKDIR /src
RUN chmod +x test.py
ENTRYPOINT ["python", "/src/test.py"]

