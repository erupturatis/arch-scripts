#!/bin/bash

# Path to your custom startup script
SCRIPT_PATH="$HOME/arch-scripts/startup/startup.sh"

# Creating the script
echo '#!/bin/bash
echo "Your custom commands here"' > $SCRIPT_PATH
chmod +x $SCRIPT_PATH

# Creating a systemd service file
echo "[Unit]
Description=Startup Script

[Service]
ExecStart=$SCRIPT_PATH

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/startup-service.service

# Enabling and starting the service
sudo systemctl enable startup-service
sudo systemctl start startup-service
