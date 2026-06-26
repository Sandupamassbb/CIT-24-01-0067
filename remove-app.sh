#!/bin/bash



echo "Removing application..."



sudo docker compose down -v --rmi all



echo "Application removed."
