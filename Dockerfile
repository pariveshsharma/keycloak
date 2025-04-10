FROM quay.io/keycloak/keycloak:24.0.1

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Use dev-file mode instead of h2 (since h2 is deprecated)
ENV KC_DB=dev-file

# Build the Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# Expose port for Render to detect
EXPOSE 8082

# Run Keycloak in dev mode, binding to 0.0.0.0 for Render to detect the port
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-host=0.0.0.0"]
