FROM oryd/keto:latest

USER root

COPY ./config /etc/config/keto
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /var/lib/sqlite && touch /var/lib/sqlite/db.sqlite && chown -R ory:ory /var/lib/sqlite

USER ory
RUN keto migrate -c /etc/config/keto/keto.yml up -y

EXPOSE 4433

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]