# 🌐 Semana 03 — Redes: OSI, TCP/IP, portas e captura de tráfego (diário de laboratório)

> Este repositório guarda só laboratórios e problemas resolvidos. A teoria foi estudada fora dele.

- **Fase:** Fase1-Fundamentos
- **Tema:** Redes: modelo OSI, TCP/IP, portas e protocolos
- **Observação:** semana feita antes da estrutura atual do repositório e reorganizada depois.

## Tópicos praticados
- Diagnóstico pela CLI: `ip a`, `ping`, `traceroute`, `ss -tulpn`
- Captura de pacotes com `tcpdump` e análise no Wireshark (arquivo `.pcap`)
- Conceitos aplicados na prática: camadas OSI e TCP/IP, endereçamento IPv4/IPv6, portas TCP/UDP

## Laboratórios e problemas
| Laboratório | Status | Link |
|---|---|---|
| Diagnóstico de rede pela CLI | ✅ concluído | [desafio](./desafios/diagnostico-de-rede-cli.md) |
| Captura de 100 pacotes com tcpdump | ⚠️ captura feita; o arquivo não tem handshake TCP | [desafio](./desafios/captura-de-trafego-tcpdump.md) |

## Evidências
![ip a](./capturas/dia-01_diagnostico_ip-a.png)
![ping](./capturas/dia-02_diagnostico_ping-google.png)
![traceroute](./capturas/dia-03_diagnostico_traceroute-8-8-8-8.png)
![ss](./capturas/dia-04_servicos_ss-tulpn.png)

Captura de pacotes: o arquivo `.pcap` fica só no meu computador (contém endereços da minha rede), por isso não é versionado. O resumo da análise está no desafio.

## Arquivos
- Desafios: [`desafios/`](./desafios/)
- Capturas: [`capturas/`](./capturas/) (somente prints)
- Não há scripts nem logs nesta semana.

## O que tentei e errei
- **`ss -tulpn` sem `sudo`:** o print foi feito sem `sudo`, então alguns sockets aparecem sem o nome do processo (por exemplo, as portas UDP 5353 e as de DNS na 53).
- **Captura com `tcpdump`:** capturei 100 pacotes na `wlp5s0`, mas o arquivo não tem nenhum início de conexão (0 pacotes SYN e 0 SYN/ACK; só 6 FIN e 4 RST). Peguei conexões que já estavam em andamento.

## Como resolvi
- **Interface certa:** o `ip a` mostrou `enp4s0` sem cabo (`NO-CARRIER`, DOWN) e `wlp5s0` ativa (UP, IPv4 privado). Por isso a captura usou `-i wlp5s0`.
- **Pendente (handshake):** gerar uma captura nova que pegue o início de uma conexão:
  1. `sudo tcpdump -i wlp5s0 -w handshake.pcap port 443`
  2. em outro terminal, `curl -sI https://example.com`
  3. parar o `tcpdump` com Ctrl+C e, no Wireshark, filtrar por `tcp.flags.syn == 1`

## Dificuldades
- No `traceroute`, os saltos 2 e 5 aparecem como `* * *`. Isso só indica que aquele roteador não respondeu: o salto 8 (`dns.google`) respondeu, então o caminho funcionou.
- O `ping google.com` resolveu para um endereço IPv6; com IPv6 disponível, o teste de conectividade não passa pelo IPv4.
- Com tanto tráfego cifrado, o conteúdo dos pacotes não pode ser lido. Dá para ver quem fala com quem, por qual porta e com que volume.

## Lições aprendidas
- `NO-CARRIER` no `ip a` significa interface sem cabo conectado.
- `ss -tulpn`: `-t` TCP, `-u` UDP, `-l` só portas em escuta, `-p` processo dono, `-n` números em vez de nomes.
- Todas as portas TCP em escuta nesta máquina eram só de loopback (`127.0.0.1` ou `::1`: DNS local na 53, impressão na 631 e o VS Code na 36311), ou seja, inacessíveis de fora. As portas UDP em `0.0.0.0` (5353, 34441, 55090) escutam em todas as interfaces.
- No `.pcap`: 100 pacotes, 55 em IPv6 e 45 em IPv4; o tráfego IP é quase todo TCP na porta 443 (HTTPS) e há 3 pacotes UDP na porta 123 (NTP).
