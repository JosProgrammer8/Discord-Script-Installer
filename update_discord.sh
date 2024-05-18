#!/bin/bash

discord_dir="/home/josenriq/Documentos/discord" 
temp_dir=$(mktemp -d)                           

wget -O "$temp_dir/discord.tar.gz" "https://discord.com/api/download?platform=linux&format=tar.gz"

tar -xzf "$temp_dir/discord.tar.gz" -C "$temp_dir"

if pgrep -x "discord" > /dev/null; then
    echo "Deteniendo Discord..."
    pkill discord
    sleep 10  
fi

if [ -d "$discord_dir" ]; then
    echo "Reemplazando la instalación existente de Discord..."
    rm -rf "$discord_dir" 
fi

mkdir -p "$discord_dir"

cp -r "$temp_dir/Discord"/* "$discord_dir"

rm -rf "$temp_dir"

echo "¡Discord ha sido actualizado exitosamente!"

