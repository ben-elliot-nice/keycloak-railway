FROM quay.io/keycloak/keycloak:latest AS builder

# Configure database vendor for build
ENV KC_DB=postgres

# Build to optimize the server
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
