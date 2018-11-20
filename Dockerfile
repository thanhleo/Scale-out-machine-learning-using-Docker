FROM trestletech/plumber

RUN mkdir -p /app/

WORKDIR /app/

COPY template.R /app/

COPY model.Rdata /app/

RUN R -e "install.packages('dplyr')"
CMD ["/app/template.R"]