USE biblioteca;
-- 1. Encontrar todos os livros
SELECT * FROM livro;

-- 2. Encontrar todos os utilizadores que têm o nome João
SELECT * FROM utilizador WHERE nome = 'João';

-- 3. Encontrar todas as resenhas
SELECT * FROM resenha;

-- 4. Encontrar todos os livros de um autor específico
SELECT * FROM livro WHERE autor = 'George Orwell';

-- 5. Encontrar todos os empréstimos feitos por um usuário específico
SELECT * FROM emprestimo WHERE utilizador_id = 8c310f1e-8fa2-4715-bc6c-13342cb97662;

-- 6. Listar os últimos 5 livros adicionados
SELECT * FROM livro ORDER BY id DESC LIMIT 5;

-- 7. Listar os livros emprestados (top 3)
SELECT * FROM livro WHERE emprestado = true LIMIT 3;

-- 8. Listar as resenhas dos livros com a maior avaliação (top 5):
SELECT * FROM resenha ORDER BY avaliacao DESC LIMIT 5;

-- 9. Listar os utilizadores que mais emprestaram livros (top 5) e a quantidade de livros emprestados por cada um:
SELECT nome, COUNT(livros_emprestados) as total_livros_emprestados
FROM utilizador
GROUP BY nome ORDER BY total_livros_emprestados DESC LIMIT 5;

-- 10. Listar os empréstimos ordenados por data de devolução (mais próxima primeiro) com limite de 10
SELECT * FROM emprestimo ORDER BY data_devolucao LIMIT 10;

