# 📜 Semana 02: Shell Scripting Básico em Bash

Este diretório contém os estudos e scripts desenvolvidos durante a segunda semana de Fundamentos. O foco foi transformar a execução manual de comandos Linux em rotinas automatizadas, uma competência vital para administração de sistemas e segurança (Blue Team/Red Team).

## 🎯 Objetivos Concluídos
- Compreensão da estrutura de um script Bash (Shebang `#!/bin/bash`, permissões de execução).
- Utilização de variáveis, passagem de argumentos (`$1`, `$2`) e códigos de saída (`exit 0`, `exit 1`).
- Estruturas de controlo de fluxo: Condicionais (`if`, `elif`, `else`) e Loops (`for`, `while`).
- Criação de scripts práticos focados no dia a dia de um administrador/analista de segurança.

## 🛠️ Ferramentas e Conceitos Aplicados
- **Arquivamento e Compressão:** Uso de `tar` e `gzip` para rotinas de backup.
- **Análise de Logs (Parsing):** Extração de dados específicos de ficheiros de log do sistema usando `grep`, `awk` e expressões regulares básicas.
- **Automação de Tarefas:** Scripts para verificação de serviços e manutenção do sistema.

## 📂 Scripts Desenvolvidos

Os códigos fonte encontram-se na pasta `scripts/`:

1. **`backup_seguro.sh`**: Script que recebe um diretório alvo, cria um arquivo comprimido `.tar.gz` com a data atual e guarda-o num diretório de backups seguro.
2. **`parser_logs.sh`**: Ferramenta de auditoria que lê o ficheiro `/var/log/auth.log` (ou similar) e extrai todas as tentativas falhadas de login SSH (Brute Force).
3. **`automacao_manutencao.sh`**: Script que automatiza a atualização de pacotes do sistema e a limpeza de dependências órfãs.