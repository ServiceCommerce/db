-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20-Dez-2017 às 18:32
-- Versão do servidor: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teste-serralheria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `db_version`
--

CREATE TABLE `db_Version` (
  `version` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `db_Version` (`version`) VALUES
('1.0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_produto`
--

CREATE TABLE `categoria_produto` (
  `idCategoria_prod` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `exibir` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('9745e462cc4d933e481123f95d84603f', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', 1513789234, 'a:7:{s:9:"user_data";s:0:"";s:4:"nome";s:13:"Administrador";s:2:"id";s:1:"1";s:9:"permissao";s:1:"1";s:6:"logado";b:1;s:12:"dataCadastro";s:10:"2017-10-21";s:7:"profile";s:0:"";}'),
('e72ba38a12d5b456746fe94846563cb0', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', 1513789921, 'a:8:{s:9:"user_data";s:0:"";s:4:"nome";s:13:"Administrador";s:2:"id";s:1:"1";s:9:"permissao";s:1:"1";s:6:"logado";b:1;s:12:"dataCadastro";s:10:"2017-10-21";s:7:"profile";s:0:"";s:17:"flash:old:success";s:8:"Clie-001";}');

-- --------------------------------------------------------
-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_client_sessions` (
        `id` varchar(128) NOT NULL,
        `ip_address` varchar(45) NOT NULL,
        `timestamp` int(10) unsigned DEFAULT 0 NOT NULL,
        `data` blob NOT NULL,
        KEY `ci_sessions_timestamp` (`timestamp`)
);


-- --------------------------------------------------------
--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `dataCadastro` date DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `idContato` int(11) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `clientes_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura da tabela `emitente`
--

CREATE TABLE `emitente` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `ie` varchar(50) DEFAULT NULL,
  `rua` varchar(70) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url_logo` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `clientes_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem_produto`
--

CREATE TABLE `imagem_produto` (
  `idImg_prod` int(11) NOT NULL,
  `nomeImagem` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8_unicode_ci,
  `tipo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `categoria_prod_id` int(11) NOT NULL,
  `produtos_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `idPermissao` int(11) NOT NULL,
  `nome` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `permissoes` text COLLATE utf8_unicode_ci,
  `situacao` tinyint(1) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `permissoes`
--

INSERT INTO `permissoes` (`idPermissao`, `nome`, `permissoes`, `situacao`, `data`) VALUES
(1, 'administrador', 'a:50:{s:8:"aCliente";s:1:"1";s:8:"eCliente";s:1:"1";s:8:"dCliente";s:1:"1";s:8:"vCliente";s:1:"1";s:8:"aProduto";s:1:"1";s:8:"eProduto";s:1:"1";s:8:"dProduto";s:1:"1";s:8:"vProduto";s:1:"1";s:9:"aProdutoS";s:1:"1";s:9:"eProdutoS";s:1:"1";s:9:"dProdutoS";s:1:"1";s:9:"vProdutoS";s:1:"1";s:9:"aServicoS";s:1:"1";s:9:"eServicoS";s:1:"1";s:9:"dServicoS";s:1:"1";s:9:"vServicoS";s:1:"1";s:10:"aCategoria";s:1:"1";s:10:"eCategoria";s:1:"1";s:10:"dCategoria";s:1:"1";s:10:"vCategoria";s:1:"1";s:8:"aServico";s:1:"1";s:8:"eServico";s:1:"1";s:8:"dServico";s:1:"1";s:8:"vServico";s:1:"1";s:3:"aOs";s:1:"1";s:3:"eOs";s:1:"1";s:3:"dOs";s:1:"1";s:3:"vOs";s:1:"1";s:6:"aVenda";s:1:"1";s:6:"eVenda";s:1:"1";s:6:"dVenda";s:1:"1";s:6:"vVenda";s:1:"1";s:8:"aArquivo";s:1:"1";s:8:"eArquivo";s:1:"1";s:8:"dArquivo";s:1:"1";s:8:"vArquivo";s:1:"1";s:11:"aLancamento";s:1:"1";s:11:"eLancamento";s:1:"1";s:11:"dLancamento";s:1:"1";s:11:"vLancamento";s:1:"1";s:8:"cUsuario";s:1:"1";s:9:"cEmitente";s:1:"1";s:10:"cPermissao";s:1:"1";s:7:"cBackup";s:1:"1";s:8:"rCliente";s:1:"1";s:8:"rProduto";s:1:"1";s:8:"rServico";s:1:"1";s:3:"rOs";s:1:"1";s:6:"rVenda";s:1:"1";s:11:"rFinanceiro";s:1:"1";}', 1, '2014-09-03');
-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_fisica`
--

CREATE TABLE `pessoa_fisica` (
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientes_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_juridica`
--

CREATE TABLE `pessoa_juridica` (
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnpj` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientes_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idProdutos` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `descricao` varchar(80) NOT NULL,
  `unidade` varchar(10) DEFAULT NULL,
  `precoCompra` decimal(10,2) DEFAULT NULL,
  `precoVenda` decimal(10,2) NOT NULL,
  `estoque` int(11) DEFAULT NULL,
  `estoqueMinimo` int(11) DEFAULT NULL,
  `aPartir` tinyint(1) DEFAULT NULL,
  `semEstoque` tinyint(1) NOT NULL,
  `categoria_prod_id` int(11) DEFAULT NULL,
  `exibir` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `dataCadastro` date NOT NULL,
  `nivel` int(11) NOT NULL,
  `user_img` varchar(150) NOT NULL,
  `img_url` varchar(300) DEFAULT NULL,
  `permissoes_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `nome`, `email`, `senha`, `situacao`, `dataCadastro`, `nivel`, `user_img`, `img_url`, `permissoes_id`) VALUES
(1, 'Administrador', 'admin@admin.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2017-10-21', 1, 'Profile', '', 1);
--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria_produto`
--
ALTER TABLE `categoria_produto`
  ADD PRIMARY KEY (`idCategoria_prod`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idClientes`);

--
-- Indexes for table `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`idContato`);

--
-- Indexes for table `emitente`
--
ALTER TABLE `emitente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Indexes for table `imagem_produto`
--
ALTER TABLE `imagem_produto`
  ADD PRIMARY KEY (`idImg_prod`),
  ADD KEY `fk_categoria_produto` (`categoria_prod_id`),
  ADD KEY `fk_produtos` (`produtos_id`);

--
-- Indexes for table `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`idPermissao`);

--
-- Indexes for table `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD KEY `fk_pessoa_fisica_clientes1` (`clientes_id`);

--
-- Indexes for table `pessoa_juridica`
--
ALTER TABLE `pessoa_juridica`
  ADD KEY `fk_pessoa_juridica_clientes1` (`clientes_id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idProdutos`),
  ADD KEY `fk_categoria_produto` (`categoria_prod_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD KEY `fk_usuarios_permissoes1_idx` (`permissoes_id`);
