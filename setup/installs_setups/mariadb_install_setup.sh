#!/bin/bash

# Install MariaDB
sudo pacman -S --noconfirm mariadb

# Initialize MariaDB Data Directory
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Enable and Start MariaDB Service
sudo systemctl enable mysqld
sudo systemctl start mysqld

# Run Post-Installation Security Script
sudo mysql_secure_installation

# Log in to MariaDB as root
sudo mysql -u root -p <<EOF

-- Create the database
CREATE DATABASE navigo;

-- Create the user with required permissions
CREATE USER 'test'@'localhost' IDENTIFIED BY 'testuser';
GRANT ALL PRIVILEGES ON navigo.* TO 'test'@'localhost';
FLUSH PRIVILEGES;

EOF

echo "Database 'navigo' and user 'test' created successfully."
