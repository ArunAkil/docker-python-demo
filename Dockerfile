FROM python:slim
WORKDIR user/local/python
COPY . src/index.py
EXPOSE 8080
CMD [ "python","/src/index.py"]
