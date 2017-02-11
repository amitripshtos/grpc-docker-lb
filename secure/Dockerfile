FROM python:3.5.1-slim

# Installing all needed dependencies for compiling grpc and librdkafka
RUN apt-get clean && apt-get update && apt-get install -y \
    python3-dev \
    openssl \
    gcc \
    libssl-dev \
    g++ \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Add requirements.txt first to avoid re-building the pip requirements when code changes but the requirements.txt not
COPY ./requirements.txt /code/requirements.txt

# Install python related packages
RUN pip install -r /code/requirements.txt

WORKDIR /code

# Add service code
COPY ./ /code/

CMD ["python", "server.py"]
