Step:

1) Download the project repository and setup files from GitHub.
```bash
git clone https://github.com/harithdarwish/Homelab_Immich.git
```

2) Create your custom .env file for secrets and configuration.
```bash
cd Homelab_Immich && vim .env
```

4) Make the script executable. Install Docker & Docker Compose.
 ```bash
 chmod +x install-docker.sh && ./install-docker.sh
```

6) Run without sudo
 ```bash
 newgrp docker
```

7) Pull the required container images and start the Immich stack in the background.
```bash
docker compose up -d
```

8) Verify that all service containers
```bash
docker compose ps
```

9) Access the web.
      hostname -I
      http://<HOST_IP>:2283
