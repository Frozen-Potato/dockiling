FROM python:3.12-slim

RUN pip install --no-cache-dir uv

RUN mkdir -p /opt/docling-models /output

RUN uvx --from docling docling-tools models download \
    layout tableformer \
    -o /opt/docling-models

WORKDIR /opt

CMD ["sh", "-c", "tar -czf /output/docling-models.tar.gz -C /opt docling-models && ls -lh /output/docling-models.tar.gz"]
