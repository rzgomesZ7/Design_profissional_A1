### ORDENAÇÃO DE DÍGITOS DO RGM
Descrição do Problema

O objetivo deste projeto é ordenar os dígitos do RGM usando o algoritmo Selection Sort, enquanto se analisa o desempenho em termos de:
Passos: contagem de comparações e trocas.
Tempo de execução: medido em milissegundos.
A implementação inclui melhorias importantes em relação a uma versão básica:
Contagem detalhada de comparações e trocas usando a estrutura Metrics.
Medição precisa do tempo de execução em milissegundos.
Conversão do RGM de string para vetor de inteiros.
Código comentado linha a linha para aprendizado e manutenção.
Saída em formato humano-legível e CSV para relatórios ou análise externa.

### ESTRUTURA DO CÓDIGO
\\Bibliotecas Incluídas
#include <stdio.h>   // Entrada/saída: printf, scanf
#include <stdlib.h>  // Alocação dinâmica: malloc, free
#include <string.h>  // Manipulação de strings: strlen
#include <time.h>    // Medição de tempo: clock

\\Estrutura Metrics
typedef struct {
    long long cmp;  // Contador de comparações
    long long swp;  // Contador de trocas
} Metrics;

\\Macros para contagem de passos:
#define COUNT_CMP(m) (m->cmp++)
#define COUNT_SWP(m) (m->swp++)

\\Funções Principais:
reset_metrics: zera os contadores antes de cada execução.
converter_rgm: transforma a string do RGM em um vetor de inteiros.
imprimir_vetor: imprime o vetor de forma legível.
selection_sort: implementação do Selection Sort com contagem de métricas.
rodar_sort: executa o algoritmo e mede o tempo de execução em milissegundos.

### ALGORÍTMO IMPLEMENTADO
\\Selection Sort
Como funciona:
Percorre o vetor do início ao penúltimo elemento.
Para cada posição, encontra o menor elemento restante.
Troca o menor elemento com a posição atual.
Complexidade esperada:

Pior caso: 
𝑂
(
𝑛
2
)
O(n
2
) comparações e trocas.

Caso médio: 
𝑂
(
𝑛
2
)
O(n
2
) comparações.

Memória: in-place (não precisa de vetor adicional).
Estabilidade: não é estável (elementos iguais podem trocar de posição).

### CONTAGEM DE PASSOS
Cada passo corresponde a uma operação dominante:
Comparação: if (v[j] < v[min]) → incrementa cmp.
Troca: troca entre v[i] e v[min] → incrementa swp.
Passos totais = comparações + trocas.

### CRITÉRIOS PARA ESCOLHA DO MÉTODO
\\1. Computabilidade
Ordena corretamente o RGM e outros vetores testados.
Lida com empates e elementos repetidos.
Funciona para vetores de diferentes tamanhos.

\\2. Escalabilidade
Comparações e trocas crescem quadraticamente com o tamanho do vetor (
𝑂
(
𝑛
2
)
O(n
2
)).
Observações práticas confirmam o comportamento esperado para N pequenos; torna-se ineficiente para N grandes.

\\3. Estabilidade e Memória
Não é estável.
Uso de memória é in-place, sem vetores auxiliares.

\\4. Sensibilidade ao Caso
Aleatório: número médio de comparações ≈ 𝑛2/2.
Quase ordenado: pouco ganho, ainda O(n²).
Reverso: máximo de trocas, pior caso.

### COMO COMPILAR E RODAD
gcc -O1 -std=c11 src/main.c -o ordena
./ordena
Digite seu RGM quando solicitado.

Confira a saída:

RGM ordenado.

Comparações, trocas, passos totais.

Tempo de execução (ms).

A saída CSV está pronta para análise em planilhas ou gráficos.

Exemplo de Saída
Entrada:

Digite seu RGM: 46020993

Saída resumida:


RGM ordenado: 00234699

Resumo humano:
Comparações: 28
Trocas: 6
Passos totais: 34
Tempo: 0.0020 ms
CSV para relatório:

mathematica
metodo,N,caso,comparacoes,trocas,passos,tempo_ms
selection,8,rgm,28,6,34,0,0020

### FUNCIONALIDADE DO CÓDIGO
Contagem detalhada de comparações e trocas usando a estrutura Metrics.
Medição precisa do tempo de execução.
Conversão de string do RGM para vetor de inteiros.
Código comentado linha a linha para aprendizado.
Preparado para análise de vetores aleatórios ou personalizados.

MIT LICENSE (Ricardo Misael)
