# Cadastro de Alunos

Este repositório contém um programa simples em C para realizar o cadastro de um aluno, coletar várias notas, calcular a média e apresentar se o aluno está aprovado ou reprovado.

## 📂 Estrutura do Projeto

- `main.c` — arquivo principal com a implementação em C.  
- (Você pode adicionar aqui outros arquivos ou pastas se for expandir o projeto, ex: `aluno.h`, `aluno.c`, etc.)

## 📝 Funcionalidades

- Solicita ao usuário o **nome** e a **matrícula** do aluno.  
- Pergunta quantas **notas** o usuário deseja inserir.  
- Lê essa quantidade de notas e calcula a **média aritmética**.  
- Imprime o nome, matrícula, média (com duas casas decimais) e a **situação** do aluno (aprovado ou reprovado), considerando como critério aprovação média ≥ 6.0.  
- Faz alocação dinâmica do vetor de notas (com `malloc`) para suportar uma quantidade variável de notas.  
- Libera a memória alocada (com `free`) ao final.

## ⚠️ Observações & Melhorias Futuras

- Atualmente o programa só permite cadastrar **um** aluno por execução.  
- Seria interessante estender para múltiplos alunos (por exemplo em um loop até “0 alunos” ou leitura de arquivo).  
- Poderia haver validação de entrada (por exemplo: notas entre 0 e 10, matrícula positiva, etc.).  
- Poderia haver uma interface de menu com mais opções (listar, buscar aluno, etc.).  
- O tratamento de strings funciona até 49 caracteres para o nome; em entradas com espaços, `scanf("%49s", ...)` não captura espaços. Para aceitar espaços, poderia usar `fgets` ou `scanf("%49[^\n]", ...)`.  

## 🚀 Como Compilar e Executar

1. Certifique‑se de ter um compilador C instalado (ex: `gcc`, `clang`).  
2. No terminal, dentro da pasta do projeto, compile o código:

   ```bash
   gcc main.c -o cadastro_aluno
Isso irá gerar o executável cadastro_aluno.
3. Execute o programa:

bash
Copiar código
./cadastro_aluno
Siga as instruções que aparecerão no terminal.

📋 Exemplo de Uso
yaml
Copiar código
Por gentileza, digite seu nome: ricas
Nos informe sua matrícula, por gentileza: 12345
Por gentileza, digite quantas notas você vai inserir: 3
Serão inseridas 3 notas:
Digite a 1ª nota: 7.5
Digite a 2ª nota: 8.0
Digite a 3ª nota: 5.0

Aluno: ricas
Matrícula: 12345
Nota média: 6.83
Situação: Aprovado


agradecimentos ao mano ector, me ajudou dando um norte e explicando algumas paradinhas, forte abraço irmão!


## Alunos: 
Ricardo misael
Tales matoso
Davi Carvalho
Henry Clark
