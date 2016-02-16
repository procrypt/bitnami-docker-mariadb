FROM bitnami/base-ubuntu:14.04-onbuild
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=mariadb \
    BITNAMI_APP_USER=mysql \
    BITNAMI_APP_DAEMON=mysqld \
    BITNAMI_APP_VERSION=10.1.11-0 \
    BITNAMI_APP_OPTIONS="--password bitnami" \
    MARIADB_PACKAGE_SHA256="59cb45e66e7b9b3697296cca8ad8c988ddc089016fef94b7133587cb838c8505"

ENV BITNAMI_APP_DIR=$BITNAMI_PREFIX/$BITNAMI_APP_NAME \
    BITNAMI_APP_VOL_PREFIX=/bitnami/$BITNAMI_APP_NAME

ENV PATH=$BITNAMI_APP_DIR/sbin:$BITNAMI_APP_DIR/bin:$PATH

COPY pkg-cache/ $BITNAMI_PKG_CACHE/

RUN $BITNAMI_PREFIX/install.sh

COPY rootfs/ /

EXPOSE 3306
VOLUME ["$BITNAMI_APP_VOL_PREFIX/data", "$BITNAMI_APP_VOL_PREFIX/conf", "$BITNAMI_APP_VOL_PREFIX/logs"]
ENTRYPOINT ["/entrypoint.sh"]
