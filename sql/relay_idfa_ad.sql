CREATE TABLE `relay_idfa_ad` (
`idfa` blob NOT NULL,
`ad_id` int(10) unsigned NOT NULL,
`time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`idfa`(255),`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8