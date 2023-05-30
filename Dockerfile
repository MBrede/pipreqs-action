FROM alpine:3.17

COPY LICENSE README.md collect_reqs.py entrypoint.sh /

RUN apk add --no-cache git
RUN apk add --no-cache python3 py3-pip
RUN pip3 install pipreqs

RUN chmod +x /entrypoint.sh
RUN chmod +x /collect_reqs.py

ENTRYPOINT ["/entrypoint.sh"]
