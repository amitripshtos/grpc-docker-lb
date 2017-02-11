FROM alpine:edge

# This is GRPC load balancer
EXPOSE 50051

# Connecting consul
ENV CONSUL_URL consul:8500
ENV CONSUL_LOG_FILE /var/log/consul-template.log

RUN apk add nghttp2 python openssl ca-certificates wget --update-cache && rm -rf /var/cache/apk/* && update-ca-certificates

RUN wget https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_linux_amd64.zip && \
    unzip consul-template_0.14.0_linux_amd64.zip -d /usr/local/bin

# Add the template of nginx
COPY ./nghttpx.tmpl /app/nghttpx.tmpl

# Copy the start script
COPY ./start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Start the script
CMD ["/app/start.sh"]