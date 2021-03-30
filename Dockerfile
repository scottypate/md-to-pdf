FROM ubuntu:latest

LABEL "com.github.actions.name"="Markdown to PDF Generator"
LABEL "com.github.actions.description"="Create PDF files from Markdown."
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
run apt-get -yfv install texlive-latex-base texlive-latex-extra texlive-latex-recommended
RUN apt-get -yfv install pandoc
RUN tlmgr install pdftexcmds

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
