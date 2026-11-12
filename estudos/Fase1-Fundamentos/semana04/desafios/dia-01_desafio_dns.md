\# Desafio Dia 01 — Investigação de Falha de Resolução DNS

\## Cenário 
Usuários relatam indisponibilidade no acesso ao domínio \`wiki.archlinux.org\`.

\## Comandos Executados
1\. \`dig wiki.archlinux.org\` (Consulta via DNS local) 
2\. \`dig @1.1.1.1 wiki.archlinux.org\` (Consulta via DNS Cloudflare)

\## Resultados Obtidos
Ambos os comandos retornaram a seção \`ANSWER SECTION\` contendo o Registro A (IP) correspondente ao serviço.

\## Conclusão Técnica 
A hipótese de falha na resolução de DNS local ou bloqueio de nome foi \*\*descartada\*\*. 
O resolver local está respondendo em paridade com o resolver público (1.1.1.1). Caso haja falha de acesso por parte dos usuários, a investigação deve prosseguir na Camada de Aplicação/Rede (verificação de regras de Firewall na porta 443/HTTP ou validação de conectividade via \`curl\`/\`ping\` diretamente ao IP).
