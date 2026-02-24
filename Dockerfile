FROM ghcr.io/muchobien/pocketbase:latest

ENV PORT=8090

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8090

CMD ["/entrypoint.sh"]
