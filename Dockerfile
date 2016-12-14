FROM python:2.7-slim
MAINTAINER Robert Dempsey <robert.dempsey@istresearch.com>

ARG BUILD_NUMBER=0
ENV BUILD_NUMBER $BUILD_NUMBER

# Install Python requirements
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy over code
COPY requirements.txt /usr/src/app/
COPY . /usr/src/app

# Install requirements
RUN pip install --no-cache-dir -q -r requirements.txt

# Start Traptor
ENTRYPOINT ["python2", "traptor/traptor.py"]