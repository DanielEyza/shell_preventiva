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
    
    echo "Iniciando testes preventivos para PDV ${PDV_NUMBER}..."

    # Teste de SSD
    echo "Verificando o SSD..."
    SSD_HEALTH=$(sudo smartctl -H /dev/sda | grep "SMART overall-health self-assessment test result")
    echo "Saúde do SSD: $SSD_HEALTH"

    # Teste de Temperatura da CPU
    echo "Verificando a temperatura da CPU..."
    CPU_TEMP=$(sensors | grep "Package id 0:")
    echo "Temperatura da CPU: $CPU_TEMP"

    # Teste de Memória
    echo "Testando a memória..."
    MEM_TEST=$(sudo memtester 256M 1 2>&1 | tail -n 10)
    echo "Resultado do Teste de Memória: $MEM_TEST"

    # Teste de Stress
    echo "Iniciando teste de stress..."
    STRESS_TEST=$(sudo stress-ng --cpu 4 --io 2 --vm 2 --vm-bytes 128M --timeout 60s --metrics-brief 2>&1 | tail -n 10)
    echo "Resultado do Teste de Stress: $STRESS_TEST"

    echo "Testes preventivos concluídos para PDV ${PDV_NUMBER}."

    # Verificar se os resultados dos testes estão OK
    if [[ $SSD_HEALTH == *"PASSED"* && $MEM_TEST != *"FAILURE"* && $STRESS_TEST == *"Successful"* ]]; then
        echo "O computador do PDV ${PDV_NUMBER} está operacional."
    else
        echo "O computador do PDV ${PDV_NUMBER} apresentou problemas."
    fi
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

