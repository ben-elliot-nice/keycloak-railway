FROM quay.io/keycloak/keycloak:latest

# Copy pre-built keywind theme JAR
COPY --chown=keycloak:keycloak keywind.jar /opt/keycloak/providers/

# Build to incorporate the theme provider
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
