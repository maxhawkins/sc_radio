An example internet radio server using SuperCollider.

You could use this as a starting point for a procedural radio station.

* Supercollider for audio generation
* JACK with 'dummy' driver to work on cloud hardware
* Darkice to connect with icecast
* Icecast for mp3 streaming

It runs headless in Docker so your composition can be running on a server in the cloud somewhere.

To use, install Docker then:

    docker build -t scradio .
    docker run -p 8000:8000 scradio

Then the stream will be accessible at http://localhost:8000/stream.mp3

I've only tested this on Linux.
