-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 16, 2022 alle 10:28
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_work`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `civic_number` varchar(10) NOT NULL,
  `town` varchar(255) NOT NULL,
  `province` varchar(2) NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `customers`
--

INSERT INTO `customers` (`id`, `name`, `surname`, `address`, `civic_number`, `town`, `province`, `postal_code`, `email`, `telephone`) VALUES
(18, 'Ivan', 'Cerra', 'via empolese', '39', 'Scandicci', 'FI', '50018', 'ivancerra03@gmail.com', '3409900703');

-- --------------------------------------------------------

--
-- Struttura della tabella `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`) VALUES
(4, 'ivancerra03@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `id_customer`, `date`, `total_price`) VALUES
(16, 18, '2022-11-15', 71.97);

-- --------------------------------------------------------

--
-- Struttura della tabella `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `date` date DEFAULT NULL,
  `type` int(1) NOT NULL,
  `available` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `date`, `type`, `available`) VALUES
(27, 'Honey', 'Si dice che il secondo album è sempre il più difficile, non per noi a quanto pare. Godetevi il secondo fantastico disco degli Orsetti Lavativi', 23.99, NULL, 1, 1),
(28, 'Honey', 'Si dice che il secondo album è sempre il più difficile, non per noi a quanto pare. Godetevi il secondo fantastico disco degli Orsetti Lavativi anche in formato LP', 24.99, NULL, 2, 1),
(29, 'Honey - in concerto', 'Assicurati un posto per il secondo concerto degli Orsetti Lavativi che si svolgerà in Via del Bambù 24', 22.99, '2022-11-15', 0, 1),
(30, 'Panda Deluxe Edition', 'Il primo successo degli Orsetti Lavativi, ora con canzoni inedite. Disponibile sia in formato CD che LP', 21.99, NULL, 1, 1),
(31, 'Panda Deluxe Edition', 'Il primo successo degli Orsetti Lavativi, ora con canzoni inedite. Disponibile sia in formato CD che LP', 22.99, NULL, 2, 1),
(32, 'Panda - in Concerto', 'Il primo concerto non si scorda mai e magari neanche il 47esimo, assicurati un posto per il concerto che si terrà in Via del Miele 11 (TO)', 20.99, '2022-11-17', 0, 1),
(33, 'Best Song Ever', 'La canzone migliore di sempre, in un CD', 17.99, NULL, 1, 1),
(34, 'Best Song Ever', 'La canzone migliore di sempre, in un LP', 18.99, NULL, 2, 1),
(35, 'Panda', 'Il primo successo degli Orsetti Lavativi adesso rimasterizzato per la massima qualità audio', 19.99, NULL, 1, 1),
(36, 'Panda ', 'Il primo successo degli Orsetti Lavativi adesso rimasterizzato per la massima qualità audio', 20.99, NULL, 2, 1),
(37, 'Best Songe Ever - in concerto', 'Una canzone, un concerto. Semplice', 18.99, '2022-12-25', 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `products_sold`
--

CREATE TABLE `products_sold` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `products_sold`
--

INSERT INTO `products_sold` (`id_order`, `id_product`) VALUES
(16, 28),
(16, 29);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indici per le tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `products_sold`
--
ALTER TABLE `products_sold`
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `id_customer` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `products_sold`
--
ALTER TABLE `products_sold`
  ADD CONSTRAINT `id_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
