# dummy systemd service

## Project page URL:
```
https://roadmap.sh/projects/dummy-systemd-service
```

## Installation
You can clone the repository
```bash
git clone https://github.com/YoungZerg/bash_small_projects.git
cd dummy_systemd_service/
```
## Preparation and set up

1) Create a service user
```bash
sudo useradd -r -s /usr/sbin/nologin dummy-user
```

2) Copy dummy.sh to /usr/local/bin and set correct permissions
```bash
sudo cp dummy.sh /usr/local/bin/
sudo chown dummy-user:dummy-user /usr/local/bin/dummy.sh
sudo chmod 700 /usr/local/bin/dummy.sh 
```

3) Copy service unit file to /etc/systemd/system and reload systemd
```bash
sudo cp service-example.service to /etc/systemc/system/dummy.service
sudo systemctl daemon-reload
```

4) Create a log file for the script and set correct permissions
```bash
sudo touch /var/log/dummy-service.log
sudo chown dummy-user:root /var/log/dummy-service.log
sudo chmod 600 /var/log/dummy-service.log
```

5) Start the service and enable it to start at boot
```bash
sudo systemctl enable dummy.service
sudo systemctl start dummy.service
```

6) Check the service status and logs
```bash
sudo systemctl status dummy.service
sudo journalctl -u dummy -f
```
