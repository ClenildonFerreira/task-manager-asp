-- Criação do banco
CREATE DATABASE IF NOT EXISTS TaskManager;
USE TaskManager;

-- Tabela de tarefas
CREATE TABLE IF NOT EXISTS Tasks (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Description TEXT,
  DueDate DATETIME NOT NULL,
  IsCompleted BOOLEAN DEFAULT FALSE
);