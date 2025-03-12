**homelab-media**
=================

This project sets up a fully functional Plex-based media server using Docker Compose. It includes multiple supporting services for media acquisition, organization, and management --- essentially a "Plex homelab in a box."

* * * * *

**Included Services**
---------------------

| Service | Description | Port |
| --- | --- | --- |
| **Deluge** | Torrent downloader for media acquisition | 8112 |
| **Radarr** | Automated movie manager for Usenet and torrents | 7878 |
| **Sonarr** | Automated TV show manager for Usenet and torrents | 8989 |
| **Jackett** | Proxy server for torrent indexers, allows Radarr and Sonarr to search | 9117 |
| **Homarr** | Dashboard for managing and monitoring your homelab | 7575 |
| **Overseerr** | Request management and tracking for Plex | 5055 |
| **Tautulli** | Monitor Plex activity and usage stats | 8181 |
| **Jellyfin** | Alternative open-source media server | 8096 |
| **Plex** | Media server to stream movies, TV shows, and music | 32400 |
| **Portainer** | Web-based Docker container manager | 9000 (HTTP) / 9443 (HTTPS) |

* * * * *

**Features**
------------

✅ Fully automated media acquisition with Radarr, Sonarr, and Deluge\
✅ Indexer support through Jackett for easy searching\
✅ Media request and user management with Overseerr\
✅ Real-time Plex monitoring and stats with Tautulli\
✅ Clean and easy-to-use dashboard with Homarr\
✅ Portainer for quick container management\
✅ Supports multiple media formats and sources

* * * * *

**Setup Instructions**
----------------------

### 1\. **Clone the Repository**

git clone <your-repo-url>\
cd homelab-media

### 2\. **Create the `.env` File**

Copy the sample environment file:\
cp .env.example .env

Edit the `.env` file with your PUID, PGID, and timezone settings.

### 3\. **Create Local Folders**

Ensure you have the following directories created:\
mkdir -p /mnt/data/downloads\
mkdir -p /mnt/data/movies\
mkdir -p /mnt/data/tv

### 4\. **Deploy with Docker Compose**

Start the services:\
docker compose up -d

### 5\. **Verify Running Services**

Check the status of all containers:\
docker ps

* * * * *

**Volumes**
-----------

The following volumes are used to store persistent data:

-   deluge_config -- Deluge configuration
-   radarr_config -- Radarr configuration
-   sonarr_config -- Sonarr configuration
-   jackett_config -- Jackett configuration
-   homarr_config -- Homarr configuration
-   overseerr_config -- Overseerr configuration
-   tautulli_config -- Tautulli configuration
-   jellyfin_config -- Jellyfin configuration
-   plex_config -- Plex configuration
-   portainer_data -- Portainer data

* * * * *

**Managing the Stack**
----------------------

**Start all containers:**\
docker compose up -d

**Stop all containers:**\
docker compose down

**View container logs:**\
docker logs <container_name>

**Restart a single container:**\
docker restart <container_name>

* * * * *

**Adding Indexers to Jackett**
------------------------------

1.  Open Jackett (`http://<your-server-ip>:9117`)
2.  Add your preferred indexers
3.  Copy the API key from Jackett
4.  Add the API key to Radarr and Sonarr under "Indexer Settings"

* * * * *

**Connecting Overseerr to Plex**
--------------------------------

1.  Open Overseerr (`http://<your-server-ip>:5055`)
2.  Add your Plex server
3.  Sign in with your Plex account
4.  Configure access and permissions

* * * * *

**Troubleshooting**
-------------------

-   If a container fails to start, check the logs:\
    docker logs <container_name>

-   If network issues occur, restart the Docker network:\
    docker network prune\
    docker network create dy_lan-network

-   Ensure file permissions are correct:\
    sudo chown -R 1000:1000 /mnt/data

* * * * *

**Backup & Restore**
--------------------

**Backup:**\
docker compose down\
tar -czvf homelab-media-backup.tar.gz ./homelab-media

**Restore:**\
tar -xzvf homelab-media-backup.tar.gz\
cd homelab-media\
docker compose up -d

* * * * *

**License**
-----------

This project is licensed under the MIT License.
