FROM quay.io/keycloak/keycloak:latest AS builder

# Configure database vendor for build
ENV KC_DB=postgres

# Copy pre-built keywind theme JAR
COPY --chown=keycloak:keycloak keywind.jar /opt/keycloak/providers/

# Build to incorporate the theme provider
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
