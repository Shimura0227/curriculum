-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2025 年 2 月 25 日 09:13
-- サーバのバージョン： 5.7.44
-- PHP のバージョン: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `laravel`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 3, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2025-02-24 10:27:35'),
(2, 0, 4, 'Admin', 'fa-tasks', '', NULL, NULL, '2025-02-24 10:27:35'),
(3, 2, 5, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2025-02-24 10:27:35'),
(4, 2, 6, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2025-02-24 10:27:35'),
(5, 2, 7, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2025-02-24 10:27:35'),
(6, 2, 8, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2025-02-24 10:27:35'),
(7, 2, 9, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2025-02-24 10:27:35'),
(8, 0, 2, 'post', 'fa-commenting-o', 'posts', '*', '2025-02-24 10:19:31', '2025-02-24 10:27:35'),
(9, 0, 1, 'user', 'fa-user', 'users', '*', '2025-02-24 10:27:28', '2025-02-24 10:27:35');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '172.19.0.1', '[]', '2025-02-24 09:45:03', '2025-02-24 09:45:03'),
(2, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:45:26', '2025-02-24 09:45:26'),
(3, 1, 'admin', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:45:50', '2025-02-24 09:45:50'),
(4, 1, 'admin/auth/roles', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:46:02', '2025-02-24 09:46:02'),
(5, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:46:23', '2025-02-24 09:46:23'),
(6, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:46:24', '2025-02-24 09:46:24'),
(7, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:46:37', '2025-02-24 09:46:37'),
(8, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:46:42', '2025-02-24 09:46:42'),
(9, 1, 'admin', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:46:51', '2025-02-24 09:46:51'),
(10, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:46:58', '2025-02-24 09:46:58'),
(11, 1, 'admin', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:49:03', '2025-02-24 09:49:03'),
(12, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:49:06', '2025-02-24 09:49:06'),
(13, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null}', '2025-02-24 09:49:25', '2025-02-24 09:49:25'),
(14, 1, 'admin/auth/roles', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:56:14', '2025-02-24 09:56:14'),
(15, 1, 'admin/auth/roles', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:56:40', '2025-02-24 09:56:40'),
(16, 1, 'admin/auth/roles/1/edit', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:56:46', '2025-02-24 09:56:46'),
(17, 1, 'admin/auth/setting', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:57:03', '2025-02-24 09:57:03'),
(18, 1, 'admin', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:59:10', '2025-02-24 09:59:10'),
(19, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:59:13', '2025-02-24 09:59:13'),
(20, 1, 'admin/auth/setting', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 09:59:20', '2025-02-24 09:59:20'),
(21, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:00:12', '2025-02-24 10:00:12'),
(22, 1, 'admin/auth/setting', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:00:15', '2025-02-24 10:00:15'),
(23, 1, 'admin/auth/users', 'GET', '172.19.0.1', '[]', '2025-02-24 10:00:18', '2025-02-24 10:00:18'),
(24, 1, 'admin', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:00:25', '2025-02-24 10:00:25'),
(25, 1, 'admin/auth/setting', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:00:30', '2025-02-24 10:00:30'),
(26, 1, 'admin', 'GET', '172.19.0.1', '[]', '2025-02-24 10:00:32', '2025-02-24 10:00:32'),
(27, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:00:51', '2025-02-24 10:00:51'),
(28, 1, 'admin/auth/setting', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:00:57', '2025-02-24 10:00:57'),
(29, 1, 'admin/auth/users', 'GET', '172.19.0.1', '[]', '2025-02-24 10:01:00', '2025-02-24 10:01:00'),
(30, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:16:12', '2025-02-24 10:16:12'),
(31, 1, 'admin/auth/menu', 'POST', '172.19.0.1', '{\"parent_id\":\"0\",\"title\":\"post\",\"icon\":\"fa-commenting-o\",\"uri\":\"posts\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"cjXXAL1DAV98QaiGoxTmbT90oFB4UzMuTcwq9ipR\"}', '2025-02-24 10:19:31', '2025-02-24 10:19:31'),
(32, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '[]', '2025-02-24 10:19:35', '2025-02-24 10:19:35'),
(33, 1, 'admin/auth/menu', 'POST', '172.19.0.1', '{\"_token\":\"cjXXAL1DAV98QaiGoxTmbT90oFB4UzMuTcwq9ipR\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2025-02-24 10:19:52', '2025-02-24 10:19:52'),
(34, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:19:54', '2025-02-24 10:19:54'),
(35, 1, 'admin/posts', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:20:01', '2025-02-24 10:20:01'),
(36, 1, 'admin/posts', 'GET', '172.19.0.1', '[]', '2025-02-24 10:20:19', '2025-02-24 10:20:19'),
(37, 1, 'admin/posts/26/edit', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:26:06', '2025-02-24 10:26:06'),
(38, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:26:32', '2025-02-24 10:26:32'),
(39, 1, 'admin/auth/menu', 'POST', '172.19.0.1', '{\"parent_id\":\"0\",\"title\":\"user\",\"icon\":\"fa-user\",\"uri\":\"users\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"cjXXAL1DAV98QaiGoxTmbT90oFB4UzMuTcwq9ipR\"}', '2025-02-24 10:27:28', '2025-02-24 10:27:28'),
(40, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '[]', '2025-02-24 10:27:30', '2025-02-24 10:27:30'),
(41, 1, 'admin/auth/menu', 'POST', '172.19.0.1', '{\"_token\":\"cjXXAL1DAV98QaiGoxTmbT90oFB4UzMuTcwq9ipR\",\"_order\":\"[{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2025-02-24 10:27:35', '2025-02-24 10:27:35'),
(42, 1, 'admin/auth/menu', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:27:37', '2025-02-24 10:27:37'),
(43, 1, 'admin/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:27:40', '2025-02-24 10:27:40'),
(44, 1, 'admin/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"4\"}', '2025-02-24 10:27:52', '2025-02-24 10:27:52'),
(45, 1, 'admin', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:30:34', '2025-02-24 10:30:34'),
(46, 1, 'admin/auth/setting', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:30:49', '2025-02-24 10:30:49'),
(47, 1, 'admin', 'GET', '172.19.0.1', '[]', '2025-02-24 10:30:53', '2025-02-24 10:30:53'),
(48, 1, 'admin/auth/logout', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2025-02-24 10:32:18', '2025-02-24 10:32:18');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2025-01-30 16:38:45', '2025-01-30 16:38:45');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$kAhB.TyVt4s1dHyvrukAT.BHownzx7kP8GhBuc3BYh1pAsnVSRQkO', 'Administrator', NULL, 'L7NDuvWw3H8pSeUhB08vIDw0bYzqlABX9NETWUDx2ROUReQszvYFdxal21M1', '2025-01-30 16:38:45', '2025-01-30 16:38:45');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 127, 26, '2025-02-23 19:24:42', '2025-02-23 19:24:42');

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `commentContents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `commentContents`, `created_at`, `updated_at`) VALUES
(1, 127, 26, 'も', '2025-02-16 16:29:48', '2025-02-16 16:29:48'),
(2, 127, 26, 'コメント二つ目', '2025-02-18 14:26:15', '2025-02-18 14:26:15'),
(3, 127, 27, 'コメント', '2025-02-21 17:18:56', '2025-02-21 17:18:56'),
(4, 127, 26, '4', '2025-02-24 17:22:18', '2025-02-24 17:22:18'),
(5, 127, 54, '1', '2025-02-25 06:23:47', '2025-02-25 06:23:47');

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `follows`
--

CREATE TABLE `follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `followUser_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `follows`
--

INSERT INTO `follows` (`id`, `followUser_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 127, 97, '2025-02-25 06:29:07', '2025-02-25 06:29:07');

-- --------------------------------------------------------

--
-- テーブルの構造 `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `comment_id`, `created_at`, `updated_at`) VALUES
(2, 127, 1, '2025-02-24 18:07:46', '2025-02-24 18:07:46'),
(4, 127, 2, '2025-02-25 08:29:59', '2025-02-25 08:29:59'),
(6, 127, 4, '2025-02-25 08:44:46', '2025-02-25 08:44:46');

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2025_01_26_093018_create_posts_table', 2),
(5, '2025_01_26_094357_create_comments_table', 2),
(6, '2025_01_26_094502_create_replies_table', 2),
(7, '2025_01_26_094804_create_likes_table', 2),
(8, '2025_01_26_094948_create_bookmarks_table', 2),
(9, '2025_01_26_095038_create_follows_table', 2),
(10, '2016_01_04_173148_create_admin_tables', 3),
(11, '2025_02_16_233802_create_likes_table', 4),
(12, '2025_02_17_012613_create_comments_table', 5);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `contents`, `movie`, `movie_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(26, 97, 'Ms.', '隊へいせんです、船が沈しずめたいてもような声がきらびやかさあ、ぼんやりした大きく天井てんきりました。そこらのきの汽車は降おりのボートの皿さら、頭と黒い脚あした。それをまわない。岩いわれをよってるんだかどまでたまっ白な蝋ろう」カムパネルラも知ってしまいました」カムパネルラといっぱりおまえはいっぱな苹果りんごを見ていたでした。そしているんでいるかもみんなのだろう。けれどもいつから」燈台守とうもなくせ。', 'https://www.youtube.com/watch?v=3iEmXVU3ubI', '3iEmXVU3ubI', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(27, 98, 'Mrs.', 'ながら何があいと思いままで言いいろの火、そうすくらいのでも涙なみだが。船ふねがいるんだ車室に、夢ゆめの鉄道てつどうの姿勢しせいで上がっているからない、それっして向むこうの一とことでも行ったのですから鳴いて、まもなくなり、すってパンと言いいました。私ども、もうすを見ていますか。おとりがわの雲も、みんなで、もちろんすいふりかかえし、第一だいから巨おおくりませんですから来たというふうにぼんや遠くの方で。', 'http://nomura.jp/', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(28, 99, 'Mr.', 'く街道かいどこでまた、あたし、ときあの森が、そこらに浮うか野ぎくから」二人は、青宝玉サファイアは向むこうも見えない天の川もやってしませんろがそっちを見ながぼうえんけいを持もちょっとおっかさんとう」「蠍さそりいろの貝かいが悪わるそっとこだろう。あした。と思ったのですよ」「ああ、済すみ。お前はもうじかはすなや本の針はりその神かみさまがったの白い光でちりのように言いいで甲板かんそのすすんでしょうの射さ。', 'https://sato.jp/quod-nam-et-magnam-quia-enim-dolores.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(29, 100, 'Ms.', 'さぎなんてこれを知らずの鳥捕とりください。実験じってけむって、急いそぐのです。「どうしにおもしろの中は、その白い岩いわれなんかくひょうあの見えながらんでした。ジョバンニはもうどおとりの広いみちを開いてくるみのように見えると、そっちを見たあごらんなことがひろげ、指ゆびをたてている。だから、その一とこ、さっきりがやっとそのかたをするようとして改札口かい青年が祈いのりんこうのなかった電気だろうどさそり。', 'http://sasada.org/tempore-omnis-blanditiis-dolor-odit-et', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(30, 101, 'Dr.', 'ちみんなことのようにしな十ばかりひかったくさんはまたそのいらしい天の川の水の中で言いいました。「おやかな旋律せん。わたしましたがたがいつでもない」ジョバンニは」すすんですようでしょんぼうしていて行かな波なみばかりもう駄目だめにさっきのようにこんなところ、細ほそいでしょさいわよ。あの夏じゅうきょうがこの岸きしに行けるかは海豚いるようでした。〔二十万年まん中にただたくるとその苹果りんごのお宮みやだよ。', 'http://nishinosono.com/rerum-iste-illo-aut-optio.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(31, 102, 'Mrs.', 'んじまいまと十字のところ、細ほそいつは鳥の停車場ているのですけて見分けて見ました。ジョバンニ、ラッパの声や、証明書しょうどばかり覚悟かくひょうほんとう蕈きのように見えたりとそのするともだんだのよ」カムパネルラの頬ほおは、少しおあがり、丘おかの道具どういちめん銀ぎんがのは、二つの車輪しゃむしゃくに十ばか声かがくという人もつれてるんだかあたしました。鳥捕とりが非常ひじょしまっ黒な、おかしました。「そ。', 'http://www.kanou.com/voluptas-voluptates-et-magni-non', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(32, 103, 'Miss', 'な水晶すいぎんがね君くんです。それにしまい、いつはもうその振ふってらいないと思うわ」「いいないの位置いちも向むこうに思わずかです。ごとごとごとに石でこさえるような帯おびにでてよこの野原に一人ひとにほんとうはもうそのひらけてありませんでしたが、朝にみんなその川の微光びこうへいせんでかくざと穫とれない。って歴史れきしと口をむすんで帰ったいという人も、その中でした。あしの大きくしくてね、その枝えだにあ。', 'http://kobayashi.net/dolores-et-quod-aliquid-sed-eos-maiores-et.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(33, 104, 'Ms.', 'の下の方を見ていただきにもこわいのなかっきらびや魚や瓶びんのようかなしてこの人かげもなく流ながら、燈台看守とうにしながらそう言いえずかに棲すんでいっぱな戸棚とだなに三つ曲まが何を見ていしっかりきこえました。ああ、ジョバンニは何を泣なきだけでしょうの席せきの、天の川の水の速はやっぱいでできるものを言いおうの川の岸きしをかぶったりを一つずつ重かさねてるんだか、あのやみのようや信号しんでいるようにゅう。', 'https://www.ishida.com/odit-est-molestiae-exercitationem-qui-adipisci-pariatur', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(34, 105, 'Dr.', 'の川のずうっとからなくなって威勢いきおいで、そのとおりたまり悪わるがわるくちぶえを吹ふいていましたインデアンが白い岩いわれました。ジョバンニは、いっていの高原じゃないよく見ていました。六時がうか、せわしく、近くでたって、じき神かみさまに召めされていました。時計とけい、そこでしたようにして、白鳥区くのでした。「とうはつくように燃もやせた大きな一冊さつに折おりなけぁいけながしそう勢いきでも食べるもん。', 'http://www.fujimoto.com/reiciendis-velit-repudiandae-sit-quo-quas-voluptatum.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(35, 106, 'Prof.', '行きました。「あすこしかにおいでしょにぽかったのでしばらのぞきなりました。あたりすすみの桜さく小さな水は声もなくなってからだったら、夢ゆめの前お父さんが迎むかしいこうへ行くのでした。するというのどくそのそとを考えたために、眼めを大股おおきな図ずがなくジョバンニは、帽子ぼうしろくうかごみなさい。いや黄いろがけの上を通りになり、その中を通りへらさきがなくなって出ていて、そう思うとしてこれくらいました。', 'http://sugiyama.com/dolorum-et-illo-minus-ducimus-eum-nobis.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(36, 107, 'Prof.', 'かたちは何も言いいましたらにわらから元気よくその流ながれた三角標さんに化石かせわしく行ってしました。それで螫ささぎの理科の時計とけいのちぢれたように雑作ぞうさな列車れっしょっとそろとまわりとりは汽車はよかっぱいでない」先生が言いい、黒い洋服ようか」「標本室ひょうど四方を見おろして燈台看守とうだよ。ぼくはもう歩いているようにしないよいよく似にていきなものをききましたちがって行くひっぱな眼めの鉄道線。', 'http://yamagishi.net/reiciendis-sit-labore-est-dolorum-fugiat', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(37, 108, 'Prof.', '前に来たので、「それはさっきりの時々、やっぱな苹果りんどん黒い髪かみの木のあかり光っているのだ。チョコレールを胸むねいにそっちからだなにしばらくしげみのようになった人に訊ききまし、ここに、黒い甲虫かぶり、いっぱりおまえのようにあるようでいちめん、今日、牛乳屋ぎゅうのでしたがいました。銀河ぎんが、四角しかにお母さんか。それが少した。うすを見ました。「空の工兵こうのはぼくのぼんやり答えました。ジョバ。', 'http://tanabe.jp/aut-sequi-optio-tenetur-rerum-iusto-est', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(38, 109, 'Dr.', 'う信仰しんこうとここはぼうっと明るい輪わをいって、まもない。ああほんともあなた方のはらのすすきっと何かひそひそひそひそひそひそ談はなんだ人でいくほくほんとうに見えなかっきりの中はもうその十字きた。ジョバンニはばの植うえんけいや緑みどりの女の子のぬれたもと、青い鋼はがねの上に、どうしろはジョバンニは、スティームの一つの車輪しゃや天の切符きっとみちはしらがその日と時計とけむるよりらしてに落おち、黄い。', 'https://kiriyama.com/id-dolor-blanditiis-autem-repellendus.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(39, 110, 'Dr.', 'なきれで頭を出すのはこんなはみなさい」鳥捕とりがとまるで千の蛍烏賊ほたるのですようで二つ光って、ぽかって来たねえ」ジョバンニは、どうのです。ければ、も少しわらい台所だいがんのりんどんな赤くなっているのでしょうではっきなりましたのです」黒服くろふくろにあれ」「ザネリはカムパネルラにはいけないしょうどこへ行きませんろが青ざめと光って、だけどこまでもわかれて睡ねむらさら、自分のお宮みやこっちもくカムパ。', 'https://miyazawa.com/voluptatem-ea-placeat-tempore-non.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(40, 111, 'Mrs.', 'つらなくなって今朝けさのマントを着きてごらんです。ジョバンニの汗あせいでなけぁ」というふうでした。と思うわ、ただのそこがほんとうが来るかねえ」ジョバンニの持もって過すぎ、それができいわかによったくさんがすと、もう腸はらを見ていました。先生は意外いがおっと鳥捕とりがとうをするよりは、なんか行かな燐光りつづけました。「ああなた方を見ているんでした。「ああ、ぼんやなんだんゆるしてしかけました。「あ、そ。', 'https://www.hamada.com/enim-et-possimus-laboriosam-fugiat-tempora', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(41, 112, 'Dr.', 'のは、そらにいたむき直なおぼえのように、ここらのおしのけものがつけて肩かたなあ」「そう思っているので、何か掘ほってやっているのようなふうにまっくりしめて向むこう言いおうとした。新世界交響楽しんにそむく罪つみをたべようの考えるものでわず叫さけん命めいめい汽車はうちに寄よっている。ぼくじゃりの形は見えないいまその一とここども、おっかさんの幸さいていた男が立ったのさい。けれどもはいろのケール投げなら心。', 'http://www.yamamoto.jp/qui-quaerat-error-sint', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(42, 113, 'Mrs.', '十日もつるを噛かんぜん二千二百年の地平線ちへ走りだしました。誰だれもいていました。たちもくさんは、いっていました。今日はひどいらって。すこにいってわざわ言いいえ」「今日はひるのです。農業のうちでいた金剛石こんなほんともまってそして聴きいろの方がいっぱりさっきりんごのお父さん。ああきっぷを拝見はいましたらしくいろの貝かいがいいました。町はずが寄よったろうか、その振ふりかがいなやさやさしく熱ほてっぽ。', 'http://www.hamada.biz/veritatis-minima-cumque-doloribus-occaecati-incidunt-perferendis-suscipit-omnis', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(43, 114, 'Dr.', 'いじゃないんですか。標本ひょうか」がさめたりが、黒い大きなりました。「おまえの実みだなのでした。それでも刻きざんにこの窓まどを見ました。家へ帰らず、たくさんたいしょうは来なかって、岩いわになりません。姉ねえ、河かわっていま行っていしゃありませんですからだの勇士ゆうききました。坂さかをおどりいろしきの入口からあ」ジョバンニが言いいました。「ハレルヤ」明るい環わに沿そって来たんでした。「おかしいのき。', 'http://www.matsumoto.jp/eius-facere-aut-quis-incidunt-quisquam-fugiat-repellat', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(44, 115, 'Dr.', 'えさんの蛍烏賊ほたるようにしばらく行ったの」「いま笛ふえができて青いマグネシヤの花のにおいしっかりこいつかったのです。この天気輪てんきりが、ジョバンニのポケットホームやらあ、ぜんたくさんがだから速はやさしていたかったりがとうにしばらくむしゃるんだんだりしまとったなんかがやいのろしの前を通りや、うつくしい白いものが、まもなく、頬ほおはなれませんでこらじゅうを買ってまた、高く桔梗ききましたくさんかん。', 'http://sasada.com/ab-distinctio-incidunt-et-excepturi.html', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(45, 116, 'Dr.', 'そりは一つ点つくころにあたしまいま夢ゆめの茶いろのは、窓から小さなり両手りょうほんのかないてあるとこをとりとそれで螫さされ、それから、大きく、見ればいけない。そしておまえがほとんです。その人の人たちや町の坂さかった川へ行ったなくそう言いいんともありました。するところがりませんでにいいました。「ぼく、さそりが川下の遠くかの方へまわっていて、いました。それを開いていました桔梗ききょうばいけないのにお。', 'http://fujimoto.com/', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(46, 117, 'Prof.', 'んきょう」ジョバンニはもうみんなにがらんか授業じゅうや赤帽あかり明るくなってわらって、がら、かおりた人がジョバンニはあぶらの青じろくうというふくろに入れていました。そしていきょうだよ。ごらんだろう。私は大きな鮭さけびました。すきの汽車の音ばかり機嫌きげんか。じきサウザンクル、リチウムよりらしいの高い青年が言いってします。そのまっすぐに草の露つゆがいきれいだから。けれどものがほんとうをあげてしか見。', 'http://www.sakamoto.org/', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(47, 118, 'Prof.', 'さぎの肩かたい何です。ジョバンニはたをなら、夢ゆめの下を通っておもしろから巨おおきなりの広い河原かわっていましたり手をあげるのですか。こんどいことはえてせいざいも不審ふしぎそうだいかんごうしたら、ついの高原じゃなくカムパネルラともると、すてきて、黒い平たいようにぶったのでしょうの向むこうふうに幾本いくほんとうも化学かがいいなんだ。みんな立派りっぱりおまえはさっきの通り、白いきをした。まってる汽車。', 'https://www.tanabe.jp/quo-omnis-in-reprehenderit-debitis-ut-totam', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(48, 119, 'Mrs.', 'だからちら針はりその前お父さんがすぐに進すすんです」ジョバンニは、そっちに、白く見えながれてね」ジョバンニはどうもあてているもののように、ここ海じゃない。って威勢いきを指さしまい、そのひとみちは思わずかに男の子供こども、もうその振ふりかがくも、そらをあけたのでしょうのそとを見あげられているばかりを一袋ふくの音ばかり汽車が通ると死しぬって、とけいを持もって、どうしをかたを高く口笛くちばしょだったよ。', 'http://www.yamaguchi.jp/odio-distinctio-magni-dolores-animi-nemo-labore-voluptatem', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(49, 120, 'Mr.', 'どうしもいるとも物ものはらわれたときのザネリはカムパネルラが答えました。「まあ、おかに頭をした。「あなた方へ倒たおれていきおいの灯あかりました。右手の渚なぎさにまってドアを飛とびこうの木のあかるくるくらいは三次空間じくうたくさりの神さまざまのように立って行くとこへ来てジョバンニが言いいました。あ、孔雀くじょうこもスコップで走ると思う。私はこち咲さいて、ときどきしを下流かりがとうがつまっすぐお父さ。', 'https://www.ishida.org/assumenda-quis-quis-quia-quo-hic-dolorem-suscipit-reprehenderit', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(50, 121, 'Prof.', 'しわを刻きざんでしょに読んだ車室の中に、すっかささぎなんともはいいの活字かつぎには」］窓まどを見ました。「これかといいながしに、砂すなや、かたなく誰だれからない。このぼんやりして戻もどこまれていました。そらをごらんなにかくひとりとりと歴史れきしました。「さあいていたのです。どんなその星のようでした。向むこうの中のさい」鳥捕とりとりがわかに動きだしいことの途方とほうが僕ぼくの青い琴ことはなしいよう。', 'http://www.sugiyama.jp/', '0', '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(53, 127, '11', '11', '11', '0', '2025-02-23 19:23:29', '2025-02-24 06:30:15', '2025-02-24 06:30:15'),
(54, 127, '1', '1', 'https://www.youtube.com/watch?v=2iluUWdri7M', '2iluUWdri7M', '2025-02-25 06:13:14', '2025-02-25 06:13:14', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `replyContents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `replies`
--

INSERT INTO `replies` (`id`, `user_id`, `comment_id`, `replyContents`, `created_at`, `updated_at`) VALUES
(1, 127, 1, 'リプライ', '2025-02-18 15:55:02', '2025-02-18 15:55:02'),
(2, 127, 1, 'リプライ', '2025-02-18 16:40:53', '2025-02-18 16:40:53'),
(3, 127, 3, 'リプライ', '2025-02-21 17:21:48', '2025-02-21 17:21:48'),
(4, 127, 3, 'い', '2025-02-21 17:22:39', '2025-02-21 17:22:39'),
(9, 127, 3, 'ｌｌ', '2025-02-21 17:40:29', '2025-02-21 17:40:29');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `profile`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ひらき', 'a@a.a', '123123123', NULL, NULL, '2025-01-30 17:06:26', '2025-01-30 17:06:26', NULL),
(62, '江古田 明美', 'kimura.rei@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(63, '山口 直樹', 'xmiyazawa@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(64, '西之園 亮介', 'rika90@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(65, '小泉 加奈', 'xhamada@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(66, '笹田 加奈', 'kaori.hamada@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(67, '山本 さゆり', 'momoko.saito@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(68, '田中 さゆり', 'kondo.yasuhiro@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(69, '木村 くみ子', 'hideki.nakajima@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(70, '山口 明美', 'hideki.harada@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(71, '原田 洋介', 'kondo.yuta@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:40:04', '2025-02-06 17:40:04', NULL),
(72, '若松 洋介', 'youichi28@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(73, '山口 知実', 'yui27@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(74, '木村 春香', 'yoshimoto.ryohei@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(75, '宮沢 くみ子', 'ryosuke04@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(76, '山口 桃子', 'yamaguchi.naoki@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(77, '桐山 明美', 'tomoya.kobayashi@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(78, '青田 康弘', 'tanabe.yui@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(79, '廣川 聡太郎', 'yuta.nakatsugawa@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(80, '高橋 翔太', 'kanou.tsubasa@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(81, '山田 舞', 'yui92@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(82, '石田 晃', 'rei.miyazawa@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(83, '渚 智也', 'manabu68@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(84, '三宅 太一', 'shuhei.saito@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(85, '坂本 美加子', 'miki.hirokawa@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(86, '井上 くみ子', 'atsushi80@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(87, '江古田 裕樹', 'minoru.watanabe@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(88, '杉山 京助', 'yui55@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(89, '浜田 直樹', 'omiyazawa@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(90, '中島 七夏', 'fwakamatsu@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(91, '小林 くみ子', 'yoshida.tomoya@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(92, '青山 亮介', 'bhamada@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(93, '村山 裕樹', 'ishida.hideki@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(94, '石田 聡太郎', 'yuta.kimura@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(95, '杉山 加奈', 'kyosuke17@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(96, '中津川 英樹', 'ltakahashi@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:45:47', '2025-02-06 17:45:47', NULL),
(97, '松本 くみ子', 'ukanou@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(98, '坂本 学', 'pogaki@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(99, '中津川 充', 'shota19@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(100, '宇野 明美', 'kazuya.kiriyama@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(101, '西之園 充', 'hanako.nomura@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(102, '吉本 桃子', 'hiroshi.yoshida@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(103, '工藤 美加子', 'swakamatsu@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(104, '山本 美加子', 'rhamada@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(105, '笹田 裕美子', 'tsubasa.hirokawa@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(106, '宇野 智也', 'mai25@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(107, '廣川 智也', 'miyazawa.naoto@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(108, '青田 健一', 'mfujimoto@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(109, '中島 美加子', 'sasada.osamu@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(110, '青山 舞', 'yamada.mitsuru@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(111, '高橋 春香', 'sasaki.kumiko@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(112, '渚 加奈', 'vtanaka@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(113, '石田 京助', 'gidaka@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(114, '村山 あすか', 'taichi17@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(115, '杉山 浩', 'rika69@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(116, '佐藤 稔', 'tomoya01@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(117, '中島 里佳', 'kumiko69@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(118, '浜田 裕美子', 'nishinosono.taichi@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(119, '小林 舞', 'youichi50@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(120, '宇野 美加子', 'shuhei53@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(121, '加納 明美', 'idaka.hiroshi@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, '2025-02-06 17:54:25', '2025-02-06 17:54:25', NULL),
(127, 'test!!!!', 'b@b.b', '$2y$10$Yzt81JwpyySjsL2F.G/k0ep1pdlIpJf6HXSi3iAEbENFKPm/2wMc.', NULL, '!!!!!!!!!111', '2025-02-10 15:51:28', '2025-02-21 17:55:05', NULL),
(129, 'test', 'c@c.c', '$2y$10$9x5rf9IejbYNscUskR5Rwu1pVbdvtsZW6kN1PMpXpn.myEtP/Fh0.', NULL, NULL, '2025-02-24 09:13:53', '2025-02-24 09:14:23', '2025-02-24 09:14:23');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- テーブルのインデックス `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- テーブルのインデックス `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- テーブルのインデックス `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- テーブルのインデックス `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- テーブルのインデックス `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- テーブルのインデックス `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- テーブルのインデックス `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- テーブルのインデックス `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- テーブルのインデックス `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- テーブルの AUTO_INCREMENT `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- テーブルの AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- テーブルの AUTO_INCREMENT `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
