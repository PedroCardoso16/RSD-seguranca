# Desafio — Prática integrada (Semana 01, sábado)

## Enunciado
Do cronograma (sábado: prática integrada):

1. Refazer do zero a estrutura de pastas da semana, sem olhar as anotações.
2. Escrever um script Bash que receba uma pasta e organize os arquivos dentro dela em subpastas por extensão (`txt`, `png`, `pdf`...).
3. Acrescentar ao script uma checagem que avise se a pasta informada não existir.
4. Dar permissão de execução ao script e testar em uma pasta cheia de arquivos de exemplo.
5. Escrever um segundo script que gere um relatório com a data, o espaço em disco livre e os cinco processos que mais usam memória, salvando em `logs/`.
6. Rodar os dois scripts e corrigir os erros sem apagar o arquivo e recomeçar.

## Minha solução

| Item | Solução | Status |
|---|---|---|
| 2 e 3 | [`scripts/organizador.sh`](../scripts/organizador.sh) | ⚠️ não executa (erros de sintaxe, ver abaixo) |
| 5 | [`scripts/relatorio_sistema.sh`](../scripts/relatorio_sistema.sh) | ✅ funciona |
| 5 (saída) | [`logs/relatorio_2026-11-04_20-45-37.txt`](../logs/relatorio_2026-11-04_20-45-37.txt) | ✅ salvo |

### Como rodar
```bash
cd scripts
chmod +x organizador.sh relatorio_sistema.sh
./relatorio_sistema.sh            # grava em ../logs/relatorio_<data>.txt
./organizador.sh ~/estudos/amostra
```
O `relatorio_sistema.sh` grava em `../logs`, por isso deve ser executado de dentro da pasta `scripts/`.

## Problema de depuração em aberto (item 6)
`organizador.sh` ainda tem erros que impedem a execução:

| Linha | Problema | Mensagem do Bash |
|---|---|---|
| 3 | falta espaço antes do `]` em `[ -z "$1"]` | `[: missing ']'` |
| 17 | `fo` no lugar de `do` no `for` | `syntax error near unexpected token 'fo'` |
| 5 | `exit` sem código: o erro de uso sai com status 0 | (sem mensagem) |

Critério de "concluído": rodar `./organizador.sh <pasta>` numa pasta com `.txt`, `.png` e `.pdf` e ver os arquivos movidos para subpastas por extensão, e rodar com pasta inexistente e ver `exit 1` com a mensagem de erro.

## Evidências
Nenhuma captura salva para este desafio (a saída do relatório está em `logs/`).
