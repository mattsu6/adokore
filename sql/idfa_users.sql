CREATE TABLE `idfa_users` (
`idfa` varchar(255) NOT NULL,
`adokore_user` varchar(255) NOT NULL,
`time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`idfa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8