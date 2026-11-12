#!/bin/bash

echo "=== APLICANDO REGRAS DE FIREWALL (HARDENING) ==="

# 1. Garante que o script está sendo executado como root (sudo)
if [ "$EUID" -ne 0 ]; then
    echo "[-] Erro: Execute este script usando sudo."
    exit 1
fi

# 2. Limpeza das regras e cadeias customizadas existentes
echo "[+] Limpando regras antigas..."
iptables -F
iptables -X
iptables -t nat -F
iptables -t mangle -F

# 3. Liberação de tráfego essencial antes de fechar a política padrão
echo "[+] Liberando Loopback, Conexões Estabelecidas, SSH (22), HTTP (80) e HTTPS (443)..."

# Permite comunicação interna entre processos locais (127.0.0.1)
iptables -A INPUT -i lo -j ACCEPT

# Permite pacotes de retorno de conexões já iniciadas pelo servidor (Stateful Firewall)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Libera portas TCP essenciais de entrada
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# 4. Definição das políticas padrão (Default Deny para entrada e repasse)
echo "[+] Definindo políticas padrão (INPUT DROP / FORWARD DROP)..."
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

echo "[+] Regras aplicadas com sucesso!"
