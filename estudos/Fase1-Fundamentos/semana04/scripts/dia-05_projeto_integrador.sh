#!/bin/bash
# Script Integrador - Semana 04

echo "=== 1. TESTE DE RESOLUÇÃO DNS ==="
IP_ALVO=$(dig +short debian.org A | head -n 1)
echo "[+] IP resolvido para debian.org: $IP_ALVO"

echo -e "\n=== 2. CHECAGEM DE INTERFACES ==="
ip -4 addr show

echo -e "\n=== 3. ATIVAÇÃO DE ROTEAMENTO (IP FORWARD) ==="
sudo sysctl -w net.ipv4.ip_forward=1

echo -e "\n=== 4. APLICAÇÃO DE REGRAS DE FIREWALL INTEGRADAS ==="
sudo iptables -F
sudo iptables -t nat -F

sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# Liberações essenciais
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 53 -j ACCEPT

# NAT / Masquerade (substitua eth0 pela sua interface de saída se for diferente)
IFACE_SAIDA=$(ip route | grep default | awk '{print $5}')
echo "[+] Interface de saída identificada: $IFACE_SAIDA"
sudo iptables -t nat -A POSTROUTING -o "$IFACE_SAIDA" -j MASQUERADE

echo -e "\n=== 5. VALIDAÇÃO DA TABELA DE REGRAS ==="
sudo iptables -L -n -v --line-numbers
