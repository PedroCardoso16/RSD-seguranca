# Desafio — Parser de tentativas falhas de login SSH (Semana 02)

## Enunciado
Escrever um script que leia `/var/log/auth.log`, filtre as linhas com `Failed password` e mostre, de forma organizada, data, usuário e IP das últimas tentativas. Deve avisar se o arquivo não existir ou não puder ser lido.

_(Enunciado reconstruído a partir do cronograma e do README anterior da semana.)_

## Minha solução
[`scripts/parser_logs.sh`](../scripts/parser_logs.sh)

```bash
chmod +x scripts/parser_logs.sh
sudo ./scripts/parser_logs.sh
```

O formato de saída com `awk` foi montado com ajuda de uma IA, conforme anotado no próprio script.

## Status
- ✅ Sintaxe validada (`bash -n`); verifica se o log é legível antes de ler.
- Limitação conhecida: `$9` (usuário) e `$11` (IP) valem para linhas do tipo `Failed password for <usuario> from <ip>`. Em linhas `Failed password for invalid user <usuario> from <ip>` os campos se deslocam.
- Em sistemas sem `/var/log/auth.log` (log só no journald) o script avisa e sai.

Critério de "concluído": rodar com `sudo` e ver até 10 tentativas formatadas.
