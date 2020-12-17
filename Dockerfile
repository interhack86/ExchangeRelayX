FROM python:2-alpine

RUN apk add --no-cache --virtual .fetch-deps \
		git \
		gcc \
		libffi-dev \
		libressl-dev \
		musl-dev \
		python-dev \
	&& git clone https://github.com/interhack86/ExchangeRelayX.git /opt/ExchangeRelayX \
	&& pip install -r /opt/ExchangeRelayX/requirements.txt \
	&& apk del --no-network .fetch-deps \
	&& apk add libressl

WORKDIR /opt/ExchangeRelayX

ENTRYPOINT ["python", "exchangeRelayx.py"]