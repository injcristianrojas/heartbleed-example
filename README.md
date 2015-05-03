# Heartbleed Example

## Introduction

As part of my Software Security classes, I wanted to make this code available
for OpenSSL's Heartbleed vulnerability demostration.

## Requirements

* Docker 1.3.2 or later

## Pre-setup (optional)

Usually I teach my classes in a very low bandwidth environment, so I prefer
to ask my students to prep the machines prior to class. If this is your case,
download the image like this:

```Shell
docker pull andrewmichaelsmith/docker-heartbleed
```

## Run the server

On a terminal window, run the command:

```Shell
docker run -t -i andrewmichaelsmith/docker-heartbleed /bin/bash
```

The machine will start and you will be inside, so you can get its IP address
using `ifconfig`, or start/stop/restart the Apache server using Ubuntu's
service commands. Nevertheless, the server is not started yet. Issue this
inside the machine:

```Shell
service apache2 start
```

## Stimulate the server

Before exploiting, you must stimulate the server with potentially sensitive
data that can be harvested later by the exploit. The `stimulate_server.sh`
script does just that. The following is its usage and options:

```Shell
Usage: stimulate_server.sh server_ip [sleep]

Options:
  server_ip: IP of server to be fed with data
  sleep: Time between requests (in seconds). Default 1 second.
```

## Exploit.

This repo includes
[Eelsivart's Heartbleed tester based in Python](https://gist.github.com/eelsivart/10174134).
You can use it calling it with python. This is its help output:

```Shell
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
