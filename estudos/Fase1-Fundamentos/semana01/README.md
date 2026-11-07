# 🐧 Semana 01: Fundamentos de Linux e Terminal

Este diretório documenta as práticas e laboratórios realizados durante a primeira semana do cronograma de Cibersegurança, focando na base essencial de administração de sistemas Linux e manipulação avançada via interface de linha de comando (CLI).

## 🎯 Objetivos Concluídos
- Navegação fluente e compreensão da hierarquia de diretórios do Linux (`/etc`, `/var`, `/home`, `/tmp`).
- Gestão de arquivos e diretórios via terminal (criação, cópia, movimentação e exclusão segura).
- Administração de permissões e grupos de usuários, com foco na conversão entre notação simbólica e octal (`chmod`).
- Utilização de utilitários de busca, filtros de texto e encadeamento de fluxos de dados (Pipes e Redirecionamentos).
- Monitoramento de processos, gestão de memória e administração de serviços do sistema operacional (`systemd`).

## 🛠️ Comandos e Ferramentas Exploradas

### 1. Estrutura e Manipulação
- **Navegação e Inspeção:** `pwd`, `ls -la`, `cd` (caminhos absolutos e relativos), `tree`, `df -h`, `du -sh`.
- **Gestão de Arquivos:** `mkdir -p`, `touch`, `cp -r`, `mv`, `rm -r`.
- **Visualização de Dados:** `cat`, `less`, `head`, `tail`.
- **Redirecionamentos:** `>` (sobrescrever) e `>>` (anexar).

### 2. Gestão de Acessos e Permissões
- Leitura e interpretação detalhada da string de permissões (Dono, Grupo, Outros).
- Alteração restritiva de modos (ex: `chmod 400`, `chmod +x`).
- Gestão de identidade e auditoria de usuários: `id`, `groups`, `useradd`.

### 3. Filtros, Buscas e Pipes
- **Buscas em Arquivos:** `find` (utilizando parâmetros de nome e modificação temporal como `-mtime`).
- **Análise Textual:** `grep`, `wc`, `cut`.
- **Processamento em Cadeia:** Encadeamento lógico de comandos (ex: `sort | uniq -c | sort -nr`).

### 4. Processos e Serviços (Systemd)
- **Monitoramento e Intervenção:** `ps aux`, `htop`, execução em background (`&`) e encerramento de processos (`kill`).
- **Administração de Serviços:** `systemctl list-units`, `systemctl status`.
- **Auditoria de Logs:** Extração de eventos críticos do sistema com `journalctl`.

## 🚀 Prática Integrada (Automação Inicial)
Para consolidar o conhecimento teórico, foram desenvolvidas rotinas iniciais de automação em Bash na subpasta `scripts/`:
1. **Organizador de Arquivos:** Script que categoriza e move arquivos automaticamente para subpastas baseadas em suas extensões.
2. **Relatório de Sistema:** Script gerador de sumários operacionais (data, espaço livre em disco e top 5 processos com maior consumo de memória).