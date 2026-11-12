# Desafio Dia 03 — Depuração de Falha de Comunicação entre Sub-redes

## 1. Enunciado da Situação-Problema

Um servidor Linux está posicionado como elemento central de interconexão entre duas redes locais distintas, possuindo duas placas de rede configuradas:

* **Interface `eth0` (Rede A):** `192.168.1.1/24` — conectada ao segmento `192.168.1.0/24`
* **Interface `eth1` (Rede B):** `10.0.0.1/24` — conectada ao segmento `10.0.0.0/24`

**Sintoma observado:**  
Um host pertencente à Rede A (`192.168.1.50`) tenta estabelecer comunicação (via `ping` ou acesso a serviços) com um host situado na Rede B (`10.0.0.20`), utilizando o servidor Linux (`192.168.1.1`) como seu gateway padrão. No entanto, a comunicação falha e nenhum pacote recebe resposta.

---

## 2. Análise Técnica Detalhada dos Dois Pontos de Falha

Para que o tráfego bidirecional ocorra entre sub-redes diferentes, o caminho de ida e o caminho de volta precisam estar operacionais. Neste cenário, duas falhas clássicas impedem a comunicação:

### Ponto de Falha 1: IP Forwarding Desativado no Servidor Linux (Camada 3)
* **Causa:** Por padrão de segurança, distribuições Linux operam como *hosts* finais e não como roteadores, mantendo o parâmetro de kernel `net.ipv4.ip_forward` configurado como `0` (desabilitado).
* **Impacto:** Quando o pacote originado em `192.168.1.50` com destino a `10.0.0.20` chega pela interface `eth0`, o kernel verifica que o IP de destino não pertence a nenhuma de suas próprias interfaces e **descarta o pacote silenciosamente**, impedindo o repasse para a interface `eth1`.

### Ponto de Falha 2: Ausência de Rota de Retorno nos Hosts da Rede B (Roteamento Assimétrico)
* **Causa:** Os hosts da Rede B (`10.0.0.0/24`) não possuem uma rota configurada indicando que a rede `192.168.1.0/24` é alcançável através do IP `10.0.0.1` (`eth1` do servidor Linux).
* **Impacto:** Mesmo após o encaminhamento no servidor Linux ser ativado e o pacote chegar ao destino (`10.0.0.20`), o host da Rede B precisa enviar a resposta de volta para `192.168.1.50`. Sem um **Gateway Padrão** apontando para `10.0.0.1` ou uma **rota estática específica**, o host `10.0.0.20` não sabe para qual próximo salto (*next-hop*) enviar a resposta, resultando em falha de entrega (*Network is unreachable* ou descarte no gateway incorreto).

---

## 3. Comandos de Resolução e Verificação

### Passo 1: Habilitar o Encaminhamento de Pacotes (IP Forwarding) no Servidor Linux

```bash
# 1. Consultar o estado atual do parâmetro no kernel (0 = desativado, 1 = ativado)
sysctl net.ipv4.ip_forward

# 2. Ativar o encaminhamento imediatamente em tempo de execução (volátil)
sudo sysctl -w net.ipv4.ip_forward=1

# 3. Tornar a alteração permanente para persistir após reinicializações
echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p