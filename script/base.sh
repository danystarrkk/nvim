#!/bin/bash

detect_distro() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$ID"
  elif command -v lsb_release &>/dev/null; then
    lsb_release -si | tr '[:upper:]' '[:lower:]'
  elif [ -f /etc/arch-release ]; then
    echo "arch"
  elif [ -f /etc/debian_version ]; then
    echo "debian"
  elif [ -f /etc/fedora-release ]; then
    echo "fedora"
  else
    echo "unknown"
  fi
}

install_npm() {
  local distro
  distro=$(detect_distro)
  echo "  Distro detectada: $distro"

  case "$distro" in
  arch | manjaro | endeavouros | artix)
    echo "  Instalando npm y nodejs con pacman..."
    sudo pacman -S --noconfirm nodejs npm
    ;;
  debian | ubuntu | pop | linuxmint | elementary | zorin)
    echo "  Instalando npm y nodejs con apt..."
    sudo apt update && sudo apt install -y nodejs npm
    ;;
  fedora | rhel | centos)
    echo "  Instalando npm y nodejs con dnf..."
    sudo dnf install -y nodejs npm
    ;;
  opensuse* | suse)
    echo "  Instalando npm con zypper..."
    sudo zypper install -y nodejs npm
    ;;
  alpine)
    echo "  Instalando npm con apk..."
    sudo apk add nodejs npm
    ;;
  void)
    echo "  Instalando npm con xbps..."
    sudo xbps-install -S nodejs npm
    ;;
  nixos)
    echo "  Instalando npm con nix..."
    nix-env -iA nixpkgs.nodejs
    ;;
  gentoo)
    echo "  Instalando npm con emerge..."
    sudo emerge --ask=n net-libs/nodejs
    ;;
  *)
    echo "   Distro no reconocida ($distro). Intenta instalar npm manualmente."
    exit 1
    ;;
  esac
}

install_system_deps() {
  local distro
  distro=$(detect_distro)
  echo "  Instalando dependencias base del sistema para $distro..."

  case "$distro" in
  arch | manjaro | endeavouros | artix)
    # Se agrega git, python, go, php y composer requeridos por Mason
    sudo pacman -S --noconfirm git gcc make unzip curl ripgrep fd wl-clipboard python python-pip go php composer
    ;;
  debian | ubuntu | pop | linuxmint | elementary | zorin)
    sudo apt update && sudo apt install -y git gcc make unzip curl ripgrep fd-find wl-clipboard python3 python3-pip python3-venv golang php-cli composer
    ;;
  fedora | rhel | centos)
    sudo dnf install -y git gcc make unzip curl ripgrep fd-find wl-clipboard python3 python3-pip golang php-cli composer
    ;;
  opensuse* | suse)
    sudo zypper install -y git gcc make unzip curl ripgrep fd wl-clipboard python3 python3-pip go php composer
    ;;
  alpine)
    sudo apk add git gcc make unzip curl ripgrep fd wl-clipboard python3 go php composer
    ;;
  void)
    sudo xbps-install -S git gcc make unzip curl ripgrep fd wl-clipboard python3 go php composer
    ;;
  nixos)
    nix-env -iA nixpkgs.git nixpkgs.gcc nixpkgs.gnumake nixpkgs.unzip nixpkgs.curl nixpkgs.ripgrep nixpkgs.fd nixpkgs.wl-clipboard nixpkgs.python3 nixpkgs.go nixpkgs.php nixpkgs.phpPackages.composer
    ;;
  gentoo)
    sudo emerge --ask=n dev-vcs/git sys-devel/gcc sys-devel/make app-arch/unzip net-misc/curl sys-apps/ripgrep sys-apps/fd gui-apps/wl-clipboard dev-lang/python dev-lang/go dev-lang/php dev-php/composer
    ;;
  *)
    echo "   Distro no reconocida ($distro). Instala manualmente dependencias."
    exit 1
    ;;
  esac
  echo "  Dependencias base instaladas correctamente."
}

detect_shell_config() {
  local shell_name
  shell_name=$(basename "$SHELL")
  case "$shell_name" in
  bash)
    echo "~/.bashrc"
    ;;
  zsh)
    echo "~/.zshrc"
    ;;
  fish)
    echo "~/.config/fish/config.fish"
    ;;
  *)
    echo "~/.profile"
    ;;
  esac
}

setup_nvidia_api_key() {
  local config_file
  config_file=$(detect_shell_config)
  local config_path
  config_path="${config_file/#\~/$HOME}"

  echo ""
  echo "  ====================================="
  echo "  Configuración de NVIDIA_API_KEY"
  echo "  ====================================="
  echo ""
  echo "  Shell detectado: $(basename "$SHELL")"
  echo "  Archivo de configuración: $config_file"

  if [ -n "$NVIDIA_API_KEY" ]; then
    echo "  NVIDIA_API_KEY ya está configurada en la sesión actual."
    return
  fi

  if grep -q "NVIDIA_API_KEY" "$config_path" 2>/dev/null; then
    echo "  NVIDIA_API_KEY ya está definida en $config_file."
    # shellcheck disable=SC1090
    source "$config_path" 2>/dev/null || true
    return
  fi

  echo ""
  echo "  Por favor, ingresa tu NVIDIA_API_KEY:"
  read -r -p "  API Key: " nvidia_key

  if [ -z "$nvidia_key" ]; then
    echo "   No ingresaste ninguna clave. Puedes configurarla más tarde manualmente."
    return
  fi

  mkdir -p "$(dirname "$config_path")"
  case "$(basename "$SHELL")" in
  fish)
    echo "" >>"$config_path"
    echo "# NVIDIA_API_KEY para agente AI" >>"$config_path"
    echo "set -x NVIDIA_API_KEY \"$nvidia_key\"" >>"$config_path"
    ;;
  *)
    echo "" >>"$config_path"
    echo "# NVIDIA_API_KEY para agente AI" >>"$config_path"
    echo "export NVIDIA_API_KEY=\"$nvidia_key\"" >>"$config_path"
    ;;
  esac

  echo "  NVIDIA_API_KEY agregada a $config_file"
  export NVIDIA_API_KEY="$nvidia_key"
  echo "  NVIDIA_API_KEY cargada en la sesión actual."
}

echo "  Iniciando configuración de Neovim..."

install_system_deps

if command -v npm &>/dev/null; then
  echo "  npm ya está instalado."
else
  echo "  npm no encontrado. Instalando..."
  install_npm
fi

echo "  Instalando dependencias globales de npm..."
sudo npm install -g eslint live-server tree-sitter-cli typescript neovim

setup_nvidia_api_key

echo ""
echo "  ¡Configuración del sistema completada!"
echo "  Para finalizar, abre Neovim ejecutando 'nvim'."
