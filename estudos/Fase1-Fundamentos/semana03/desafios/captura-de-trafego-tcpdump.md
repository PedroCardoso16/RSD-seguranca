# Desafio — Captura e análise de tráfego próprio (Semana 03)

## Enunciado
Capturar tráfego da própria máquina em laboratório e analisá-lo (cronograma: "capturar e analisar tráfego próprio com Wireshark").

## Minha solução
Captura de 100 pacotes na interface Wi-Fi com `tcpdump`:

```bash
sudo tcpdump -i wlp5s0 -c 100 -w trafego_laboratorio.pcap
```

Arquivo gerado: `trafego_laboratorio.pcap`, aberto no Wireshark para a análise. O arquivo fica só no meu computador e não é versionado, porque contém endereços reais da minha rede.

## Resumo conferido do arquivo
- 100 pacotes, enlace Ethernet.
- 55 pacotes IPv6 e 45 IPv4.
- A maior parte do tráfego IP é TCP na porta 443 (HTTPS, conteúdo cifrado) e há 3 pacotes UDP na porta 123 (NTP).
- Nenhuma credencial ou texto legível em texto limpo foi encontrada no conteúdo dos pacotes.

- Nenhum handshake TCP no arquivo: 0 pacotes SYN e 0 SYN/ACK (há 6 FIN e 4 RST). A captura pegou conexões já em andamento.

Critério de "concluído": arquivo `.pcap` gerado e aberto no Wireshark, com pelo menos um fluxo TCP identificado (handshake SYN, SYN/ACK, ACK).

Status: ⚠️ captura feita, critério do handshake pendente. Para fechar, gere uma captura que pegue o início de uma conexão:
```bash
sudo tcpdump -i wlp5s0 -w handshake.pcap port 443
# em outro terminal:
curl -sI https://example.com
# Ctrl+C no tcpdump e, no Wireshark, filtre: tcp.flags.syn == 1
```
