FROM ghcr.io/muchobien/pocketbase:latest

# Override entrypoint bawaan image
ENTRYPOINT []

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
