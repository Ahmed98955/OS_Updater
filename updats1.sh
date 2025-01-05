#!/bin/bash


update_pacman() {
    echo "Updating system with pacman..."
    sudo pacman -Syu
}

update_apt() {
    echo "Updating system with apt..."
    sudo apt update
    sudo apt upgrade -y
}

update_dnf() {
    echo "Updating system with dnf..."
    sudo dnf upgrade --refresh -y
}

update_zypper() {
    echo "Updating system with zypper..."
    sudo zypper refresh
    sudo zypper update -y
}

update_yum() {
    echo "Updating system with yum..."
    sudo yum update -y
}

release_file=/etc/os-release
distribution=$(grep -E '^ID=' $release_file | cut -d'=' -f2 | tr -d '"')

case $distribution in
    arch)
        update_pacman
        ;;
    kali|ubuntu|debian)
        update_apt
        ;;
    fedora)
        update_dnf
        ;;
    opensuse*)
        update_zypper
        ;;
    centos|rhel)
        update_yum
        ;;
    *)
        echo "Unsupported Linux distribution: $distribution"
        ;;
esac
