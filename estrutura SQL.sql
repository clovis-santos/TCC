CREATE DATABASE gestao_eventos;

USE gestao_eventos;

CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    data DATE,
    local VARCHAR(255)
);

INSERT INTO eventos (nome, data, local) VALUES
('Festa de Aniversário', '2024-12-05', 'Salão de Festas São João'),
('Conferência de Tecnologia', '2024-11-20', 'Centro de Convenções RioCentro'),
('Feira de Inovação', '2024-12-01', 'Expo Center Norte'),
('Casamento de Ana e Carlos', '2024-11-30', 'Igreja de São José'),
('Encontro de Desenvolvimento Pessoal', '2024-12-10', 'Hotel Grand Palace'),
('Exposição de Arte Moderna', '2024-11-25', 'Museu de Arte Contemporânea'),
('Show da Banda XYZ', '2024-12-15', 'Arena Anhembi'),
('Curso de Programação', '2024-11-22', 'Escola TechMaster'),
('Jantar de Gala Beneficente', '2024-12-12', 'Restaurante Vila Rica'),
('Seminário de Marketing Digital', '2024-12-08', 'Auditório Corporativo Alfa');

SELECT * FROM eventos;

CREATE TABLE palestrantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    especialidade VARCHAR(255),
    evento_id INT,
    FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE
);

SELECT * FROM palestrantes;
