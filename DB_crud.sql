-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 22, 2020 at 04:56 PM
-- Server version: 8.0.20-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DB_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add endereco', 8, 'add_endereco'),
(30, 'Can change endereco', 8, 'change_endereco'),
(31, 'Can delete endereco', 8, 'delete_endereco'),
(32, 'Can view endereco', 8, 'view_endereco'),
(33, 'Can add prod_ venda', 9, 'add_prod_venda'),
(34, 'Can change prod_ venda', 9, 'change_prod_venda'),
(35, 'Can delete prod_ venda', 9, 'delete_prod_venda'),
(36, 'Can view prod_ venda', 9, 'view_prod_venda'),
(37, 'Can add produto', 10, 'add_produto'),
(38, 'Can change produto', 10, 'change_produto'),
(39, 'Can delete produto', 10, 'delete_produto'),
(40, 'Can view produto', 10, 'view_produto'),
(41, 'Can add venda', 11, 'add_venda'),
(42, 'Can change venda', 11, 'change_venda'),
(43, 'Can delete venda', 11, 'delete_venda'),
(44, 'Can view venda', 11, 'view_venda'),
(45, 'Can add vendedor', 12, 'add_vendedor'),
(46, 'Can change vendedor', 12, 'change_vendedor'),
(47, 'Can delete vendedor', 12, 'delete_vendedor'),
(48, 'Can view vendedor', 12, 'view_vendedor');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$stEcRiNkQ07m$EFD3xDJ+sBY4cXbWNFIyXKmd0AGQtlcrQ5MBU2C9lPk=', '2020-07-19 04:56:14.159912', 1, 'admin', '', '', '', 1, 1, '2020-07-19 04:55:17.788175');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'home', 'cliente'),
(8, 'home', 'endereco'),
(9, 'home', 'prod_venda'),
(10, 'home', 'produto'),
(11, 'home', 'venda'),
(12, 'home', 'vendedor'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-07-19 04:52:54.365756'),
(2, 'auth', '0001_initial', '2020-07-19 04:52:54.761035'),
(3, 'admin', '0001_initial', '2020-07-19 04:52:56.064573'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-07-19 04:52:56.389267'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-07-19 04:52:56.405740'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-07-19 04:52:56.614284'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-07-19 04:52:56.786607'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-07-19 04:52:56.833370'),
(9, 'auth', '0004_alter_user_username_opts', '2020-07-19 04:52:56.845023'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-07-19 04:52:56.997773'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-07-19 04:52:57.008461'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-07-19 04:52:57.030492'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-07-19 04:52:57.197433'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-07-19 04:52:57.342451'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-07-19 04:52:57.390907'),
(16, 'auth', '0011_update_proxy_permissions', '2020-07-19 04:52:57.420223'),
(17, 'sessions', '0001_initial', '2020-07-19 04:52:57.472814'),
(18, 'home', '0001_initial', '2020-07-22 19:02:13.616729'),
(19, 'home', '0002_endereco_prod_venda_produto_venda', '2020-07-22 19:37:23.333825'),
(20, 'home', '0003_vendedor', '2020-07-22 19:40:25.702889');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('baa9vfhw88ia5b4tvj9svkrdpcrh0wdj', 'MzUwMGY5ZGM0Nzk4YTA2ZjI1NWY5YTlhMTQxYjIzZWJjMzdjYTYyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMTUxMzg1M2NiZjM0ZGYzMjNiNjIyYzk4ZGVlZThhNmYwZWY3OGEwIn0=', '2020-08-02 04:56:14.175812');

-- --------------------------------------------------------

--
-- Table structure for table `home_cliente`
--

CREATE TABLE `home_cliente` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int NOT NULL,
  `sexo` varchar(5) NOT NULL,
  `n_doc` int NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_endereco`
--

CREATE TABLE `home_endereco` (
  `id` int NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cid_est` varchar(200) NOT NULL,
  `cep` int NOT NULL,
  `cod_cliente_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_produto`
--

CREATE TABLE `home_produto` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_prod_venda`
--

CREATE TABLE `home_prod_venda` (
  `id` int NOT NULL,
  `qtd` int NOT NULL,
  `valor` int NOT NULL,
  `cod_produto_id` int NOT NULL,
  `cod_venda_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_venda`
--

CREATE TABLE `home_venda` (
  `id` int NOT NULL,
  `valorTotal` int NOT NULL,
  `cod_cliente_id` int NOT NULL,
  `cod_produto_id` int NOT NULL,
  `cod_vendedor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_vendedor`
--

CREATE TABLE `home_vendedor` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int NOT NULL,
  `sexo` varchar(5) NOT NULL,
  `n_doc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `home_cliente`
--
ALTER TABLE `home_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_endereco`
--
ALTER TABLE `home_endereco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_endereco_cod_cliente_id_cebc5bf6_fk_home_cliente_id` (`cod_cliente_id`);

--
-- Indexes for table `home_produto`
--
ALTER TABLE `home_produto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_prod_venda`
--
ALTER TABLE `home_prod_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_prod_venda_cod_produto_id_5a2e31b9_fk_home_produto_id` (`cod_produto_id`),
  ADD KEY `home_prod_venda_cod_venda_id_35aed8d0_fk_home_venda_id` (`cod_venda_id`);

--
-- Indexes for table `home_venda`
--
ALTER TABLE `home_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_venda_cod_cliente_id_5c276d5a_fk_home_cliente_id` (`cod_cliente_id`),
  ADD KEY `home_venda_cod_produto_id_81ba91e7_fk_home_produto_id` (`cod_produto_id`),
  ADD KEY `home_venda_cod_vendedor_id_7f06b40b_fk_auth_user_id` (`cod_vendedor_id`);

--
-- Indexes for table `home_vendedor`
--
ALTER TABLE `home_vendedor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `home_cliente`
--
ALTER TABLE `home_cliente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_endereco`
--
ALTER TABLE `home_endereco`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_produto`
--
ALTER TABLE `home_produto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_prod_venda`
--
ALTER TABLE `home_prod_venda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_venda`
--
ALTER TABLE `home_venda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_vendedor`
--
ALTER TABLE `home_vendedor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `home_endereco`
--
ALTER TABLE `home_endereco`
  ADD CONSTRAINT `home_endereco_cod_cliente_id_cebc5bf6_fk_home_cliente_id` FOREIGN KEY (`cod_cliente_id`) REFERENCES `home_cliente` (`id`);

--
-- Constraints for table `home_prod_venda`
--
ALTER TABLE `home_prod_venda`
  ADD CONSTRAINT `home_prod_venda_cod_produto_id_5a2e31b9_fk_home_produto_id` FOREIGN KEY (`cod_produto_id`) REFERENCES `home_produto` (`id`),
  ADD CONSTRAINT `home_prod_venda_cod_venda_id_35aed8d0_fk_home_venda_id` FOREIGN KEY (`cod_venda_id`) REFERENCES `home_venda` (`id`);

--
-- Constraints for table `home_venda`
--
ALTER TABLE `home_venda`
  ADD CONSTRAINT `home_venda_cod_cliente_id_5c276d5a_fk_home_cliente_id` FOREIGN KEY (`cod_cliente_id`) REFERENCES `home_cliente` (`id`),
  ADD CONSTRAINT `home_venda_cod_produto_id_81ba91e7_fk_home_produto_id` FOREIGN KEY (`cod_produto_id`) REFERENCES `home_produto` (`id`),
  ADD CONSTRAINT `home_venda_cod_vendedor_id_7f06b40b_fk_auth_user_id` FOREIGN KEY (`cod_vendedor_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
