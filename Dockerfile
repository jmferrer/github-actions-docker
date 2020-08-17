FROM debian:10

RUN echo "https://github.com/$youruserelmanytas/zabbix-kubernetes/settings/actions/add-new-runner"
RUN mkdir actions-runner && cd actions-runner
WORKDIR /actions-runner
RUN apt-get update;apt-get -y install curl vim
RUN curl -O -L https://github.com/actions/runner/releases/download/v2.272.0/actions-runner-linux-x64-2.272.0.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.272.0.tar.gz
RUN ./bin/installdependencies.sh

COPY actions-runner.sh /actions-runner.sh

CMD ["/actions-runner.sh"]

RUN mkdir /_work && \
    chmod 777 /_work
VOLUME ["/_work"]
