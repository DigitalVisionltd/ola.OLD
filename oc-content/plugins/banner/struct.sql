CREATE TABLE /*TABLE_PREFIX*/t_banner (
  k_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  k_cat_id int(10) NOT NULL,
  k_url varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  k_img varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  k_date varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(k_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET 'UTF8' COLLATE 'UTF8_GENERAL_CI';

CREATE TABLE /*TABLE_PREFIX*/t_banner_s ( 
  width INT(10) NOT NULL DEFAULT '800',
  height INT(10) NOT NULL DEFAULT '120',
  timeout INT(10) NOT NULL DEFAULT '3000'
) ENGINE=InnoDB DEFAULT CHARACTER SET 'UTF8' COLLATE 'UTF8_GENERAL_CI';

INSERT INTO /*TABLE_PREFIX*/t_banner_s
    (width, height, timeout)
VALUES
    (800, 120, 3000);