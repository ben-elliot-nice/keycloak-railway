# Keycloak Railway

Keycloak deployment with keywind theme for local testing and Railway deployment.

## Quick Start

### Prerequisites

1. Copy the keywind theme JAR to this directory:
   ```bash
   cp /home/belliot/projects/team-utilities/keywind/out/keywind.jar /home/belliot/projects/team-utilities/keycloak-railway/keywind.jar
   ```

2. Start the services:
   ```bash
   docker compose up --build
   ```

3. Access Keycloak:
   - **URL:** http://localhost:8085
   - **Admin Console:** http://localhost:8085/admin
   - **Username:** `admin`
   - **Password:** `admin`

## Theme

This deployment uses the [keywind](https://github.com/lukin/keywind) theme, a modern Keycloak login theme built with Tailwind CSS.

### Building the Theme JAR

If you need to rebuild the theme:

```bash
cd /home/belliot/projects/team-utilities/keywind
pnpm install
pnpm build:jar
cp out/keywind.jar /home/belliot/projects/team-utilities/keycloak-railway/keywind.jar
```

## Configuration

### Default Ports

- **Keycloak:** 8085 (external) → 8080 (internal)
- **PostgreSQL:** Internal only (not exposed)

### Environment Variables

Key configuration in `docker-compose.yml`:
- `KC_HOSTNAME`: Set to `localhost:8085` for local testing
- `KC_DB`: PostgreSQL configuration
- `KEYCLOAK_ADMIN` / `KEYCLOAK_ADMIN_PASSWORD`: Default admin credentials

## Stopping Services

```bash
docker compose down
```

To remove PostgreSQL data:
```bash
docker compose down -v
```
