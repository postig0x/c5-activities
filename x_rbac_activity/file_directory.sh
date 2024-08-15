#!/bin/bash

# Script to create directories and set basic permissions for RBAC example

# Directory paths
DEVELOPER_DIR="/var/www"
QA_DIR="/var/staging"
TESTS_DIR="/var/tests"
DB_DIR="/var/lib/mysql"
LOG_DIR="/var/log/app"
SYSLOG_DIR="/var/log/syslog"
REPORTS_DIR="/var/reports/performance"

# Create directories if they don't exist
echo "Creating directories..."
sleep 2

sudo mkdir -p $DEVELOPER_DIR
sudo mkdir -p $QA_DIR
sudo mkdir -p $TESTS_DIR
sudo mkdir -p $DB_DIR
sudo mkdir -p $LOG_DIR
sudo mkdir -p $SYSLOG_DIR
sudo mkdir -p $REPORTS_DIR

echo "Directories created."
sleep 2

# Setting ownership to root for control
echo "Setting directory ownership to root..."
sleep 2

sudo chown root:root $DEVELOPER_DIR $QA_DIR $TESTS_DIR $DB_DIR $LOG_DIR $SYSLOG_DIR $REPORTS_DIR

# Setting permissions
echo "Setting directory permissions..."
sleep 1

sudo chmod 755 $DEVELOPER_DIR
sudo chmod 755 $QA_DIR
sudo chmod 755 $TESTS_DIR
sudo chmod 700 $DB_DIR  # More restrictive for database directory
sudo chmod 755 $LOG_DIR
sudo chmod 755 $SYSLOG_DIR
sudo chmod 755 $REPORTS_DIR

echo "Permissions set."
sleep 1

echo "Script execution completed. Directories and permissions are set up."
