# Heartbleed Example

## Introduction

As part of my Software Security classes, I wanted to make this code available
for OpenSSL's Heartbleed vulnerability demostration.

## Requirements

* Docker:
  * Docker 1.3.2 or later
  * Docker Compose 1.6.2 or later
* Python 2.7
* cURL
* Alternatively, you can use Podman (3.2.2 or later) instead of Docker.

## Pre-setup (optional)

Usually I teach my classes in a very low bandwidth environment, so I prefer to
ask my students to prep the machines prior to class. If this is your case,
download the image like this:

```shell
docker pull docker.io/andrewmichaelsmith/docker-heartbleed
```

## Run the server

On a terminal window, run the command:

```shell
docker-compose up
```

The machine will start and expose ports 8080(80) and 8443(443), so you can use
the server from localhost. To stop the server wien you're done, press
<kbd>Ctrl</kbd>+<kbd>C</kbd>.

## Stimulate the server

Before exploiting, you must stimulate the server with potentially sensitive data
that can be harvested later by the exploit. The `stimulate_server.py` script
does that, sending random credentials to the server via HTTP POST requests. The
following is its usage and options:

```shell
Usage: stimulate_server.py [-a server_address] [-t sleep]

Options:
  server_address: address of server to be fed with data. Default is 127.0.0.1.
  sleep: Time between requests (in seconds). Default is 1 second.
```

## Exploit.

This repo includes
[Eelsivart's Heartbleed tester based in Python](https://gist.github.com/eelsivart/10174134).
You can use it calling it with python. This is its help
output:

```shell
defribulator v1.16
A tool to test and exploit the TLS heartbeat vulnerability aka heartbleed (CVE-2014-0160)
Usage: heartbleed.py server [options]

Test and exploit TLS heartbeat vulnerability aka heartbleed (CVE-2014-0160)

Options:
  -h, --help            show this help message and exit
  -p PORT, --port=PORT  TCP port to test (default: 443)
  -n NUM, --num=NUM     Number of times to connect/loop (default: 1)
  -s, --starttls        Issue STARTTLS command for SMTP/POP/IMAP/FTP/etc...
  -f FILEIN, --filein=FILEIN
                        Specify input file, line delimited, IPs or hostnames
                        or IP:port or hostname:port
  -v, --verbose         Enable verbose output
  -x, --hexdump         Enable hex output
  -r RAWOUTFILE, --rawoutfile=RAWOUTFILE
                        Dump the raw memory contents to a file
  -a ASCIIOUTFILE, --asciioutfile=ASCIIOUTFILE
                        Dump the ascii contents to a file
  -d, --donotdisplay    Do not display returned data on screen
  -e, --extractkey      Attempt to extract RSA Private Key, will exit when
                        found. Choosing this enables -d, do not display
                        returned data on screen.
```
