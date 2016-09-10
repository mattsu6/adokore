CREATE TABLE `adokore_user` (
`adokore_user` blob NOT NULL,
`password` blob NOT NULL,
`time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`adokore_user`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8