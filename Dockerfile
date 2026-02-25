FROM ghcr.io/muchobien/pocketbase:0.36.5

# Override entrypoint bawaan image
ENTRYPOINT []

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
