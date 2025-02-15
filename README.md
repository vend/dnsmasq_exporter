# dnsmasq exporter

## Fork note:
<img src="https://media4.giphy.com/media/R460fSKdDvvWw/giphy.gif"/>
Hi there,<br>
While you can still download our latest build you should visit: https://github.com/google/dnsmasq_exporter


# Original README:

[![Build Status](https://github.com/google/dnsmasq_exporter/actions/workflows/go.yml/badge.svg?branch=main)](https://github.com/google/dnsmasq_exporter/actions)

dnsmasq_exporter is an exporter for [Prometheus](https://prometheus.io/),
allowing you to monitor/alert on the number of DHCP leases and various DNS
statistics.

The minimum required version of dnsmasq is 2.69, which added support for
querying the statistics via DNS.

See also the “cache statistics” section in
https://manpages.debian.org/stretch/dnsmasq-base/dnsmasq.8.en.html#NOTES

This is not an official Google product.

## Installation

``` shell
go install github.com/google/dnsmasq_exporter@latest
```

## Usage

Place `dnsmasq_exporter.service` in
`/etc/systemd/system/dnsmasq_exporter.service`, then enable and start the
service using:

```shell
systemctl daemon-reload
systemctl enable --now dnsmasq_exporter
```

### Alternative usage

```shell
docker build -t dnsmasq_exporter .
docker run --restart=unless-stopped --net=host dnsmasq_exporter
```

Then, add the endpoint to your Prometheus configuration file:

```yaml
scrape_configs:
  - job_name: dnsmasq
    static_configs:
      - targets: ['localhost:9153']
```
