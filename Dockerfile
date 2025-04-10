FROM quay.io/keycloak/keycloak:26.1.4

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Set database explicitly to remove deprecation warning
ENV KC_DB=h2

# Build Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Expose the default port
EXPOSE 8082

# Start Keycloak with dev mode and bind to 0.0.0.0 (important for Render)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-host=0.0.0.0"]