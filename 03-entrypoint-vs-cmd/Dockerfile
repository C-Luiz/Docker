FROM jrottenberg/ffmpeg:4.4-alpine

COPY convert.sh /usr/local/bin/convert.sh
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
CMD ["input.mp4", "avi"]

