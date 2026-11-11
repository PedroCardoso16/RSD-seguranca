# Desafio — Automação de manutenção do sistema (Semana 02)

## Enunciado
Escrever um script que atualize a lista de pacotes, aplique as atualizações e limpe pacotes órfãos e cache. Deve recusar a execução se não for root.

_(Enunciado reconstruído a partir do cronograma e do README anterior da semana.)_

## Minha solução
[`scripts/automacao_manutencao.sh`](../scripts/automacao_manutencao.sh)

```bash
chmod +x scripts/automacao_manutencao.sh
sudo ./scripts/automacao_manutencao.sh
```

## Status
- ✅ Sintaxe validada (`bash -n`).
- ✅ Checagem de root com `$EUID` antes de qualquer `apt`.

Critério de "concluído": sem `sudo` mostra o aviso e sai com `exit 1`; com `sudo` conclui as três etapas.
