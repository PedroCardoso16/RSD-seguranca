# Desafio Dia 04 — Ordem de Leitura do `iptables` e Correção de Bloqueios

## 1. Situação-Problema

Um administrador precisa liberar o acesso web (porta TCP `80`) em um servidor Linux que já possui regras de firewall ativas. Para isso, ele executa o comando:

```bash
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```

No entanto, ao testar o acesso pelo navegador ou via `curl`, a conexão continua sendo bloqueada ou sofrendo *timeout*. Ao listar as regras com numeração (`sudo iptables -L INPUT -n --line-numbers`), observa-se a seguinte estrutura:

```text
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
2    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:22
3    DROP       all  --  0.0.0.0/0            0.0.0.0/0
4    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:80
```

---

## 2. Explicação Técnica: Ordem de Leitura do `iptables`

O firewall `iptables` avalia os pacotes seguindo estritamente o modelo **sequencial de cima para baixo (*Top-Down*)** e aplica a lógica de **primeira correspondência vence (*First Match Wins*)**:

1. **Avaliação Linha por Linha:** Quando um pacote entra na cadeia (`INPUT`), o kernel compara o cabeçalho do pacote com a regra `num 1`. Se não houver correspondência, passa para a `num 2`, e assim por diante.
2. **Ação Terminal (`ACCEPT`, `DROP`, `REJECT`):** Assim que o pacote coincide com uma regra que possui um alvo terminal, o `iptables` executa a ação imediatamente e **interrompe a leitura** das regras seguintes naquela cadeia.
3. **O Problema do Parâmetro `-A` (*Append*):** O parâmetro `-A` insere a nova regra sempre no **final da lista** (linha `4`). Como existe uma regra genérica `DROP all` na linha `3`, todo tráfego que não seja `ESTABLISHED` ou porta `22` é descartado antes de alcançar a regra da porta `80`.
4. **Política Padrão (*Default Policy*):** Somente se o pacote atravessar todas as regras da cadeia sem coincidir com nenhuma delas é que a política padrão (`policy ACCEPT` ou `policy DROP`) será aplicada.

---

## 3. Comandos de Correção e Verificação

Para corrigir o problema, é necessário remover a regra posicionada no final e inseri-la **antes** da regra de bloqueio geral (`DROP`), utilizando o parâmetro `-I` (*Insert*).

### Passo 1: Listar as regras com números de linha
```bash
sudo iptables -L INPUT -n -v --line-numbers
```

### Passo 2: Remover a regra mal posicionada (linha 4)
```bash
sudo iptables -D INPUT 4
```

### Passo 3: Inserir a regra da porta 80 na posição correta (linha 3, antes do `DROP`)
```bash
sudo iptables -I INPUT 3 -p tcp --dport 80 -j ACCEPT
```
*(Nota: Executar `sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT` sem especificar o número insere a regra diretamente no topo, na linha `1`).*

### Passo 4: Validar a nova ordem e os contadores de pacotes
```bash
sudo iptables -L INPUT -n -v --line-numbers
```

**Saída esperada após a correção:**
```text
Chain INPUT (policy ACCEPT)
num  pkts bytes target     prot opt source               destination
1       0     0 ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0            ctstate RELATED,ESTABLISHED
2       0     0 ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:22
3       0     0 ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:80
4       0     0 DROP       all  --  0.0.0.0/0            0.0.0.0/0
```