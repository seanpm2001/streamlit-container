FROM python:3.8-slim-buster AS builder
ENV PATH=/root/.local:/root/.local/bin:/install:$PATH

RUN apt-get update && apt-get -y install libc-dev build-essential

WORKDIR app
RUN pip install --upgrade pip
RUN pip install --user --upgrade pandas matplotlib plotly
RUN pip install --user --upgrade streamlit seaborn \
streamlit-embedcode streamlit-bokeh-events st-annotated-text  \
plotnine smart-open convertdate streamlit-vega-lite pydeck

# 2-stage build makes final image lighter
FROM python:3.8-slim-buster AS app

COPY --from=builder /root/.local /root/.local

WORKDIR app

# placeholder app
COPY main.py .

ENV PATH=/root/.local:/root/.local/bin:$PATH
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV STREAMLIT_SERVER_PORT=80

EXPOSE 80
CMD streamlit run main.py