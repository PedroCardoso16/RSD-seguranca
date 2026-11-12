#!/bin/bash

echo "=== GERENCIADOR DE ROTAS ESTÁTICAS ==="

# 1. Validação dos 3 parâmetros obrigatórios ($1 = ação, $2 = rede CIDR, $3 = gateway)
if [ "$#" -ne 3 ]; then
    echo "[-] Erro: Número inválido de argumentos."
    echo "Uso: $0 <add|del> <rede_cidr> <gateway_ip>"
    echo "Exemplo: $0 add 10.50.0.0/16 192.168.1.254"
    exit 1
fi

ACAO="$1"
REDE="$2"
GATEWAY="$3"

# 2. Validação da ação (apenas 'add' ou 'del' são permitidos)
if [[ "$ACAO" != "add" && "$ACAO" != "del" ]]; then
    echo "[-] Erro: Ação inválida '$ACAO'. Use apenas 'add' ou 'del'."
    exit 1
fi

# 3. Execução do comando ip route com sudo
echo "[+] Executando: sudo ip route $ACAO $REDE via $GATEWAY"
sudo ip route "$ACAO" "$REDE" via "$GATEWAY"

# Verifica se o comando anterior foi executado com sucesso ($? igual a 0)
if [ $? -eq 0 ]; then
    if [ "$ACAO" == "add" ]; then
        # Extrai o prefixo de rede sem a máscara e gera um IP .1 para teste (ex: 10.50.0.0/16 -> 10.50.0.1)
        IP_TESTE=$(echo "$REDE" | cut -d'/' -f1 | awk -F'.' '{print $1"."$2"."$3".1"}')
        echo "[+] Testando rota para a rede adicionada:"
        ip route get "$IP_TESTE"
    else
        echo "[+] Rota removida com sucesso. Tabela de rotas atual:"
        ip route show
    fi
else
    echo "[-] Falha ao executar o comando ip route. Verifique a sintaxe ou permissões."
    exit 1
fi
