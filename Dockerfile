FROM python:slim
WORKDIR user/local/python
COPY . src/index.py
CMD [ "python","/src/index.py"]
