# Gerenciador de Tarefas - ASP Clássico

Este projeto é uma aplicação web desenvolvida em ASP Clássico que permite o gerenciamento de tarefas (to-do list). Ele foi desenvolvido com foco em funcionalidades completas de CRUD (Criar, Ler, Atualizar e Deletar), utilizando MySQL como banco de dados. 

> Desenvolvido por **Clenildon Ferreira** como parte de um desafio técnico

---

## 📌 Funcionalidades

- ✅ **Adicionar Tarefa**: título, descrição, data de vencimento e status.
- 📋 **Listar Tarefas**: exibição organizada em tabela.
- ✏️ **Editar Tarefa**: alteração completa dos campos.
- 🗑️ **Excluir Tarefa**: com confirmação de remoção.
- 🔎 **Validação**:
  - Título duplicado
  - Data de vencimento não pode ser anterior à data atual

---

## 🖥️ Tecnologias Utilizadas

- **ASP Clássico (VBScript)**
- **HTML/CSS** com **Tailwind CSS** via CDN
- **MySQL** (banco de dados)
- **IIS** (Internet Information Services)

---

## 📁 Estrutura de Arquivos

```
TASK-MANAGER-ASP/
├── adicionar.asp          # Formulário para adicionar nova tarefa
├── conexao.asp            # Conexão com banco de dados MySQL
├── deletar.asp            # Exclusão de tarefas
├── editar.asp             # Formulário de edição
├── excluir.asp            # Ação de exclusão (redirect)
├── footer.asp             # Rodapé comum da aplicação
├── header.asp             # Cabeçalho e importação do Tailwind
├── index.asp              # Listagem principal de tarefas
├── salvar.asp             # Processamento de inserção e atualização
├── script.sql             # Script para criação do banco/tabela
└── styles.css             # Estilos adicionais (opcional)
```

---

## 🛠️ Requisitos

- Windows com **IIS** ativado (suporte a ASP clássico)
- MySQL instalado e em execução
- MySQL ODBC Driver 64-bit (ANSI ou Unicode)

---

## 📦 Instalação e Execução

1. Clone o projeto ou copie os arquivos para `C:\inetpub\wwwroot\task-manager-asp`
2. Ative o ASP Clássico no IIS
3. Crie o banco no MySQL com o script `script.sql`
4. Configure corretamente a string de conexão em `conexao.asp`
5. Acesse via navegador: `http://localhost/task-manager-asp`

---

## 🗃️ Script do Banco (MySQL)

```sql
CREATE DATABASE IF NOT EXISTS TaskManager;
USE TaskManager;

CREATE TABLE Tasks (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Description TEXT,
  DueDate DATE,
  IsCompleted BOOLEAN DEFAULT 0
);
```

---

## 🧪 Validações Implementadas

- Campo **título** obrigatório e único
- Campo **data de vencimento** deve ser futura
- Campo **descrição** opcional
- Checkbox de **conclusão** (sim/não)

---

## 📌 Observações Finais

- Aplicação inteiramente funcional e compatível com navegadores modernos
- Interface responsiva com Tailwind CSS via CDN

---

## 📄 Licença

Este projeto é de uso livre para fins educacionais e demonstrações técnicas.

---

🧑‍💻 Desenvolvido por **Clenildon Ferreira**
