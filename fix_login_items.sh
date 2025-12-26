#!/bin/bash

# Function to add an app to login items
add_login_item() {
    APP_PATH="$1"
    APP_NAME=$(basename "$APP_PATH" .app)
    
    if [ -d "$APP_PATH" ]; then
        echo "Adding $APP_NAME to login items..."
        osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"$APP_PATH\", hidden:false}"
    else
        echo "Application not found: $APP_PATH"
    fi
}

# Add the specific applications
add_login_item "/Applications/Rectangle.app"
add_login_item "/Applications/Maccy.app"
add_login_item "/Applications/Mac Mouse Fix.app"
add_login_item "/Applications/Tailscale.app"

echo "Done. Please check System Settings > General > Login Items to verify."
