// Versão final - Cadastro de alunos
#include <stdio.h>   // Biblioteca de entrada e saída
#include <stdlib.h>  // Para alocação e liberação de memória

// Criação de estrutura para armazenamento dos dados do aluno
struct Aluno {
    int matricula;        // Número de matrícula do aluno
    char nome[50];        // Nome do aluno (até 49 caracteres + '\0')
    float notaMedia;      // Média final calculada
};

int main() {
    struct Aluno aluno;    // Declara uma variável do tipo struct Aluno
    float *notas;          // Ponteiro para armazenar notas dinamicamente
    float media = 0.0;     // Acumulador da média
    int n;                 // Quantidade de notas a serem inseridas

    // Solicita o nome do aluno
    printf("Por gentileza, digite seu nome: ");
    scanf("%49s", aluno.nome); // 'nome' já é ponteiro, não precisa do '&'

    // Solicita a matrícula do aluno
    printf("Nos informe sua matrícula, por gentileza: ");
    scanf("%d", &aluno.matricula); // '&' é necessário para inteiros

    // Solicita o número de notas a serem inseridas
    printf("Por gentileza, digite quantas notas você vai inserir: ");
    scanf("%d", &n); // Corrigido '%d'

    // Verifica se o número de notas é válido
    if (n <= 0) {
        printf("Pô irmão, vai vacilar igual vacilou com ela? ;-;\n");
        return 0; // Encerra o programa com sucesso
    }

    // Cria espaço na memória para guardar 'n' notas
    notas = (float *) malloc(n * sizeof(float));

    // Verifica se a alocação foi bem-sucedida
    if (notas == NULL) {
        printf("Opa, deu erro ao guardar memória, paizão.\n");
        return 1; // Erro na alocação
    }

    // Solicita as notas uma a uma
    printf("Serão inseridas %d notas:\n", n);
    for (int i = 0; i < n; i++) {
        printf("Digite a %da nota: ", i + 1);
        scanf("%f", &notas[i]); // Guarda a nota no vetor
        media += notas[i];      // Soma a nota à média
    }

    // Cálculo da média final
    aluno.notaMedia = media / n;

    // Exibe os dados do aluno
    printf("\nAluno: %s\n", aluno.nome);
    printf("Matrícula: %d\n", aluno.matricula);
    printf("Nota média: %.2f\n", aluno.notaMedia);

    // Verifica a situação com operador ternário
    printf("Situação: %s\n", (aluno.notaMedia >= 6) ? "Aprovado" : "Reprovado");

    // Libera a memória alocada
    free(notas);

    return 0; // Encerra o programa com sucesso
}