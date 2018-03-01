## Simple Elm base image

Simple

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
