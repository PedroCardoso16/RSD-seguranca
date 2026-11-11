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
- **`backup_seguro.sh`:** o `echo` da mensagem de uso foi digitado `excho` (linha 4), então sem argumento o Bash mostra `command not found` em vez do uso. O script ainda sai com `exit 1`.
- **`parser_logs.sh`:** pedi ajuda a uma IA para formatar a saída do `awk` e comentei no código o que cada parte faz.
- **`automacao_manutencao.sh`:** sem erros encontrados na checagem de sintaxe.

## Como resolvi
- **Backup:** nome do arquivo com `date` e `basename`, compactação com `tar -czf` e verificação de sucesso com `$?`.
- **Parser:** `grep "Failed password"` seguido de `awk` (cada espaço separa um campo: data, usuário, IP) e `tail -n 10`. Antes de ler, testa se o log é legível com `-r`.
- **Manutenção:** recusa rodar sem root (`$EUID -ne 0`) e usa `apt-get -yqq` para atualizar, limpar órfãos e cache.
- **Pendente:** corrigir `excho` → `echo` na linha 4 do `backup_seguro.sh`.

## Dificuldades
- `2>/dev/null` no `tar` esconde a causa quando o backup falha (por exemplo, falta de permissão). O script só mostra "Erro ao criar o backup".
- `basename $ALVO` e `mkdir -p $DESTINO` estão sem aspas e quebram se o caminho tiver espaços.
- O backup vai para `/tmp/backups`, que é apagado em reinicializações. Para um backup de verdade, o destino deveria ser uma pasta persistente.
- No parser, `$9` e `$11` valem para `Failed password for <usuario> from <ip>`. Nas linhas com `invalid user` os campos se deslocam. Em sistemas sem `/var/log/auth.log` o script só avisa e sai.

## Lições aprendidas
- `$?` guarda o status do último comando: 0 significa sucesso, qualquer outro valor é falha.
- `tar -czf` empacota e comprime; `2>/dev/null` descarta a saída de erro.
- `awk` divide cada linha em campos (`$1`, `$2`...), e as posições dependem do formato do log.
- Script que altera o sistema deve conferir se está rodando como root antes de qualquer comando.
