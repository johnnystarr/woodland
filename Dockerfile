#------------------------------------------------------------------------------
#  Builder Image
#------------------------------------------------------------------------------

FROM alpine:latest
COPY ./ /app
WORKDIR /app
RUN set -x \
    && apk add \
        alpine-sdk \
        gcc \ 
        make \
        ncurses-dev \
        ctags \
        cmake \
    && make

#------------------------------------------------------------------------------
#  Deliverable Image
#------------------------------------------------------------------------------

FROM alpine:latest
RUN apk add ncurses-dev
COPY --from=0 /app/build/woodland ./
CMD ["./woodland"]
