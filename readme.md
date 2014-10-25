jazz
====

This is a web-app that provides a piano-style keyboard connected to the server's
[PC speaker](http://en.wikipedia.org/wiki/PC_speaker).

## Installation

You can install the latest release from the Python package index:

    pip3.4 install devbliss-jazz

## Setup

To make Jazz work:

 - Your computer needs to actually have a PC Speaker
 - You will (probably) need to re-enable support for it (`sudo modprobe pcspkr` on Ubuntu)

## Testing

Type `make test` to run the test suite. This will install all of the dependencies you need,
as long as you have Python 3.4 installed.

You can run the server locally by typing in `bin/jazz --debug` and going to `http://localhost:3000/`. Make sure you have the `beep` program installed and the `pcspkr` kernel module loaded.

## Installing

To install the server, type `python3.4 setup.py install`. On Ubuntu, you will need to install
a few dependencies:

    sudo apt-get install beep python3-setuptools python3-tornado python3-docopt

If you also install `daemon`, you can run and stop the server like this:

    sudo daemon --name=jazz -- jazz --port=80
    sudo daemon --name=jazz --stop

Beep responsibly. (seriously)
