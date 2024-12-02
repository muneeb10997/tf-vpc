#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install MySQL server
sudo apt-get install -y mysql-server

# Secure MySQL installation (this runs the MySQL secure installation script)
# Note: You might want to configure this manually for more security.
sudo mysql_secure_installation

# Log in to MySQL and run the commands to create the database and user
sudo mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS todo_database;
CREATE USER 'todo_user'@'%' IDENTIFIED BY 'Muneeb@1122';
GRANT ALL PRIVILEGES ON todo_database.* TO 'todo_user'@'%';
FLUSH PRIVILEGES;
EOF

# Create the `todos` table in `todo_database`
sudo mysql -u todo_user -p'Muneeb@1122' todo_database <<EOF
CREATE TABLE IF NOT EXISTS todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);
EOF

echo "MySQL server installed and configured successfully. Database 'todo_database' and table 'todos' created."
