-- 1. USUARIO
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. TIPO_PAGAMENTO
CREATE TABLE tipo_pagamento (
    id_pagament SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL
);

-- 3. BILHETE_UNICO
CREATE TABLE bilhete_unico (
    id_buner SERIAL PRIMARY KEY,
    id_pagament INTEGER NOT NULL,
    CONSTRAINT fk_bilhete_pagamento FOREIGN KEY (id_pagament)
        REFERENCES tipo_pagamento(id_pagament)
);

-- 4. VEICULOS
CREATE TABLE veiculos (
    id_veiculo SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    grau_manutencao INTEGER CHECK (grau_manutencao BETWEEN 1 AND 5)
);

-- 5. ROTA
CREATE TABLE rota (
    id_rota SERIAL PRIMARY KEY,
    nome_rota VARCHAR(60) NOT NULL,
    distancia_total_km NUMERIC(5,2) NOT NULL
);

-- 6. RECARGA
CREATE TABLE recarga (
    id_recarg SERIAL PRIMARY KEY,
    data_recarga DATE NOT NULL,
    valor_recarga NUMERIC(10,2) NOT NULL CHECK (valor_recarga > 0),
    id_usuario INTEGER NOT NULL,
    id_pagament INTEGER NOT NULL,
    id_buner INTEGER NOT NULL,
    CONSTRAINT fk_recarga_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),
    CONSTRAINT fk_recarga_pagamento FOREIGN KEY (id_pagament)
        REFERENCES tipo_pagamento(id_pagament),
    CONSTRAINT fk_recarga_bilhete FOREIGN KEY (id_buner)
        REFERENCES bilhete_unico(id_buner)
);

-- 7. ALUGUEL
CREATE TABLE aluguel (
    id_alugu SERIAL PRIMARY KEY,
    data_hora_inicio TIMESTAMP NOT NULL,
    data_hora_fim TIMESTAMP,
    id_veiculo INTEGER NOT NULL,
    id_buner INTEGER NOT NULL,
    CONSTRAINT fk_aluguel_veiculo FOREIGN KEY (id_veiculo)
        REFERENCES veiculos(id_veiculo),
    CONSTRAINT fk_aluguel_bilhete FOREIGN KEY (id_buner)
        REFERENCES bilhete_unico(id_buner)
);

-- 8. FAZ_TRAJETO (tabela associativa com atributos)
CREATE TABLE faz_trajeto (
    id_rota INTEGER NOT NULL,
    id_veiculo INTEGER NOT NULL,
    h_inici TIME NOT NULL,
    h_fim TIME,
    PRIMARY KEY (id_rota, id_veiculo, h_inici),
    CONSTRAINT fk_trajeto_rota FOREIGN KEY (id_rota)
        REFERENCES rota(id_rota),
    CONSTRAINT fk_trajeto_veiculo FOREIGN KEY (id_veiculo)
        REFERENCES veiculos(id_veiculo)
);

-- 9. PARADA_ROTA
CREATE TABLE parada_rota (
    id_parada SERIAL PRIMARY KEY,
    distancia_proxima_parada NUMERIC(5,2),
    tempo_estimado INTERVAL,
    id_rota INTEGER NOT NULL,
    CONSTRAINT fk_parada_rota FOREIGN KEY (id_rota)
        REFERENCES rota(id_rota)
);


-- TIPO_PAGAMENTO
INSERT INTO tipo_pagamento (nome) VALUES
('Crédito'),
('Débito'),
('Pix');

-- BILHETE_UNICO
INSERT INTO bilhete_unico (id_pagament) VALUES
(1), -- Crédito
(2), -- Débito
(3); -- Pix

-- USUARIO
INSERT INTO usuario (nome, telefone, email) VALUES
('João da Silva', '5511987654321', 'joao.silva@email.com'),
('Maria Souza', '5521991234567', 'maria.souza@email.com'),
('Carlos Pereira', '5531980001111', 'carlos.p@email.com');

-- RECARGA
INSERT INTO recarga (data_recarga, valor_recarga, id_usuario, id_pagament, id_buner) VALUES
('2025-10-15', 50.00, 1, 1, 1),
('2025-10-16', 25.50, 2, 2, 2),
('2025-10-17', 100.00, 3, 3, 3);

-- VEICULOS
INSERT INTO veiculos (nome, grau_manutencao) VALUES
('Busão Leste', 3),
('Bike Sharing', 1),
('VLT Centro', 5);

-- ROTA
INSERT INTO rota (nome_rota, distancia_total_km) VALUES
('Terminal Leste', 15.5),
('Ciclovia Central', 5.0),
('VLT Urbano', 8.2);

-- FAZ_TRAJETO
INSERT INTO faz_trajeto (id_rota, id_veiculo, h_inici, h_fim) VALUES
(1, 1, '06:00:00', '06:45:00'),
(2, 2, '09:00:00', NULL),
(3, 3, '12:00:00', '12:25:00');

-- PARADA_ROTA
INSERT INTO parada_rota (distancia_proxima_parada, tempo_estimado, id_rota) VALUES
(2.5, '00:05:00', 1),
(4.0, '00:08:00', 1),
(5.0, '00:10:00', 3);

-- ALUGUEL
INSERT INTO aluguel (data_hora_inicio, data_hora_fim, id_veiculo, id_buner) VALUES
('2025-10-18 10:00:00', '2025-10-18 10:30:00', 2, 2),
('2025-10-18 14:00:00', NULL, 2, 1);