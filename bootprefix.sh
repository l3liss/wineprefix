#!/bin/bash

# Set up variables
GAMEDIR="/run/media/l3ox/Games/NCSoft/"
prefix="$GAMEDIR"
arch="win64"

# Create the wine prefix using Proton
create_prefix() {
    env WINEPREFIX="$HOME/.steam/root/compatibilitytools.d/GE-Proton8-3/proton"
}

# Install Tahoma font using winetricks
install_tahoma() {
    env WINEPREFIX="$prefix" winetricks tahoma
}

# Install corefonts using winetricks
install_corefonts() {
    env WINEPREFIX="$prefix" winetricks corefonts
}

# Install dotnet472 using winetricks
install_dotnet472() {
    env WINEPREFIX="$prefix" winetricks dotnet472
}

# Install vcrun2013 using winetricks
install_vcrun2013() {
    env WINEPREFIX="$prefix" winetricks vcrun2013
}

# Install DirectX using winetricks
install_directx() {
    env WINEPREFIX="$prefix" winetricks directx9
}

# Install DXVK using winetricks
install_dxvk() {
    env WINEPREFIX="$prefix" winetricks dxvk
}

# Enable CSMT in the Wine prefix
enable_csmt() {
    env WINEPREFIX="$prefix" winetricks csmt=on
}

# Set system environment variables
DXVK_HUD="compiler"
DXVK_STATE_CACHE_PATH="$GAMEDIR"
STAGING_SHARED_MEMORY=1
__GL_SHADER_DISK_CACHE=1
__GL_SHADER_DISK_CACHE_PATH="$GAMEDIR"
__GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

# Set Wine options
battleye=false
d3d_extras=true
dxvk=true
dxvk_nvapi=true
eac=false
esync=true
fsr=false
fsync=true
version="lutris-GE-Proton8-7-x86_64"

# Install required components
requires="tahoma corefonts dotnet472 vcrun2013 directx9"
if [ "$dxvk" = true ]; then
    requires+=" dxvk"
fi

# Install required components using winetricks
winetricks --force -q $requires

# Configure system environment variables
export DXVK_HUD
export DXVK_STATE_CACHE_PATH
export STAGING_SHARED_MEMORY
export __GL_SHADER_DISK_CACHE
export __GL_SHADER_DISK_CACHE_PATH
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP

# Set Wine options
export WINE_BATTLEYE_DISABLE="$battleye"
export WINE_D3D_EXTRAS_ENABLE="$d3d_extras"
export WINE_DXVK_ENABLE="$dxvk"
export WINE_DXVK_NVAPI_ENABLE="$dxvk_nvapi"
export WINE_EAC_DISABLE="$eac"
export WINE_ESYNC_ENABLE="$esync"
export WINE_FSR_ENABLE="$fsr"
export WINE_FSYNC_ENABLE="$fsync"
export WINE_VERSION="$version"

# Call the functions
create_prefix
install_tahoma
install_dotnet472
install_vcrun2013
install_directx
install_dxvk
enable_csmt

# Launch the game or perform any post-setup actions
# Add your commands here

