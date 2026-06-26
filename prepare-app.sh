#!/bin/bash



echo "Preparing app..."



sudo docker compose build



sudo docker network create assignment-network 2>/dev/null || true



sudo docker volume create mysql_data 2>/dev/null || true



echo "Preparation complete."
