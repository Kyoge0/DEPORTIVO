-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2024 a las 04:04:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `expediente_medico3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `subject` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('messi@gmail.com|127.0.0.1', 'i:2;', 1731218977),
('messi@gmail.com|127.0.0.1:timer', 'i:1731218977;', 1731218977);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medical_infos`
--

CREATE TABLE `medical_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `medications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medications`)),
  `services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`services`)),
  `total_price` decimal(8,2) DEFAULT NULL,
  `nurse_attended` tinyint(1) NOT NULL DEFAULT 0,
  `vital_signs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vital_signs`)),
  `reason` text DEFAULT NULL,
  `consultation_date` date DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_18_234917_add_role_to_users_table', 1),
(5, '2024_07_11_154541_create_medical_infos_table', 1),
(6, '2024_07_17_184347_create_appointments_table', 1),
(7, '2024_08_03_070449_create_medicines_table', 1),
(8, '2024_08_04_035918_create_services_table', 1),
(9, '2024_11_10_054833_create_teams_table', 2),
(10, '2024_11_10_055650_create_team_user_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Snx5JIOJx4AJAS4lFQ2gAuFeqMNHaMKGJdsK5fT4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 Edg/130.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoib3NvQ012T3BTaTRVd1YwMkRrenVvYm1waHVaOUlhcXNXdU14STlhaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9jcmVhdGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1731222151);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `teams`
--

INSERT INTO `teams` (`id`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'America', 'logos/cBiZXMDtGXBaLG6IQKa4ZsSUKZCEzCcwicy0S9BW.png', '2024-11-10 12:07:44', '2024-11-10 12:07:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `team_user`
--

INSERT INTO `team_user` (`id`, `team_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 5, NULL, NULL),
(3, 1, 6, NULL, NULL),
(4, 1, 7, NULL, NULL),
(5, 1, 8, NULL, NULL),
(6, 1, 9, NULL, NULL),
(7, 1, 10, NULL, NULL),
(9, 1, 12, NULL, NULL),
(10, 1, 13, NULL, NULL),
(11, 1, 14, NULL, NULL),
(12, 1, 15, NULL, NULL),
(13, 1, 16, NULL, NULL),
(14, 1, 17, NULL, NULL),
(15, 1, 18, NULL, NULL),
(16, 1, 19, NULL, NULL),
(17, 1, 20, NULL, NULL),
(18, 1, 21, NULL, NULL),
(25, 1, 28, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','referee','coach','player') NOT NULL DEFAULT 'player',
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `age`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2y$12$tH59jLXfXkXts7qNpRsJ5O8saW0V7glqrQ0duRqot60jgnJs419Gi', NULL, '2024-11-10 09:46:01', '2024-11-10 09:46:01', 'admin', 30),
(2, 'Referee John', 'referee@example.com', NULL, '$2y$12$KNv5dGlF7wD.etsXH51S6un7mcqKe62.6dVTwef48H9aCfrUFLm0O', NULL, '2024-11-10 09:46:01', '2024-11-10 09:46:01', 'referee', 40),
(3, 'Player Jane', 'player@example.com', NULL, '$2y$12$EF76cTsV/5anKLM9z2r3QOJiHqnTAgkHt.qIjp3S/LbUpZwSf0U1q', NULL, '2024-11-10 09:46:01', '2024-11-10 09:46:01', 'player', 25),
(4, 'gabo', 'gabo@gmail.com', NULL, '$2y$12$.OhlORFifaNxorGsVOOhtOZHrPr./4oh2lK33inSz6pH1UOtd081S', NULL, '2024-11-10 10:00:06', '2024-11-10 10:00:06', 'coach', 22),
(5, 'Guillermo Ochoa', 'guillermo.ochoa@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 36),
(6, 'Bruno Valdez', 'bruno.valdez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 28),
(7, 'Emanuel Aguilera', 'emanuel.aguilera@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 31),
(8, 'Luis Fuentes', 'luis.fuentes@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 34),
(9, 'Jorge Sánchez', 'jorge.sanchez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 23),
(10, 'Richard Sánchez', 'richard.sanchez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 25),
(11, 'Pedro Aquino', 'pedro.aquino@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 26),
(12, 'Álvaro Fidalgo', 'alvaro.fidalgo@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 24),
(13, 'Sebastián Córdova', 'sebastian.cordova@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 23),
(14, 'Henry Martín', 'henry.martin@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 28),
(15, 'Federico Viñas', 'federico.vinas@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 23),
(16, 'Roger Martínez', 'roger.martinez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 27),
(17, 'Giovani dos Santos', 'giovani.dos.santos@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 32),
(18, 'Nicolás Benedetti', 'nicolas.benedetti@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 24),
(19, 'Santiago Naveda', 'santiago.naveda@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 20),
(20, 'Leonardo Suárez', 'leonardo.suarez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 25),
(21, 'Mauro Laínez', 'mauro.lainez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 25),
(22, 'Luis Reyes', 'luis.reyes@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 30),
(23, 'Fernando Madrigal', 'fernando.madrigal@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 29),
(24, 'Jordan Silva', 'jordan.silva@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 27),
(25, 'Oscar Jiménez', 'oscar.jimenez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 33),
(26, 'Emilio Lara', 'emilio.lara@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 20),
(27, 'Karel Campos', 'karel.campos@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 18),
(28, 'Ramón Juárez', 'ramon.juarez@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 21),
(29, 'Santiago Solari', 'santiago.solari@example.com', NULL, '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFQx1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y1x9Y', NULL, NULL, NULL, 'player', 45);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medical_infos`
--
ALTER TABLE `medical_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medical_infos_patient_id_foreign` (`patient_id`);

--
-- Indices de la tabla `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_user_team_id_foreign` (`team_id`),
  ADD KEY `team_user_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medical_infos`
--
ALTER TABLE `medical_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `medical_infos`
--
ALTER TABLE `medical_infos`
  ADD CONSTRAINT `medical_infos_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `team_user`
--
ALTER TABLE `team_user`
  ADD CONSTRAINT `team_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
