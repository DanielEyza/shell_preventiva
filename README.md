# Preventive Maintenance Script
#Descrição

Este script de manutenção preventiva foi desenvolvido para realizar uma série de testes em PDVs (Pontos de Venda) e gerar um relatório detalhado sobre o estado de saúde do sistema. O script é capaz de verificar o SSD, memória, placa-mãe, uso de disco, temperatura da CPU, conectividade de rede, entre outros. Além disso, ele gera um relatório em português utilizando o LibreOffice.

#Funcionalidades

    Exibição de Banner: Mostra o nome do sistema em grande formato.
    Teste de SSD: Verifica a saúde do SSD.
    Teste de Memória: Realiza testes de memória.
    Teste de Placa Mãe: Coleta informações sobre o hardware da placa-mãe.
    Teste de Uso de Disco: Verifica o uso total do disco.
    Teste de Temperatura da CPU: Checa a temperatura atual da CPU.
    Teste de Stress: Realiza um teste de stress no sistema.
    Verificação de Uptime: Mostra o tempo que o sistema está em operação.
    Verificação de Versão do Kernel e Sistema Operacional: Exibe a versão atual do kernel e do sistema operacional.
    Verificação de Processos em Execução: Conta o número de processos em execução.
    Verificação de Uso de Swap: Mostra o uso atual do swap.
    Verificação de Conexões de Rede e IPs: Exibe as conexões de rede e endereços IP.
    Teste de Conectividade com a Internet e Velocidade: Verifica a conectividade com a Internet e realiza um teste de velocidade (se houver conexão).
    Relatório Detalhado: Gera um relatório detalhado em formato ODT utilizando LibreOffice.

   # Pré-requisitos

Antes de utilizar este script, certifique-se de ter as seguintes ferramentas instaladas no seu sistema:

`sudo apt-get update`
`sudo apt-get install smartmontools memtester lshw stress-ng lm-sensors libreoffice ufw lsof figlet speedtest-cli`

   # Como Usar
   
# clone o repositorio no terminal 

`git clone https://github.com/DanielEyza/shell_preventiva.git`
`cd shell_preventiva`

# Dê permissão de execução ao script:

`chmod +x teste_preventivo.sh`

# Execute o script:

`./teste_preventivo.sh`

# Siga as instruções na tela:

    Digite o número do PDV quando solicitado.
    Escolha a opção de realizar testes preventivos.

  # Relatório:

    O relatório será gerado em /tmp/ com o nome relatorio_PDV_<NUMERO_PDV>.odt, onde <NUMERO_PDV> é o número do PDV fornecido pelo usuário.



