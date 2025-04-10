FROM quay.io/keycloak/keycloak:26.1.4

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8082

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
