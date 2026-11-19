CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARBINARY(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Pet (
    id_pet INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    peso DECIMAL(5,2),
    id_usuario INT NOT NULL,

    FOREIGN KEY (id_usuario)
    REFERENCES Usuario(id_usuario)
);

CREATE TABLE Consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    veterinario VARCHAR(100),
    valor DECIMAL(10,2),
    status VARCHAR(30) DEFAULT 'Agendada',
    id_pet INT NOT NULL,

    FOREIGN KEY (id_pet)
    REFERENCES Pet(id_pet)
);

CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE NOT NULL,
    horario TIME NOT NULL,
    observacao VARCHAR(255),
    id_consulta INT NOT NULL UNIQUE,

    FOREIGN KEY (id_consulta)
    REFERENCES Consulta(id_consulta)
);

INSERT INTO Usuario
(nome, cpf, email, telefone, endereco)
VALUES
('João Silva', AES_ENCRYPT('12345678901', 'ChavePet2026'),
 'joao@email.com', '46999990001', 'Rua A, 100'),

('Maria Oliveira', AES_ENCRYPT('98765432100', 'ChavePet2026'),
 'maria@email.com', '46999990002', 'Rua B, 200'),

('Carlos Souza', AES_ENCRYPT('45678912300', 'ChavePet2026'),
 'carlos@email.com', '46999990003', 'Rua C, 300');

INSERT INTO Pet
(nome, especie, raca, idade, peso, id_usuario)
VALUES
('Rex', 'Cachorro', 'Labrador', 4, 25.50, 1),

('Mimi', 'Gato', 'Persa', 2, 4.20, 2),

('Thor', 'Cachorro', 'Poodle', 5, 8.30, 3);

INSERT INTO Consulta
(descricao, veterinario, valor, status, id_pet)
VALUES
('Consulta de rotina', 'Dr. Paulo', 120.00, 'Agendada', 1),

('Vacinação', 'Dra. Ana', 90.00, 'Agendada', 2),

('Avaliação dermatológica', 'Dr. Pedro', 150.00, 'Agendada', 3);

INSERT INTO Agendamento
(data_consulta, horario, observacao, id_consulta)
VALUES
('2026-11-20', '09:00:00', 'Consulta de rotina', 1),

('2026-11-21', '10:30:00', 'Aplicação de vacina', 2),

('2026-11-22', '14:00:00', 'Avaliação da pele', 3);