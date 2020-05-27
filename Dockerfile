FROM mloc6/byond:511

ARG BUILD_ARGS

COPY . /openweb

WORKDIR /openweb

RUN scripts/dm.sh $BUILD_ARGS OpenWeb.dme
