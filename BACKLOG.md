# Mini-mundo

Os alunos do Instituto Militar de Engenharia estão organizando um grupo de
programação competitiva mas não possuem uma maneira de organizar seu estudo.
As áreas de estudo mais comuns são matemática discreta, combinatória,
probabilidade, estrutura de dados, complexidade computacional e algoritmos
em grafos, geometria computacional.

Quando um aluno estuda um assunto novo, ele faz um resumo do assunto,
colocando a descrição e explicação básica, os problemas clássicos, a análise
matemática do problema, os algoritmos relacionados e a implementação. Esse
ciclo é complicado devido ao número reduzido de editores de texto que
conseguem permitir que se gere e insira imagens, fórmulas matemáticas e código
de maneira simples.

Os alunos planejam utilizar um método que deve permitir que qualquer aluno,
cuja função seja modificar documentos ou possua autorização do autor, possa
modificar qualquer  conteúdo utilizado pelo grupo, contribuindo assim o
enriquecimento do material disponível e facilitar o aprendizado.

Para resolver tais problemas, os alunos do IME querem fazer uma plataforma
online para poder compartilhar o resultado dos seus estudos. A plataforma deve
ser na forma de Wiki, permitir a gerência e atualização do conteúdo de maneira
simples e interativa.

Uma interface que possibilite fácil interação de fórmulas, submissão de
artigos, material, exercícios, que podem ou não possuir dicas de resolução,
códigos de diferentes formatos e comentários desses códigos deve ser
implementada nessa interface.

# Backlog

[x] Eu como usuário devo conseguir visualizar a listagem dos artigos da plataforma por categoria, sem autenticação.
[x] Eu como usuário devo conseguir acessar cada artigo individualmente e visualizar o conteúdo renderizado por Markdown e LaTeX.
[x] Eu como usuário, devo ser capaz de buscar artigos e problemas por categoria, nome e keywords.
[ ] Eu como editor devo ser capaz de criar, editar e remover artigos. Devo ser capaz de criar o artigo usando Markdown e LaTex para as fórmulas matemáticas. Além disso, o renderizador deve ser capaz de reconhecer código e fazer a renderização indentada e colorida.
[ ] Eu como editor devo ser capaz de criar, editar, visualizar e remover categorias de problemas e artigos.
[ ] Eu como editor devo ser capaz de associar problemas e artigos a keywords. Keywords frequentemente usadas podem ser associadas a uma categoria.
