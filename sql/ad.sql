CREATE TABLE `ad` (
`ad_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
`adurl` blob,
`image_name` blob,
`image_path` blob,
`time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8