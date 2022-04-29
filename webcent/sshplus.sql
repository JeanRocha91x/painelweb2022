-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: db-sshplus
-- Tempo de geração: 24/04/2022 às 03:52
-- Versão do servidor: 5.7.37
-- Versão do PHP: 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Banco de dados: `sshplus`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acesso_servidor`
--

CREATE TABLE `acesso_servidor` (
  `id_acesso_servidor` int(10) NOT NULL,
  `id_servidor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `id_servidor_mestre` int(11) NOT NULL DEFAULT '0',
  `qtd` int(10) NOT NULL DEFAULT '0',
  `validade` datetime NOT NULL,
  `demo` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin`
--

CREATE TABLE `admin` (
  `id_administrador` int(11) NOT NULL,
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `accessKEY` varchar(100) DEFAULT NULL,
  `site` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `admin`
--

INSERT INTO `admin` (`id_administrador`, `login`, `senha`, `nome`, `email`, `accessKEY`, `site`) VALUES
(1, 'admin', 'admin', 'Administrador', 'admin@admin.com', NULL, 'meusite.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `anuncios`
--

CREATE TABLE `anuncios` (
  `anuncio1` text NOT NULL,
  `anuncio2` text NOT NULL,
  `anuncio3` text NOT NULL,
  `anuncio4` text NOT NULL,
  `anuncio5` text NOT NULL,
  `anuncio6` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `anuncios`
--

INSERT INTO `anuncios` (`anuncio1`, `anuncio2`, `anuncio3`, `anuncio4`, `anuncio5`, `anuncio6`) VALUES
('Insira o Código Adsense no Painel', 'Insira o Código Adsense no Painel', 'Insira o Código Adsense no Painel', 'Insira o Código Adsense no Painel', 'Insira o Código Adsense no Painel', 'Insira o Código Adsense no Painel');

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivo_download`
--

CREATE TABLE `arquivo_download` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` enum('funcionando','testes') NOT NULL,
  `tipo` enum('ehi','apk','outros') NOT NULL,
  `operadora` enum('todas','claro','vivo','tim','oi') NOT NULL,
  `data` datetime NOT NULL,
  `detalhes` text NOT NULL,
  `nome_arquivo` varchar(255) NOT NULL,
  `cliente_tipo` enum('vpn','revenda','todos') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chamados`
--

CREATE TABLE `chamados` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `tipo` enum('contassh','revendassh','usuariossh','servidor','outros') NOT NULL,
  `status` enum('aberto','resposta','encerrado') NOT NULL,
  `resposta` text NOT NULL,
  `login` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracao`
--

CREATE TABLE `configuracao` (
  `id_configuracao` int(11) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `titulo_pagina` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura`
--

CREATE TABLE `fatura` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `servidor_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `tipo` enum('vpn','revenda','outros') NOT NULL,
  `qtd` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `datavencimento` datetime NOT NULL,
  `status` enum('pendente','cancelado','pago') NOT NULL,
  `descrição` text NOT NULL,
  `valor` int(11) NOT NULL,
  `desconto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_clientes`
--

CREATE TABLE `fatura_clientes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `servidor_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `tipo` enum('vpn','revenda','outros') NOT NULL,
  `qtd` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `datavencimento` datetime NOT NULL,
  `status` enum('pendente','cancelado','pago') NOT NULL,
  `descrição` text NOT NULL,
  `valor` int(11) NOT NULL,
  `desconto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_comprovantes`
--

CREATE TABLE `fatura_comprovantes` (
  `id` int(11) NOT NULL,
  `fatura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` enum('aberto','fechado') NOT NULL DEFAULT 'aberto',
  `data` datetime NOT NULL,
  `formapagamento` enum('boleto','deptra') NOT NULL,
  `nota` text NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fatura_comprovantes_clientes`
--

CREATE TABLE `fatura_comprovantes_clientes` (
  `id` int(11) NOT NULL,
  `id_mestre` int(11) NOT NULL DEFAULT '0',
  `fatura_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` enum('aberto','fechado') NOT NULL DEFAULT 'aberto',
  `data` datetime NOT NULL,
  `formapagamento` enum('boleto','deptra') NOT NULL,
  `nota` text NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_login`
--

CREATE TABLE `historico_login` (
  `id_historico_login` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `data_login` datetime NOT NULL,
  `ip_login` varchar(100) NOT NULL,
  `navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `hist_usuario_ssh_online`
--

CREATE TABLE `hist_usuario_ssh_online` (
  `id_hist_usrSSH` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `hora_conexao` datetime NOT NULL,
  `hora_desconexao` datetime DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `hist_usuario_ssh_online_free`
--

CREATE TABLE `hist_usuario_ssh_online_free` (
  `id_hist_usrSSH` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `hora_conexao` datetime NOT NULL,
  `hora_desconexao` datetime DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informativo`
--

CREATE TABLE `informativo` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mercadopago`
--

CREATE TABLE `mercadopago` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `CLIENT_SECRET` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `mercadopago`
--

INSERT INTO `mercadopago` (`CLIENT_ID`, `CLIENT_SECRET`) VALUES
('7981557107733328', 'MpCwg3eVrRsfYtMB99ptMF7hx2D2K2VV');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `status` enum('ativo','desativado') NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `conta_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `tipo` enum('fatura','conta','revenda','outros','usuario','chamados') NOT NULL,
  `linkfatura` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `info_outros` varchar(50) NOT NULL,
  `lido` enum('nao','sim') NOT NULL DEFAULT 'nao',
  `admin` enum('nao','sim') NOT NULL DEFAULT 'nao'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ovpn`
--

CREATE TABLE `ovpn` (
  `id` int(11) NOT NULL,
  `servidor_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `arquivo` varchar(255) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `servidor`
--

CREATE TABLE `servidor` (
  `id_servidor` int(11) NOT NULL,
  `ativo` int(10) NOT NULL DEFAULT '0',
  `nome` varchar(100) NOT NULL,
  `regiao` enum('asia','america','europa','australia') NOT NULL,
  `limite_usuario` int(10) NOT NULL DEFAULT '0',
  `ip_servidor` varchar(100) NOT NULL,
  `site_servidor` varchar(255) NOT NULL,
  `login_server` varchar(30) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `porta` int(10) NOT NULL DEFAULT '22',
  `dias` int(10) NOT NULL DEFAULT '0',
  `demo` int(11) NOT NULL DEFAULT '0',
  `ehi` varchar(1000) DEFAULT NULL,
  `localizacao` varchar(255) NOT NULL,
  `localizacao_img` varchar(50) NOT NULL,
  `validade` int(11) NOT NULL,
  `limite` int(11) NOT NULL,
  `tipo` enum('premium','free') NOT NULL DEFAULT 'premium',
  `manutencao` enum('nao','sim') NOT NULL DEFAULT 'nao'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sms`
--

CREATE TABLE `sms` (
  `id_sms` int(11) NOT NULL,
  `id_remetente` int(11) NOT NULL,
  `id_destinatario` int(11) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` varchar(500) NOT NULL,
  `hora_resquisicao` datetime NOT NULL,
  `hora_envio` datetime NOT NULL,
  `status` enum('Aguardando','Enviado','Erro') NOT NULL DEFAULT 'Aguardando'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `smtp`
--

CREATE TABLE `smtp` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `servidor` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ssl_secure` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `smtp_usuarios`
--

CREATE TABLE `smtp_usuarios` (
  `id` int(11) NOT NULL,
  `ssl_secure` varchar(255) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `servidor` varchar(255) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `porta` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(60) NOT NULL,
  `id_mestre` int(10) DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `atualiza_dados` int(11) NOT NULL DEFAULT '0',
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `avatar` varchar(50) NOT NULL DEFAULT '1',
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `tipo` enum('vpn','revenda','','') NOT NULL,
  `subrevenda` enum('nao','sim') NOT NULL,
  `validade` date DEFAULT NULL,
  `suspenso` date DEFAULT NULL,
  `token_user` varchar(120) DEFAULT NULL,
  `permitir_demo` int(11) NOT NULL DEFAULT '0',
  `dias_demo_sub` int(10) NOT NULL DEFAULT '0',
  `apagar` int(11) NOT NULL DEFAULT '0',
  `idcliente_mp` varchar(255) NOT NULL,
  `tokensecret_mp` varchar(255) NOT NULL,
  `dadosdeposito` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_ssh`
--

CREATE TABLE `usuario_ssh` (
  `id_usuario_ssh` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_servidor` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data_validade` date NOT NULL,
  `data_suspensao` datetime DEFAULT NULL,
  `apagar` int(2) NOT NULL DEFAULT '0',
  `acesso` int(10) NOT NULL DEFAULT '1',
  `online` int(11) NOT NULL DEFAULT '0',
  `online_start` datetime DEFAULT NULL,
  `online_hist` int(11) NOT NULL DEFAULT '0',
  `demo` enum('nao','sim') NOT NULL DEFAULT 'nao'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_ssh_free`
--

CREATE TABLE `usuario_ssh_free` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `servidor` int(11) NOT NULL,
  `validade` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `online` int(11) NOT NULL DEFAULT '0',
  `online_start` datetime DEFAULT NULL,
  `online_hist` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acesso_servidor`
--
ALTER TABLE `acesso_servidor`
  ADD PRIMARY KEY (`id_acesso_servidor`);

--
-- Índices de tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Índices de tabela `arquivo_download`
--
ALTER TABLE `arquivo_download`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `chamados`
--
ALTER TABLE `chamados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `configuracao`
--
ALTER TABLE `configuracao`
  ADD PRIMARY KEY (`id_configuracao`);

--
-- Índices de tabela `fatura`
--
ALTER TABLE `fatura`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fatura_clientes`
--
ALTER TABLE `fatura_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fatura_comprovantes`
--
ALTER TABLE `fatura_comprovantes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fatura_comprovantes_clientes`
--
ALTER TABLE `fatura_comprovantes_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico_login`
--
ALTER TABLE `historico_login`
  ADD PRIMARY KEY (`id_historico_login`);

--
-- Índices de tabela `hist_usuario_ssh_online`
--
ALTER TABLE `hist_usuario_ssh_online`
  ADD PRIMARY KEY (`id_hist_usrSSH`);

--
-- Índices de tabela `hist_usuario_ssh_online_free`
--
ALTER TABLE `hist_usuario_ssh_online_free`
  ADD PRIMARY KEY (`id_hist_usrSSH`);

--
-- Índices de tabela `informativo`
--
ALTER TABLE `informativo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ovpn`
--
ALTER TABLE `ovpn`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servidor`
--
ALTER TABLE `servidor`
  ADD PRIMARY KEY (`id_servidor`);

--
-- Índices de tabela `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id_sms`);

--
-- Índices de tabela `smtp`
--
ALTER TABLE `smtp`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `smtp_usuarios`
--
ALTER TABLE `smtp_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `token_user` (`token_user`);

--
-- Índices de tabela `usuario_ssh`
--
ALTER TABLE `usuario_ssh`
  ADD PRIMARY KEY (`id_usuario_ssh`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Índices de tabela `usuario_ssh_free`
--
ALTER TABLE `usuario_ssh_free`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acesso_servidor`
--
ALTER TABLE `acesso_servidor`
  MODIFY `id_acesso_servidor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `arquivo_download`
--
ALTER TABLE `arquivo_download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `chamados`
--
ALTER TABLE `chamados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `configuracao`
--
ALTER TABLE `configuracao`
  MODIFY `id_configuracao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura`
--
ALTER TABLE `fatura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_clientes`
--
ALTER TABLE `fatura_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_comprovantes`
--
ALTER TABLE `fatura_comprovantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fatura_comprovantes_clientes`
--
ALTER TABLE `fatura_comprovantes_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `historico_login`
--
ALTER TABLE `historico_login`
  MODIFY `id_historico_login` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `hist_usuario_ssh_online`
--
ALTER TABLE `hist_usuario_ssh_online`
  MODIFY `id_hist_usrSSH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `hist_usuario_ssh_online_free`
--
ALTER TABLE `hist_usuario_ssh_online_free`
  MODIFY `id_hist_usrSSH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `informativo`
--
ALTER TABLE `informativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ovpn`
--
ALTER TABLE `ovpn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servidor`
--
ALTER TABLE `servidor`
  MODIFY `id_servidor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sms`
--
ALTER TABLE `sms`
  MODIFY `id_sms` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `smtp`
--
ALTER TABLE `smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `smtp_usuarios`
--
ALTER TABLE `smtp_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(60) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_ssh`
--
ALTER TABLE `usuario_ssh`
  MODIFY `id_usuario_ssh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_ssh_free`
--
ALTER TABLE `usuario_ssh_free`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;
