# 🐧 Semana 01 — Linux e terminal (diário de laboratório)

> Este repositório guarda só laboratórios e problemas resolvidos. A teoria foi estudada fora dele.

- **Fase:** Fase1-Fundamentos
- **Tema:** Linux: estrutura de diretórios, arquivos, permissões, filtros e processos
- **Observação:** semana feita antes da estrutura atual do repositório e reorganizada depois.

## Tópicos praticados
- Estrutura do sistema: `pwd`, `ls -la`, `cd` (absoluto e relativo), `tree`, `df -h`, `du -sh`
- Arquivos: `mkdir -p`, `touch`, `cp -r`, `mv`, `rm -r`, `cat`, `less`, `head`, `tail`, redirecionamentos `>` e `>>`
- Permissões: `chmod` (simbólico e octal), `id`, `groups`, `useradd`
- Busca e filtros: `grep`, `find`, `wc`, `cut`, pipes (`sort | uniq -c | sort -nr`)
- Processos e serviços: `ps aux`, `htop`, `&`, `kill`, `systemctl`, `journalctl`

## Laboratórios e problemas
| Dia | Laboratório | Status | Link |
|---|---|---|---|
| Seg | Estrutura do sistema | ✅ feito (sem arquivo salvo) | — |
| Ter | Manipulação de arquivos | ✅ feito (sem arquivo salvo) | — |
| Qua | Permissões | ✅ feito (sem arquivo salvo) | — |
| Qui | Busca e filtros | ✅ feito (sem arquivo salvo) | — |
| Sex | Processos e serviços | ✅ feito (sem arquivo salvo) | — |
| Sáb | Prática integrada: organizador por extensão e relatório do sistema | ⚠️ relatório ok; organizador com erros de sintaxe | [desafio](./desafios/dia-06_pratica-integrada.md) |
| Dom | Revisão | ✅ feito (sem arquivo salvo) | — |

## Arquivos
- Desafios: [`desafios/`](./desafios/)
- Scripts: [`scripts/organizador.sh`](./scripts/organizador.sh), [`scripts/relatorio_sistema.sh`](./scripts/relatorio_sistema.sh)
- Logs: [`logs/relatorio_2026-11-04_20-45-37.txt`](./logs/relatorio_2026-11-04_20-45-37.txt)

## O que tentei e errei
- **`organizador.sh`:** tentei mover cada arquivo de uma pasta para uma subpasta com o nome da extensão (`for` + `mkdir -p` + `mv`). O script não executa por três erros: `[ -z "$1"]` sem espaço antes do `]` (linha 3), `fo` no lugar de `do` no `for` (linha 17) e `exit` sem código na mensagem de uso (linha 5).
- **`relatorio_sistema.sh`:** funcionou de primeira no teste; o relatório de 2026-11-04 20:45:37 está em `logs/`.

## Como resolvi
- **Relatório:** nome do arquivo com `date`, pasta criada com `mkdir -p ../logs`, `df -h /` para o disco e `ps aux --sort=-%mem | head -n 6` (cabeçalho + 5 processos). A primeira linha usa `>` (cria o arquivo) e as demais usam `>>` (acrescentam).
- **Organizador:** pendente. Falta corrigir os três pontos acima e testar numa pasta com `.txt`, `.png` e `.pdf`.

## Dificuldades
- Erros de digitação só aparecem na hora de rodar. O Bash acusou o `fo` e o `]` colado só na execução.
- O relatório grava em `../logs`, então só funciona se for executado de dentro de `scripts/`.
- O `ps aux` imprime a linha de comando inteira. No log, cada processo do Firefox ocupa uma linha enorme. Uma alternativa é `ps -eo pid,user,%mem,comm --sort=-%mem | head -n 6`.
- Ponto de atenção no organizador: a extensão vem de `${arquivo##*.}` sobre o caminho completo. Se a pasta tiver um ponto no caminho e o arquivo não tiver extensão, o resultado sai errado.

## Lições aprendidas
- `bash -n script.sh` checa a sintaxe sem executar o script.
- Mensagem de uso com `$0` e saída de erro com `exit 1`; `exit` sozinho devolve o status do último comando.
- Colocar variáveis entre aspas (`"$ALVO"`) evita problemas com espaços nos nomes.
- Leitura do relatório do dia 04/11: disco com 13% de uso (26G de 219G) e os 5 maiores consumidores de memória eram processos do Firefox, o maior com 9,8% da memória.
