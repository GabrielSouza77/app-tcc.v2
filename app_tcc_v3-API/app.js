const express = require('express');
const connection = require('./db');

const app = express();

// Rota para buscar todos os exercícios
app.get('/exercises', (req, res) => {
  connection.query('SELECT * FROM exercicios', (error, results) => {
    if (error) {
      res.status(500).json({ error: 'Erro ao buscar arquivos.' });
    } else {
      res.json(results);
    }
  });
});

// Rota para buscar todas as videoaulas
app.get('/videolessons', (req, res) => {
  connection.query('SELECT * FROM videoaula', (error, results) => {
    if (error) {
      res.status(500).json({ error: 'Erro ao buscar videoaulas.' });
    } else {
      res.json(results);
    }
  });
});

// Rota para buscar todos os materiais de apoio
app.get('/supportmaterial', (req, res) => {
  connection.query('SELECT * FROM materialapoio', (error, results) => {
    if (error) {
      res.status(500).json({ error: 'Erro ao buscar arquivos.' });
    } else {
      res.json(results);
    }
  });
});


// Iniciar o servidor
app.listen(3000, () => {
  console.log('Servidor iniciado na porta 3000.');
});
