USE biblioteca;

INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (87d3a138-75ea-4a5f-9e79-b8d685baed42, 'Dom Casmurro', 'Machado de Assis', {'Romance', 'Drama'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (97d3a138-75ea-4a5f-9e79-b8d685baed42, '1984', 'George Orwell', {'Ficção Científica', 'Distopia'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (90d3a138-75ea-4a5f-9e79-b8d685baed42, '1988', 'George Orwell', {'Ficção Científica', 'Distopia'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (17d3a138-75ea-4a5f-9e79-b8d685baed42, 'A mão e a luva', 'Machado de Assis', {'Romance', 'Drama'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (82d3a138-75ea-4a5f-9e79-b8d685baed42, 'Memórias póstumas de Brás Cubas', 'Machado de Assis', {'Romance', 'Drama'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (88d3a138-75ea-4a5f-9e79-b8d685baed42, 'O Senhor dos Anéis', 'J.R.R. Tolkien', {'Fantasia'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (67d3a138-75ea-4a5f-9e79-b8d685baed42, 'Crime e Castigo', 'Fiódor Dostoiévski', {'Romance', 'Drama'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
(a7d3a138-75ea-4a5f-9e79-b8d685baed42, 'Duna', 'Frank Herbert', {'Ficção Científica'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (b7d3a138-75ea-4a5f-9e79-b8d685baed42, 'A Odisséia', 'Homero', {'Épico', 'Mitologia Grega'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (b3d3a138-75ea-4a5f-9e79-b8d685baed42, 'O Alquimista', 'Paulo Coelho', {'Fábula', 'Autoajuda'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
    (90d3a138-75ea-4a5f-9e79-b8d685baed42, 'A Ilha do Tesouro', 'Robert Louis Stevenson', {'Aventura'}, false, {});
INSERT INTO livro (id, titulo, autor, genero, emprestado, detalhes) VALUES
  (37d3a138-75ea-4a5f-9e79-b8d685baed42, 'Os Miseráveis', 'Victor Hugo', {'Romance', 'Histórico'}, false, {});

INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (987f44be-3a06-4a95-9dad-d5db3a17b7cb, 'João', 'joao@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (9a7f44be-3a06-4a95-9dad-d5db3a17b7cb, 'Laura', 'laura@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (a87f44be-3a06-4a95-9dad-d5db3a17b7cb, 'Gustavo', 'gustavo@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (f87f44be-3a06-4a95-9dad-d5db3a17b7cb, 'Aline', 'aline@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (d87f44be-3a06-4a95-9dad-d5db3a17b7cb, 'Ricardo', 'ricardo@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
   (587f44be-3a06-4a95-9dad-d5db3a17b7cb, 'Patrícia', 'patricia@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (687f44be-3a06-4a95-9dad-d5db3a17b7cb, 'Daniel', 'daniel@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (347f44be-3a06-4a95-9dad-d5db3a17b7cb, 'Carolina', 'carolina@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (8c310f1e-8fa2-4715-bc6c-13342cb97662, 'Eduardo', 'eduardo@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (dc310f1e-8fa2-4715-bc6c-13342cb97662, 'Sofia', 'sofia@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (3c310f1e-8fa2-4715-bc6c-13342cb97662, 'Felipe', 'felipe@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (ec310f1e-8fa2-4715-bc6c-13342cb97662, 'Beatriz', 'beatriz@email.com', []);
INSERT INTO utilizador (id, nome, email, livros_emprestados) VALUES
  (7c310f1e-8fa2-4715-bc6c-13342cb97662, 'Maria', 'maria@email.com', []);

INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (8c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), (7c310f1e-8fa2-4715-bc6c-13342cb97662), 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), 7c310f1e-8fa2-4715-bc6c-13342cb97662, 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), 7c310f1e-8fa2-4715-bc6c-13342cb97662, 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);
INSERT INTO emprestimo (id, utilizador_id, livro_id, data_emprestimo, data_devolucao) VALUES
  (uuid(), 7c310f1e-8fa2-4715-bc6c-13342cb97662, 90d3a138-75ea-4a5f-9e79-b8d685baed42, toTimestamp(now()), null);


INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 4);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 4);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 4);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 3);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 3);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
INSERT INTO resenha (id, livro_id, utilizador_id, comentario, avaliacao) VALUES
  (uuid(), 90d3a138-75ea-4a5f-9e79-b8d685baed42, 90d3a138-75ea-4a5f-9e79-b8d685baed42, 'Ótimo livro!', 5);
-- Updates
UPDATE livro SET detalhes = {'idioma': 'Português', 'ano_publicacao': '2001'} WHERE id = 90d3a138-75ea-4a5f-9e79-b8d685baed42;
UPDATE livro SET emprestado = true WHERE id = 90d3a138-75ea-4a5f-9e79-b8d685baed42;
UPDATE utilizador SET livros_emprestados = livros_emprestados + [90d3a138-75ea-4a5f-9e79-b8d685baed42] WHERE id = 90d3a138-75ea-4a5f-9e79-b8d685baed42;
UPDATE livro SET emprestado = true WHERE id = 90d3a138-75ea-4a5f-9e79-b8d685baed42;
UPDATE livro SET emprestado = true WHERE id = 90d3a138-75ea-4a5f-9e79-b8d685baed42;
UPDATE livro SET emprestado = false WHERE id = 90d3a138-75ea-4a5f-9e79-b8d685baed42;

-- Deletes
DELETE FROM livro WHERE id = 90d3a138-75ea-4a5f-9e79-b8d685baed42;
DELETE FROM resenha WHERE id = 80d3a138-75ea-4a5f-9e79-b8d685baed42;
DELETE FROM emprestimo WHERE id = 30d3a138-75ea-4a5f-9e79-b8d685baed42;
DELETE FROM resenha WHERE id = 60d3a138-75ea-4a5f-9e79-b8d685baed42;
DELETE FROM resenha WHERE id = 74d3a138-75ea-4a5f-9e79-b8d685baed42;
