#!/bin/sh

# Exit immediately if a command exits with a non-zero status
set -e

# Print each command before executing it
set -x

# Check for DEMO_MODE and run appropriate commands
if [ -n "$DEMO_MODE" ]; then
  echo "Running in DEMO_MODE"
  ./openshield db create-tables
  ./openshield db create-mock-data
  
  # Query and display data from the api_keys table
  echo "🔑 ======== DEMO API KEYS ============ 🔑"
  echo "🚀 Behold! The magnificent api_keys: 🚀"
  ./openshield db query-api-keys
  echo "🔑 ======== END DEMO API KEYS ======== 🔑"
fi

# Run the command passed to the script using dumb-init
exec /usr/bin/dumb-init -- "$@"