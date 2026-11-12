# Desafio Dia 02 — Diagnóstico de Falha de Conectividade em Interface de Rede

## 1. Descrição do Erro Analisado

Durante a configuração manual da interface de rede `eth0` para comunicação com a rede `10.0.0.0/24`, foram cometidos dois erros operacionais pelo técnico:

1. **Omissão da máscara de sub-rede CIDR:** 
   O comando executado foi `sudo ip addr add 10.0.0.5 dev eth0` (sem o `/24`).
2. **Interface Inativa:** 
   A placa de rede `eth0` permaneceu em estado `DOWN` após a tentativa de atribuição do IP.

---

## 2. Impacto Técnico na Comunicação de Rede

* **Ausência da máscara CIDR (`/24`):** 
  Quando a máscara não é informada no comando `ip addr add`, o kernel do Linux assume por padrão a máscara `/32` (`255.255.255.255`). Isso significa que o sistema entende que a sub-rede possui apenas aquele único host (`10.0.0.5`), sem gerar uma rota de enlace direto (*link-scope*) para o restante dos endereços da rede (`10.0.0.1` até `10.0.0.254`). Com isso, pacotes destinados a outros hosts da rede são descartados por falta de rota local.

* **Estado da Interface (`DOWN`):** 
  Uma interface em estado `DOWN` está desativada no nível lógico/físico pelo sistema operacional. Nenhum quadro de rede (camada de enlace) pode ser transmitido ou recebido pela placa enquanto ela não for colocada em estado `UP`.

---

## 3. Comandos Executados para Solução

```bash
# 1. Remover a atribuição incorreta com máscara /32
sudo ip addr del 10.0.0.5/32 dev eth0

# 2. Atribuir o endereço IP com a máscara /24 correta
sudo ip addr add 10.0.0.5/24 dev eth0

# 3. Ativar/subir a interface de rede
sudo ip link set dev eth0 up

# 4. Validar as alterações e verificar o estado UP
ip a show dev eth0