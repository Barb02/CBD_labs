CREATE KEYSPACE IF NOT EXISTS biblioteca
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

DROP TABLE IF EXISTS livro;
DROP TABLE IF EXISTS utilizador;
DROP TABLE IF EXISTS resenha;
DROP TABLE IF EXISTS emprestimo;

USE biblioteca;

CREATE TABLE IF NOT EXISTS livro (
    id UUID,
    titulo TEXT,
    autor TEXT,
    genero SET<TEXT>,
    emprestado BOOLEAN,
    detalhes MAP<TEXT, TEXT>,
    PRIMARY KEY (id, emprestado)
);

CREATE TABLE IF NOT EXISTS utilizador (
    id UUID PRIMARY KEY,
    nome TEXT,
    email TEXT,
    livros_emprestados LIST<UUID>
);

CREATE TABLE IF NOT EXISTS emprestimo (
    id UUID,
    utilizador_id UUID,
    livro_id UUID,
    data_emprestimo TIMESTAMP,
    data_devolucao TIMESTAMP,
    PRIMARY KEY (id, utilizador_id)
);

CREATE TABLE IF NOT EXISTS resenha (
    id UUID,
    livro_id UUID,
    utilizador_id UUID,
    comentario TEXT,
    avaliacao INT,
    PRIMARY KEY (id, livro_id)
);

CREATE INDEX IF NOT EXISTS idx_livros_autor ON livro (autor);
CREATE INDEX IF NOT EXISTS idx_utilizadores_nome ON utilizador (nome);