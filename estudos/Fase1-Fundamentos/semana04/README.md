# Diário de Laboratório — Semana 04: Fundamentos de Redes e Serviços no Linux

## 📌 Resumo da Semana

Nesta semana foram trabalhados os conceitos essenciais de resolução de nomes (DNS), atribuição dinâmica de endereços (DHCP), manipulação de interfaces de rede, roteamento de pacotes no kernel do Linux e filtragem de tráfego com `iptables`.

---

## 📅 Tópicos Praticados por Dia

| Dia | Tópico | Prática Realizada |
| :--- | :--- | :--- |
| **Segunda (Dia 1)** | DNS & Resolução de Nomes | Consultas `dig`, tipos de registros (`A`, `MX`, `TXT`), script de enumeração e depuração. |
| **Terça (Dia 2)** | DHCP & Interfaces de Rede | Análise do processo DORA, manipulação com `ip addr/link`, correção de CIDR e status de interface. |
| **Quarta (Dia 3)** | Roteamento Linux | Inspeção de rotas (`ip route`), habilitação do `ip_forward` e diagnóstico de conectividade inter-redes. |
| **Quinta (Dia 4)** | Firewall & iptables | Criação de regras de filtragem (`INPUT`, `FORWARD`), estado de conexão, NAT/Masquerade e correção de ordem de regras. |

---

## 🛠️ Problemas Resolvidos (Desafios)

| Dia | Problema / Desafio | Status | Arquivo da Solução |
| :--- | :--- | :--- | :--- |
| Dia 1 | Investigação de Indisponibilidade de Nome (DNS) | Concluído | [desafios/dia-01_desafio_dns.md](desafios/dia-01_desafio_dns.md) |
| Dia 2 | Falha de Mascaramento CIDR / Interface DOWN | Concluído | [desafios/dia-02_desafio_dhcp.md](desafios/dia-02_desafio_dhcp.md) |
| Dia 3 | Falha de Roteamento entre Sub-redes | Concluído | [desafios/dia-03_desafio_roteamento.md](desafios/dia-03_desafio_roteamento.md) |
| Dia 4 | Ordem de Precedência de Regras no `iptables` | Concluído | [desafios/dia-04_desafio_firewall.md](desafios/dia-04_desafio_firewall.md) |

---

## 💡 Lições Aprendidas

* O comando `dig` é uma ferramenta indispensável em recon/OSINT para extrair registros DNS sem ruído (`+short`).
* Adicionar IPs via terminal sem a notação CIDR faz o Linux assumir `/32`, isolando o host da sub-rede local.
* O encaminhamento de pacotes (`ip_forward`) precisa estar explicitamente ativo (`=1`) em `/etc/sysctl.conf` para o Linux atuar como roteador.
* O `iptables` lê regras sequencialmente de cima para baixo; uma regra `DROP` genérica no topo bloqueia todas as liberações posteriores.

---

## 📁 Estrutura de Arquivos da Semana

* **Scripts:**
  * `scripts/dia-01_consulta_dns.sh`
  * `scripts/dia-02_checa_interface.sh`
  * `scripts/dia-03_gerencia_rotas.sh`
  * `scripts/dia-04_firewall_rules.sh`
* **Logs:**
  * `logs/dia-01_dig_google.log`
  * `logs/dia-02_interfaces.log`
  * `logs/dia-03_rotas.log`
  * `logs/dia-04_firewall.log`
* **Capturas:**
  * `capturas/dia-01_*.png`
  * `capturas/dia-02_*.png`
  * `capturas/dia-03_*.png`
  * `capturas/dia-04_*.png`