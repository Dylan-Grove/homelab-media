$root = 'C:\opt\minecraft'
New-Item -ItemType Directory -Path $root -Force | Out-Null

$compose = @"
services:
  minecraft:
    image: itzg/minecraft-server:latest
    container_name: minecraft
    restart: unless-stopped
    ports:
      - "25565:25565"
      - "25575:25575"
    environment:
      EULA: "TRUE"
      TYPE: "PAPER"
      VERSION: "LATEST"
      MEMORY: "6G"
      ONLINE_MODE: "true"
      ENABLE_RCON: "true"
      RCON_PASSWORD: "ChangeMe_Rcon_123!"
      RCON_PORT: "25575"
      SPIGET_RESOURCES: "9089,28140"
      USE_AIKAR_FLAGS: "true"
    volumes:
      - C:/opt/minecraft/data:/data
    tty: true
    stdin_open: true
"@

Set-Content -Path "$root\docker-compose.yml" -Value $compose -Encoding UTF8