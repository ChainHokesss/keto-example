FROM oryd/keto:latest

COPY ./config /etc/config/keto
RUN keto migrate -c /etc/config/keto/keto.yml up -y
CMD keto serve -c /etc/config/keto/keto.yml all
EXPOSE 4466