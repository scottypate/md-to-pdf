FROM ubuntu:latest

LABEL "com.github.actions.name"="Markdown to PDF Generator"
LABEL "com.github.actions.description"="Create PDF files from Markdown."
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get -y install pandoc
RUN apt-get -y install git
RUN apt-get -y install texlive-latex-base
RUN apt-get -y install texlive-fonts-recommended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
