# 🌐 Semana 03: Redes - Modelo OSI, TCP/IP e Wireshark

Este diretório documenta o estudo dos fundamentos de redes de computadores, um pilar essencial para qualquer área da Cibersegurança. Compreender como os pacotes viajam, como as portas comunicam e como os protocolos operam é o que permite identificar anomalias e vulnerabilidades em sistemas.

## 🎯 Objetivos Concluídos
- Compreensão estrutural do **Modelo OSI** (7 Camadas) e a sua correlação com a arquitetura **TCP/IP** (4 Camadas).
- Endereçamento IPv4/IPv6, máscaras de rede, Subnetting e portas lógicas (TCP/UDP).
- Utilização de ferramentas de diagnóstico de rede via CLI no Linux (`ping`, `traceroute`, `netstat`/`ss`, `ip a`).
- Introdução à análise de tráfego (Sniffing) com foco na interceção de pacotes.

## 🛠️ Ferramentas Exploradas
- **`tcpdump`**: Captura de pacotes em linha de comandos (CLI), aplicação de filtros básicos (por IP, porta e protocolo).
- **Wireshark**: Análise visual profunda (GUI) de ficheiros de captura (`.pcap`), inspeção de *Three-Way Handshake* (TCP) e identificação de tráfego em texto limpo (HTTP, FTP, Telnet).

## 📂 Prática e Evidências

Durante esta semana, realizei testes práticos de reconhecimento de rede e interceção de pacotes no terminal, garantindo a sanitização de dados sensíveis (Security Mindset) antes da publicação.

### 1. Diagnóstico e Mapeamento (CLI)

*   **Identidade na Rede (`ip a`)**: Identificação das interfaces locais. Endereços MAC e IPs públicos (IPv6) foram devidamente censurados.
    ![Evidência IP A](./capturas/ping_a.png)

*   **Conectividade e DNS (`ping`)**: Validação da comunicação ICMP e da resolução de nomes.
    ![Evidência Ping](./capturas/ping_-c_4_google.com.png)

*   **Rastreamento de Rotas (`traceroute`)**: Mapeamento dos *hops* desde o gateway local até ao destino.
    ![Evidência Traceroute](./capturas/traceroute_8.8.8.8.png)

*   **Serviços Ativos (`ss -tulpn`)**: Identificação de portas lógicas em escuta e dos respetivos processos no sistema.
    ![Evidência SS](./capturas/ss_-tulpn"->semSudo".png)

### 2. Interceção de Tráfego

Os ficheiros de captura gerados no laboratório estão armazenados na subpasta `capturas/`:
*   📄 **`trafego_laboratorio.pcap`**: Captura de 100 pacotes de tráfego real executada via `tcpdump` (`sudo tcpdump -i wlp5s0 -c 100 -w ...`).