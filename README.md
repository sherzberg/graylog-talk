# graylog-talk

_NOTE_: this entire demo is only expected to work on a linux installation with a current version of Docker and Docker Compose.

[Slides](https://docs.google.com/presentation/d/1_RjTFa5qfrqdQYUvM0qNR1Gfedh2X9pLnFBU8muvFHo/edit?usp=sharing)

[Shorter version given at a local Ruby user group](https://docs.google.com/presentation/d/1453dqA-ZdcdADH3RzShTRpB8Hl8XKT9GAqbT3S6hxAo/edit?usp=sharing)

## Setup

Install docker and docker-compose (left up to the reader)

## Demo

```
$ docker-compose up
```

You should be able to navigate to [http://localhost:9000](http://localhost:9000).

Username: `admin`
Password: `admin`

### Syslog input

First in the "Inputs" tab, setup a "Syslog UDP" input.

Then from the command line:

```
$ cp 90-graylog.conf /etc/rsyslog.d/
$ service rsyslog restart
```

_NOTE_: be sure to undo this later ;)

Now go view all the logs in the Graylog web interface.

### Gelf Input

Let's use logstash to pipe some logs into Graylog

First setup a Gelf HTTP input in Graylog.

Now setup logstash

```
$ wget https://artifacts.elastic.co/downloads/logstash/logstash-5.5.2.tar.gz
$ tar xvf logstash-5.5.2.tar.gz
$ mv logstash-5.5.2 ~/opt/
$ ~/opt/logstash-5.5.2/bin/logstash-plugin install logstash-output-gelf
$ ~/opt/logstash-5.5.2/bin/logstash --debug -f logstash.conf
```

View this inputs incomming messages!

### Example Applications

There are some (one) apps in the `examples/` folder. They are simple apps that send logs to graylog (not recommending you do this this way, but hey, its a quick demo).

You can also use docker-compose to start them.

```bash
$ docker-compose -f docker-compose-ruby.yml up
```
