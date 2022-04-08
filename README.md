# Social-Blog-Script

## Düzenlemesi Gereken Dosyalar
1. views/user/profile.phtml
2. views/index/index_session.phtml
3  views/inc/header.php
4. public/ajax/mentions.php
5. public/ajax/profile_summary.php

## Tablo 
    ALTER TABLE `interactions` CHANGE `type` `type` ENUM('1','2','3','4','5','6') CHARACTER SET utf8
    COLLATE utf8_general_ci NOT NULL COMMENT '1 Follow, 2 Reposted, 3 favorite, 4 reply, 5 Mentions, 6
    Mentions in replies'
