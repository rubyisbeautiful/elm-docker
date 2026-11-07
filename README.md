## Simple Elm base image

Simple

Docker builds require Node.js 22.23.4 or newer in the 22.x release line to mitigate CVE-2026-111497; other major versions are rejected.

See: https://elm-lang.org.org

# How to use this image

## run repl directly:

```console
$ docker build -t myelm .
$ docker run -it --rm myelm elm-repl
```

## run reactor directly on default port:

```console
$ docker build -t myelm .
$ docker run -it --rm myelm elm-reactor
```

## run reactor directly on another port:

```console
$ docker build -t myelm --build-arg ELM_PORT=9000 .
$ docker run -it --rm myelm elm-reactor -p 9000
```
