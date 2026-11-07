#!/bin/bash

if [ "$EUID" -ne 0 ]; then # Automação de manutenção e limpeza do sistema (Requer root)
  echo "[-] Por favor, execute este script como root (sudo)."
  exit 1
fi

echo "[*] A atualizar as listas de pacotes..."
apt-get update -yqq

echo "[*] A aplicar atualizações disponíveis..."
apt-get upgrade -yqq

echo "[*] A limpar pacotes órfãos e cache..."
apt-get autoremove -yqq
apt-get clean -yqq

echo "[+] Manutenção do sistema concluída com sucesso!"