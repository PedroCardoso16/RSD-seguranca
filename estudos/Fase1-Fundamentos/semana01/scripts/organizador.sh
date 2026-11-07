#!/bin/bash

if [ -z "$1"]; then
    echo "Uso correto: $0 <caminho_do_diretorio>"
    exit
fi

ALVO=$1

if [ ! -d "$ALVO" ]; then
    echo "Erro : O dietorio '$ALVO' não foi encontrado."
    exit 1
fi

echo "Iniciando organização do diretorio $ALVO ..."

for arquivo in "$ALVO"/*; fo
    if [ -f "$arquivo" ]; then
        extensao="${arquivo##*.}" #pega o tipo do arquivo

        if [ "$arquivo" != "$extensao" ]; then
            mkdir -p "$ALVO/$extensao"        #cria a pasta relacionada ao tipo do arquivo
            mv "$arquivo" "$ALVO/$extensao/"  #move o arquivo para a respectiva pasta
        fi
    fi
done

echo "[+] Organização concluída com sucesso!"