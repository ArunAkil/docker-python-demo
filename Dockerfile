FROM python:slim
COPY . /src
CMD [ "python","/src/index.py"]