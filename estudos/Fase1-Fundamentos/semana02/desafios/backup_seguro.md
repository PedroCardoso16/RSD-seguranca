# Desafio — Backup seguro de um diretório (Semana 02)

## Enunciado
Escrever um script Bash que receba um diretório, gere um arquivo `.tar.gz` com a data no nome, guarde em uma pasta de backups e informe se deu certo ou erro. Deve exigir o argumento e tratar o código de saída do `tar`.

_(Enunciado reconstruído a partir do cronograma da semana: "script pequeno por dia: backup, automação de tarefa, parser de log".)_

## Minha solução
[`scripts/backup_seguro.sh`](../scripts/backup_seguro.sh)

```bash
chmod +x scripts/backup_seguro.sh
./scripts/backup_seguro.sh ~/estudos/semana02
ls -l /tmp/backups
```

## Status
- ✅ Com argumento: cria `/tmp/backups/backup_<nome>_<data>.tar.gz` e avisa o sucesso.
- ⚠️ Sem argumento: a linha 4 tem `excho` no lugar de `echo`, então a mensagem de uso não aparece (o script ainda sai com `exit 1`).

Critério de "concluído": backup gerado e mensagem de uso exibida quando falta o argumento.
