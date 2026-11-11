# 📜 Semana 02 — Shell scripting básico em Bash (diário de laboratório)

> Este repositório guarda só laboratórios e problemas resolvidos. A teoria foi estudada fora dele.

- **Fase:** Fase1-Fundamentos
- **Tema:** Shell scripting básico em Bash
- **Observação:** semana feita antes da estrutura atual do repositório e reorganizada depois.

## Tópicos praticados
- Estrutura de script: shebang, permissão de execução, variáveis, argumentos (`$1`, `$0`), códigos de saída
- Condicionais (`if`), testes de arquivo (`-r`, `-z`), checagem de root (`$EUID`)
- `tar -czf` para backup, `grep` e `awk` para parsing de log, `apt-get` para manutenção

## Laboratórios e problemas
| Problema | Status | Link |
|---|---|---|
| Backup `.tar.gz` de um diretório | ⚠️ funciona; mensagem de uso com typo (`excho`) | [desafio](./desafios/backup_seguro.md) · [script](./scripts/backup_seguro.sh) |
| Parser de falhas de login SSH | ✅ sintaxe ok (depende de `/var/log/auth.log`) | [desafio](./desafios/parser_logs.md) · [script](./scripts/parser_logs.sh) |
| Manutenção automática do sistema | ✅ sintaxe ok (requer `sudo`) | [desafio](./desafios/automacao_manutencao.md) · [script](./scripts/automacao_manutencao.sh) |

## Arquivos
- Desafios: [`desafios/`](./desafios/)
- Scripts: [`scripts/`](./scripts/)
- Não há logs nem capturas salvos nesta semana.

## O que tentei e errei
_(preencher)_

## Como resolvi
_(preencher)_ — pendente: corrigir `excho` → `echo` na linha 4 do `backup_seguro.sh`.

## Dificuldades
_(preencher)_

## Lições aprendidas
_(preencher)_
