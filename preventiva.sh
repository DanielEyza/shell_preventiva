#!/bin/bash

# Função para exibir "T.I 300" em grande
function show_banner() {
    echo "  _______               "
    echo " |__   __|     (_)      "
    echo "    | |         _  "
    echo "    | |        | | \\"
    echo "    | |        | |"
    echo "    |_|        |_|"
    echo " Script Desenvolvido pelo Daniel, T.I da loja 300 Epitacio Pessoa"
 }

# Função para verificar conexão de rede
function check_network() {
    echo "Verificando conexão de rede..."
    if ping -c 1 google.com &> /dev/null
    then
        echo "Conexão de rede detectada."
        return 0
    else
        echo "Sem conexão de rede."
        return 1
    fi
}

# Função para realizar testes preventivos e gerar relatório
function preventiva() {
    read -p "Digite o número do PDV: " PDV_NUMBER
    local report_file="/tmp/relatorio_PDV_${PDV_NUMBER}.odt"
    
    echo "Iniciando testes preventivos para PDV ${PDV_NUMBER}..."

    echo "Relatório de Saúde do Sistema - PDV ${PDV_NUMBER}" > /tmp/relatorio.txt
    echo "==============================================" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de SSD
    echo "Verificando o SSD..."
    SSD_HEALTH=$(sudo smartctl -H /dev/sda | grep "SMART overall-health self-assessment test result")
    echo "Saúde do SSD: $SSD_HEALTH" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Memória
    echo "Testando a memória..."
    MEM_TEST=$(sudo memtester 256M 1 2>&1 | tail -n 10)
    echo "Resultado do Teste de Memória: $MEM_TEST" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Placa Mãe
    echo "Verificando hardware da placa-mãe..."
    MOTHERBOARD_INFO=$(sudo lshw -short | grep -i "system" -A 3)
    echo "Informações da Placa-Mãe:" >> /tmp/relatorio.txt
    echo "$MOTHERBOARD_INFO" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Uso de Disco
    echo "Verificando o uso de disco..."
    DISK_USAGE=$(df -h --total | grep 'total')
    echo "Uso de Disco: $DISK_USAGE" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Temperatura da CPU
    echo "Verificando a temperatura da CPU..."
    CPU_TEMP=$(sensors | grep "Package id 0:")
    echo "Temperatura da CPU: $CPU_TEMP" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Stress
    echo "Iniciando teste de stress..."
    STRESS_TEST=$(sudo stress-ng --cpu 4 --io 2 --vm 2 --vm-bytes 128M --timeout 60s --metrics-brief 2>&1 | tail -n 10)
    echo "Resultado do Teste de Stress: $STRESS_TEST" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Uptime
    echo "Verificando o uptime do sistema..."
    UPTIME_INFO=$(uptime -p)
    echo "Uptime do Sistema: $UPTIME_INFO" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Versão do Kernel
    echo "Verificando a versão do kernel..."
    KERNEL_VERSION=$(uname -r)
    echo "Versão do Kernel: $KERNEL_VERSION" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Versão do Sistema Operacional
    echo "Verificando a versão do sistema operacional..."
    OS_VERSION=$(lsb_release -d)
    echo "Versão do Sistema Operacional: $OS_VERSION" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Processos em Execução
    echo "Verificando os processos em execução..."
    PROCESS_COUNT=$(ps aux | wc -l)
    echo "Número de Processos em Execução: $PROCESS_COUNT" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Espaço Swap
    echo "Verificando o uso de swap..."
    SWAP_USAGE=$(swapon --show)
    echo "Uso de Swap: $SWAP_USAGE" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Conexões de Rede
    echo "Verificando as conexões de rede..."
    NET_CONNECTIONS=$(ss -tunlp)
    echo "Conexões de Rede: $NET_CONNECTIONS" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    if check_network; then
        # Teste de Ping para Google
        echo "Testando a conectividade com a Internet..."
        PING_TEST=$(ping -c 4 google.com)
        echo "Ping para Google: $PING_TEST" >> /tmp/relatorio.txt
        echo "" >> /tmp/relatorio.txt

        # Teste de Velocidade de Internet
        echo "Testando a velocidade da Internet..."
        SPEED_TEST=$(speedtest-cli --simple)
        echo "Teste de Velocidade de Internet: $SPEED_TEST" >> /tmp/relatorio.txt
        echo "" >> /tmp/relatorio.txt
    else
        echo "Testes de rede e Internet foram ignorados devido à falta de conexão."
    fi

    # Teste de Endereços IP
    echo "Verificando os endereços IP..."
    IP_ADDRESSES=$(ip a)
    echo "Endereços IP: $IP_ADDRESSES" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Interfaces de Rede
    echo "Verificando as interfaces de rede..."
    NET_INTERFACES=$(ifconfig -a)
    echo "Interfaces de Rede: $NET_INTERFACES" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de ARP Cache
    echo "Verificando o cache ARP..."
    ARP_CACHE=$(arp -a)
    echo "Cache ARP: $ARP_CACHE" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Tabela de Roteamento
    echo "Verificando a tabela de roteamento..."
    ROUTING_TABLE=$(route -n)
    echo "Tabela de Roteamento: $ROUTING_TABLE" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Portas Abertas
    echo "Verificando as portas abertas..."
    OPEN_PORTS=$(sudo lsof -i -P -n | grep LISTEN)
    echo "Portas Abertas: $OPEN_PORTS" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Firewall
    echo "Verificando a configuração do firewall..."
    FIREWALL_STATUS=$(sudo ufw status)
    echo "Status do Firewall: $FIREWALL_STATUS" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    # Teste de Logs do Sistema
    echo "Verificando os logs do sistema..."
    SYSLOG_ERRORS=$(grep -i "error" /var/log/syslog | tail -n 10)
    echo "Erros nos Logs do Sistema: $SYSLOG_ERRORS" >> /tmp/relatorio.txt
    echo "" >> /tmp/relatorio.txt

    echo "Testes preventivos concluídos."

    # Gerar relatório com LibreOffice
    echo "Gerando relatório..."
    libreoffice --headless --convert-to odt /tmp/relatorio.txt --outdir /tmp/

    echo "Relatório gerado em: $report_file"
}

# Mostrar o banner
show_banner

# Menu de opções
echo "Escolha uma opção:"
echo "1. Realizar testes preventivos"
echo "2. Sair"
read -p "Opção: " option

# Ação com base na escolha do usuário
case $option in
    1)
        preventiva
        ;;
    2)
        echo "Saindo..."
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac

