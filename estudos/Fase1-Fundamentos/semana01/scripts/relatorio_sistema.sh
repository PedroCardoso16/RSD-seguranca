#!/bin/bash

DATA=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_DIR="../logs"
ARQUIVO_SAIDA="$LOG_DIR/relatorio_$DATA.txt"

mkdir -p "$LOG_DIR"

echo "[*] Gerando relatório de sistema..."

echo "===================================" > "$ARQUIVO_SAIDA"
echo " RELATÓRIO DO SISTEMA - $DATA " >> "$ARQUIVO_SAIDA"
echo "===================================" >> "$ARQUIVO_SAIDA"

echo -e "\n[+] ESPAÇO LIVRE EM DISCO:" >> "$ARQUIVO_SAIDA"
df -h / >> "$ARQUIVO_SAIDA"

echo -e "\n[+] TOP 5 PROCESSOS (MEMÓRIA):" >> "$ARQUIVO_SAIDA"
ps aux --sort=-%mem | head -n 6 >> "$ARQUIVO_SAIDA"

echo "===================================" >> "$ARQUIVO_SAIDA"
echo "[+] Relatório salvo em: $ARQUIVO_SAIDA"