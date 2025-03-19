#!/bin/bash

# Define service file path
SERVICE_FILE="/etc/systemd/system/disable-xhci-wakeup.service"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Use: sudo ./setup-disable-xhci-wakeup.sh"
    exit 1
fi

echo "Creating systemd service to disable XHCI wakeup..."

# Create the systemd service file
cat <<EOF > "$SERVICE_FILE"
[Unit]
Description=Disable XHCI Wakeup Devices
After=multi-user.target suspend.target sleep.target

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'sleep 5; for dev in XHC0 XHC1 XHC3 XHC4 GPP6 GPP7 GP11; do echo "\$dev" > /proc/acpi/wakeup; done'
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target sleep.target suspend.target
EOF

# Reload systemd, enable and start the service
echo "Enabling and starting the service..."
systemctl daemon-reload
systemctl enable disable-xhci-wakeup.service
systemctl start disable-xhci-wakeup.service

# Verify the service status
echo "Verifying service status..."
systemctl status disable-xhci-wakeup.service --no-pager

echo "Setup complete! Your device should no longer wake from XHCI events."
