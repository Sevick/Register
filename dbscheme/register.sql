CREATE DATABASE  IF NOT EXISTS `register` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `register`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: register
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `dt` datetime NOT NULL,
  `regstart` datetime NOT NULL,
  `regend` datetime NOT NULL,
  `info` varchar(4500) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `minmembers` int(11) DEFAULT NULL,
  `maxmembers` int(11) DEFAULT NULL,
  `usrid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_EVENT_USR_idx` (`usrid`),
  CONSTRAINT `FK_EVENT_USR` FOREIGN KEY (`usrid`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (68,'vxcxcvzxvz','1212-12-12 02:00:00','1212-12-12 02:00:00','1212-12-12 02:00:00','xxvcxcvasdfasdfas ddfgsdfg sdff gfg fg fgsdfgsdfgf fg ggg g gfsdfg fg gfg gfgfgf fgsdfg fgsdfg xcvbjg rtyufbvn fghghhh dfghg hghghd gfhdfghdfgh ghfgh dfghghghgd fghdfgh ghghghghdf fghdfg ghghdfgh df',NULL,NULL,2,22,1),(70,'123','1212-12-12 02:00:00','1212-12-12 02:00:00','1212-12-12 02:00:00','dfgsdfgdf sdfvxcbcbcv sdgwetdfgdfg sdsdfgdsfg',NULL,NULL,1,123,1),(190,'Event with many fields','2017-01-01 02:00:00','1212-12-12 02:00:00','1212-12-31 02:00:00','This is a event for testing all UI with many additional columns',NULL,NULL,1,123,1);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventimg`
--

DROP TABLE IF EXISTS `eventimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventimg` (
  `eventid` int(11) NOT NULL,
  `img` longblob NOT NULL,
  `name` varchar(45) NOT NULL,
  UNIQUE KEY `IDX_EVENTIMP_UQ` (`eventid`,`name`),
  CONSTRAINT `FK_EVENTIMG_EVENT` FOREIGN KEY (`eventid`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventimg`
--

LOCK TABLES `eventimg` WRITE;
/*!40000 ALTER TABLE `eventimg` DISABLE KEYS */;
INSERT INTO `eventimg` VALUES (68,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0,,\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ñ¯…Ÿµ‹ ş\Ç\Ñ<¦ºXŒ¿¾}£h<ÿ\0:ö\Ë_\Ø[Ç:m=P\Zn¿¥Uı‚?\ár\Ìú§õK\ãŸ\Ço\é<K¦\Øxò\Ö\Ê\ŞöH\â†\'ÀEµx­S…57Ÿ°b±\ê¸×…\ÃI$•õÿ\0†:«\ØC\ÆG\ï4\ÔşšTš\Ç\ì9\â\Í#E¾¾—P°\ÙmJÀrg¼Kş¯e??Šõ3ÿ\0m\Í}_û6x\ÓZñÀ/\Ş\ë:¥Æ¦ğ¬‹\\9b£Ë©§\ìª\Ş*:œøÅš\à£\Z³¨šº[.|%øeyñG\Æ\Ö\Şµ¸Kie™˜d\0+\èø¿`K\ÓÌ¾\'µ½6÷®ö+@\ßl˜\à‘Ò±¾:x³\\‹\ãŠ\â·\Ö/¡‚+\Ò(\î*ğ:\0x§N”œnÙ®.®2®1\á¨\Ô\ä´nô=y`i€ş\'¶\Ü?Ø©,?aX/e8|W²\Ä\Û%T@v{Jò©<ñ†\Ë\ã¦\×o‘\éö·İŒ\ã¦}k\Õ?a-WP\Ô<Y\â“uw<\á­\Ñ\ÛÍ±f\É\äû\ÕÇ“\Ú{7\rO.µLm,<\ëG~Wm‹ºG\ì[o\á\íC\Í1·B}£ğ«ú‡\ì] \ê7\"oøL\í\âv\ä…+ŠùS\âÎ§¨/ÄDu¤u	€U™€q÷®=5K\â\ßò»\îfoñ¬¥^1m(•<¿0®•_¬Z\ë±ö\Ê~Ãº;¢\çÑ’¬AûxaTù4\äu’¾)\Z½ğQ‹û¬\×vÿ\0\Zzêºƒc:…\Øú\Î\ß\ãYıe\"5ş\Ì\Ìzb¿\íÈ¿b_	¿ñY9\ï÷\ã©\âıŠ¼\"¤ŸøK\İO³\Ç_&«¨•\Ûı¡t¾Ÿ¿oñ«ª\êp5œ\æv\çõªX¨¿ùvˆyV`÷\Äş\Û\rûø1úøµ\Éÿ\0~:¯\'\ìO\àdl·‹\äVÿ\0®‘\×Æ‰«jx¾º\éÿ\0=›üjt»\Ô$u\å\Ë7_õ\Íş5R®­~D,\Ç\Å\ë‰üöŸ±§ ‹Ÿ6G_\ŞG_-øóD°ğ·‹u-&\Â\í5KiŠGr\0ù\Æ3šÇ†}FSó]\\}|\Æÿ\0\ZtÉ·9#~OS\\\Õj©¯†\Çf	ˆ¡QÊµnuò!X\"\r¸ğj\än\Z.1I—+»\ÍJt{\Õ>R+\Ò=h­N‡\áş‘c\âOiúU\å÷ö}­Ë…{†ş\Zú\ÓMı™|#l\àñ´ŠÀpRXú\×\Ä\ë§K\0#\ã±\ÏJ$\é\Ò\î\çşş·ø\×UO.\\ñ1˜:Ø©§F³Šô>\Ô\Õ?d\Ïk—\"\âû\Æ72ÿ\0x\ÍøREû ø&˜¼U2Œw™\r|=5Æ¢‡›Û¿oŞ·ø\Ó?´5\0§7÷@ÿ\0\×fÿ\0\Z\ß\ë1\ÙA)\Æ/ù‰wü\î\ï\Ù/\ÃsÀV?²\'»%Qµı“<1¦!\Û\ã	<’\ì•ñºÖ££P»Ÿ½oñª\ÇP\Ô]¹¼¸lu\Ì\Í\Ï\ëK\ëK¬K(Æ¯ù‰ü¹\ì½á·”nñ­¾3÷A_ñ©®¿d\rNÁ\×\Æj±L\ZøQ//\Ô}¦\á±\ÜJsü\ê\Ëj7ğ£§\Û.x=\Íş5K¯nR\ŞO\é‰ü¸ö]ğÕªl3·\\z²U/ødŸø’Qf|d—2›Ê·*[\ë_¶©vNZ\â|\È\ß\ã^ùû^™¾1Û¡,KY\Ê	.Oq\Í\\1\ns\å\äZœ¸¬7	Bu¾°İ¼A¹ı<\r«.˜\Ş3–+ø<9@ÁOBi²~Ä,wù“\â´<÷iñ\Ë\Ä\Ås\"¹¸Ù¸9v\éÚ§ø­ğ[ÄŸ´\"ú\ïSšò=I2|!\Ú<û\Õ^ò’Tö9£O\Õ7,Mœ»´aM\nù%ş\Ïñƒ\Î\ê¹(:œv¯•<=\à	|Gñ\×\Â\Şr\Â\Ó]µ¯Ÿ·ŒóúW\Ò°½\Å\Øø‹¬\Ç<³\È\ØY0\ÃÖ¼\Âr›\Ú&\Ê@6\ãY9\0t\ËQ8Óœ#7;øJøª3\ÄP«S›•]3Ö®`;¨Š-\ÓÉŒ\Öt¿°V¢O\Ë\â[F²µûtxVÑ¾-E–«yil\Öh\Â(\'d\\÷\à\Zù\Î?ˆ^$Œ‚ \Ô\Ó\étÿ\0\ãSV¥*r\å\ä†e‰¡\n\Ş\ß#è«¯\Ø\Ä,¡\×l$À$•óŠü?\'…|G¨\èòº<¶3¼\È8%N2+\ê\ï\Øs\Æú÷ˆş \êöš­w¨[­ô\âVp\ïzù¿\ã$€|SñNx?\Ú3\èf‰Fœ\é©F\'f_[Lğ¸‰srÿ\0]eı€\á\ßñ†\à\àel$şb¼\Û\ã\àüfñ{t\Ú?\Ş5\ß~\Ä^0Ğ¼ñú÷^\Ôa\Ó\á6l©,\Ç\nI#½z÷‹¼ğ\Å~\"Ôµ‹\Ï\Z0»½™¦“Ê˜ú|´Ÿ-J*7±\Í[ğ™¬\ê\Î-Å«h‰L; qõõw\ìŸ\â\Ë\rKÀ.ø|f[=gWFkC)\ÂHv·>¼V…\ß\ì\Ûğ·\Æö7>ñy»ñ\Z\Æ^\Ş\ŞYAYx\é‚µ|É©i:×€<H\Ö\×I.›«X\ËĞ’\n0>¿…c¼3\æZ…\\Eâœ¨-$µW=³à¦±À?Œ/\'‹a–\Ë\ìªğÈ¨™>‡±¯~¼ø\ÑğT\Ô\æÔ®ôÕšò\à\ï’I-I.}\ÆkÉ¼;ñ7\á÷\Ç\ÛZ|I»m^\Ó\Ô*\ê0)h\\`\ä\àó\Å\\_‡Ÿ\Ïÿ\0	\Õ\Î:wÿ\0\âkªj>\ä\ì™ó¸\Êp­Y\Ï)­.\ÇWñ\ÏöŠğˆ>\Şø_\Â\Ê\Å\æ*‰Ã±\"²MVı€­A\×<U>\Ñò\ÛÆ¹\ï\Ô\Ö$>ıŸ¶ó\ãk¦Sÿ\0\Ä×§|(ñ·ÁOƒ\êM¢ø¥§’õT;\\I\Ú\0ÂZ¤ÚŸ´œ\îs\ÖötğU0˜XJòw\Õ>\ç\Æ\È‰~\'9\Æu	°\àf¹q\Ç\é[~8\Ô`Ö¼e­^Û¸’	\ï%–6Á\åK+\Z?Î¼‰k&~†„£B–È±*®\Ò9÷©bRÍƒõ¤†—Œ\îa\é[:~…-\È_›4‹””U\ÊbÙ¦lC=ñÚ¯Zi’\Êpc\Ï\èøe¨k2¤V¶²\Ï#@s^ÿ\0\à¯\ÙJúTŠmY\ÖÁN	Œ\ÎEtC:š38\Ã\á´r\Ôù‹Nğ¼Ó€@5\Ô\é.\çÃ‹f#®@\â½S\ãw\Ä_†¿³¢¾g\nk¾,\n\Å3n\Û#‚ø\êz|¾õò/ŒjMo\Ä÷,M\ébFbeQÚ½a^ó>KÄ’“µ(ŸJ\èÿ\0\n§½eUkD\'\ŞÊ«]\æ™û1k7°«©²1·ñ,»‡\é_·ÿ\0|Ww\ÚR\ÆøÁŒù»/\ç]—\Â\Ú\âÇ…ux\ïtIe‘¸%ü™·e\ÈùO==qZº4\à®\Ï+ûSˆ©­|º\í¿eÛ§¼kS}b.£P\íc¸)\èqZöV¿ b\æ\Ğ\çı\ïğ¯B´ğ\Å×‰|{£ø²-^\Õ%†\É\Z{H³³qOº­üKóVÏ€üYÿ\0	Š¼e´M•\Ì1ªÉœ+;ÀüE•-\Ñ\Åı«ŒO\â<GPı•õ˜˜¤\ç\Ñ[\É\ê_³§‰,ó»M\Ş1\Ö3º¾\Ìiˆ<Ó–\ä\0sX¸\Ó\ìt\Ã8\Å\Çy\\üú\×>\êZ~V}>H9Ü„b¸\İG\ÂsD¤y@\\W\é¥\ÄŞ®&†9Pöu¹-o\á7…µ\íş~œ±»?-b\èÃ¡\ë\Ğ\â)Áşò?qù©y£\Éü\È	ôšÊ¸´ò\ä\ÎÎ•÷7Œ?ex\åF“G¸¢ˆó¯\0ñ·Á­[\Ãò\ÉÕ‹ÃŒ€p0~†±•CT}V:¡‰÷o©\á…\Ê3Š\0ô¢IOÖºmC\Ã3[)^ppF+k™b¹ùlõ=\èN3Ù”fº\n#p+Œ\Í{\ç\ì(ª\ß\Zr\ß7ú˜·\"¼¡1=k\Òÿ\0fßˆºWÂ¯Š\ë\Z´\Ï\Ù\Ş&uB\Ø\ÎjÒ›Qª™ÅšBUpU!wfişÓ©ıŸñ\ß\\•Ur“¤˜õ\ã5\ï–_¶€nô>\ÛZ\Ñ.®n!…Q\Ñ\í\ÖEV\nÛ“X~7ø—û=xÿ\0^›WÕ¥¾k\é@ñ\Ä\ëœ{m®V}Cökgÿ\0½QI\ë„ş&»e\î\Í\Ê\ĞøùS\"…*u\éJğ\êz%‡\íğ\ÇA–I´¿\\Y\ÜH»K\Åjª\Ç\ëƒ^\rğ§ÁŸş&M\âXA\Óô³}s{?\Ê+nÛŸ^•Ö‹ŸÙ©qşª+Tş&¸OŒŸl5=<\àH™\á8±¾CÄ—-\çÒœ\ê+\')\\\ß…\år§‡§(¹n\ßcö¤ø™añO\âu\Íş”\ì­c\É#\Ó÷‡±¯ò1\ç¾;W§üø%©ü[×¼¸?\Ñ4{S¾öıøX\ã½ø5\î²h¿³6†\æ\Æ\ãR¹¸¸€ùrJ›\Ø3¿\Ã\\\Ş\Í\Õ÷\ê;ú\ÇSÀ(\ái\'\'\Ñ\Ç\ì˜ø™«¨\ã6ÿ\0¯ø\×O‹>+\\5ºÿ\0¼kìŸ‡?ÿ\0gß†z¼š—‡õY­/eŒ\ÄZH\ä ©ü+\ã/Œ\Zå‡ˆ¾&x‹S\Ó$ûE\Õ\ã\Ë‡#p\'®+y(Â’1Á—N¦#V´ \ÒhŸ\á_\Âo|[Ô¦°\Ğmc¸¼\Öóh\0s^\Åiû\r|F˜){{(ğ \á¥ı+gş	\â†O\ëN:‹\Ë\æ\Ê|Røÿ\0ñLø‹\âK_\İÁio¨MQ¡j‡ÀŠ\ÍÓ§JŠ“\îk‹\Äckã¥†\Ã4”Q¿/\ìŸñá¥¬¾*†{k94\Å7¡˜\ïy®\ÓS±\Òÿ\0k…wºôPÇ§ø\ßC‹÷ò*Œ\\(\äûŒ×¡ü-ñV©\âÿ\0\ÙY\Ôu›\Ùoï¤¶»<\Ç\æ ^aû\r‚şøXœ2r:ga®\ÇÅ¨\ÅY4xOZ¬*W¬×´§$“]\İYYÁ8e$>¹4\á!Q\Ãõ«›Eõ\Ëcƒ#uúš®sÒ¼’“±úZ´Ò“ê‰ñ€\Ì1\èzÕ…\'`\ç¹ª\èø\íV-\ÃHv9ª²\Ği.\ÄÑ¡rJ’\Ã\ëF\ËL–VÀB\Ù\ì*æ‰¡Iw\"ª©\İ\ë_@üø¨ø\ÒX\äh…½ˆ?¼¸“§\ĞqÉ­)\Ósv‰\ä\ã3\n8:|\Ózg\à\ï‡wz\Í\ÂAoi$Ò¹\0*)<\×ÔŸ\red‰!¹\×\Û\È7Ù£cõ5\í~øs¢x\Å\"°·C>\Ü5\Ã»{ûWF&;¸=kÖ§J4—v~cÏ«â›…/v%]\ÃZG†-\Ö\r6\Æ+u\ÕF\ãø×‡~\Ù_´ıŸ\ì\ßğ¾k\ÈdŠo\êí´›v`X60e#û«¾µ\ï-#H\ÛGœ\×\âgü_\â\å\×Ä\Ú7Z²2\îÓ¼?#é–ˆ:(SóŸÅ«¢”¬™m\Éó3\Í4­W\Ä?üs¸ºŸPÕµ+“ºi»»7$’{W\İRü:ø]ûü4·ñ\'\í­üE\âû„e¤\Ü\áW#ƒ´\ä\íó\í_Ÿ	¾$]ü.ñ}¿g\ËslIX›\î·Ö»¦\Õ<gûY|M]C\Ä\Zƒ\Í(\Z\ævÈŠ\Ò$\ì\\t­fšw[\ZÓ=’\êuZ—<kûLk7º§¨xnÜ²\Û\ÙX\Ç\å\ÄdP1¸Œšú‹öLıœ\àøÀ·\ÖZ·ı›¥\é¬I¦\æ\á	lg!FpM|Á\âohÒ¦°\Ò\Âò\ÒA¥Z\Û\È\Í)l|\ï&:sÛ½};û\êš\ìûf~\"üDK\éuMf\×\ËiÔ’–Q\É ò\âXò2Í€Oq\\ª”«Ë™ü(ú:˜ªyf’‹ı\ëû]\Ği\ît\ë+_X\Ä (±\Ã4c¦\Ğ?Ÿz½¦\Í	’+„¶‚\ÑYš%ˆY\Ü>½¹õ¯<ºı >-¹\Ôg\Ö\à¶\Ôo\ZKKk		\âi•sµW\Ô\äWÃ¿oÿ\0‰_n¬<;¤Zi\ÖiÀ\ÔRxKIq|ù!\áH\è\Ì:ö§\Z”œš\ĞùU.}^\ç\é\É<aS\ïMcŒ\ãšño\Ùsö”Ò¿i¯†ñø‚\Î#aª\ÛH`\Ôô\ÂAû<Ş \ç•n£\ë^\Å\æ8\Æ}\ë	¦¦Ö²-G!éš“<\çYr*C!\ì3Yİ‰$GS\×5VûNµ\Õ-\Ì–ñ\ÜF\İU\Ô\Z°_#­FsT¤\ĞÖš£\Æş ~\Íúfµ³\è\å-¦<ù\ÖúW\Ë>=øS¨ør\êX¯,¤€\ç€Wƒ\î\r~…¿Š\Éñ‡tÿ\0\Ú=®£l—2\à>eú\Z#=\Ï›\×\Â4›¼OËWJ–Õ˜\Ê\àzW/qY\å!¯´~.ş\ÎwZLS^\ékö»’T}øÇ¿µ|¹\â/\Ïc3C…\ÎH®\n´\Ü4?L\Ëó*8\ÈsE\êq$\à\å†O½C.\î¨«W\Ö\ï¤vôª2-\Ç®mú\â³\Ù·\ÌH÷\ÆMtÿ\0\r¼\'|q£xv)<¦\Ô.fC\ÎÑŒ“ù\n\æ\"NNk\Õÿ\0f#ã¯„†9ûQÿ\0\ĞMmI\'$™Ç›§†©(\î£ø\Ûñ‹\ÄQø\"m+à§‚Sû1g1\Ã}¨/\ÊÒ—À\ê?\ZÍ¸ÿ\0‚~x…q·\ÄZ<\èG\ãÖ²ş7?l»\'ûBÓQ¸W}ûxxŸY\Ğ5\r3Q»²$›¾\Ï!\\\àûWµ\Æ\\\ÎQ½ƒ§*ô\çB–\ZJ2¨®\Ûÿ\03ƒ¹ı|^l:¾™+ÜŒ\×\Í^4ğ•Ï‚|S©h—¾\\—VS4R4G\åÈ¯©?b_ø‹\Ä?%´\Õ5»\ÍF\ØY;ˆ§”°È¯\rı¤¢eø\ã\ãÙ¾sÖ¹](T¥\Ïc\Ş\Ëñ\Èc\'†¯$ùWC\Ù\à9>\×yÿ\0—\ë\\3ø»\Ãø\ç\â\Û\Ï\èg]±k\Ù\ÕaS÷[\Ì<\×sÿ\0öe<\×8ÇŸo›\ßx³öLø}¯x£U\Ô\î|{´—w/;\Ä$\ä,rG\Ş\íZ\Æ3öpqg™Š\ÄP£™\ÖX‹Ù¤½\Ôÿ\0C’\Õ?l?Â¼\Õ|+\á\ï	Ë¦Y\İA$(¡€T,N*\ç\ì=ƒÁ?ØŸùs#Ÿ÷\ri\Åû&|+´\'\Ìø‡ışŸüz½\Â\Z\Ão‚\Şñ]¶\â\ëMB\çPµ“w™p™û„\00j­&ù\ç5¢8k\ÖÁ<;£ƒ„¹¤\Õ\î™ù\ãq&ng\Ü\Øı\ãcó¨‚óM$Ò«LüŒ3Æ–8œö\á·\ï³ôŠ[\ìZŠ#!®«\Ã~’òT\Ä|\Õohm{*\r¤\ç®k\ì\Ù\Ï\à\0¿kZ\Ì;lP††)™{şU½:^\Ñ\Ù\ìy–cOIÉ½FüıœÎ´°\êº\ÔFeğeÿ\0\ëW\Õö¶\Ö\ÚE¤VÖ‘,ñªŠ0M\ZCk\Ã\n,q Ú¨£\0\íUel¿¨¯[İ„yb~?‹\Å\Õ\Æ\Õs¨şC¤œ9\æ£\\g\"š@ô¦Ll-b¤\Î7‰(8\'¡>µüş~Óš&©¦üiñöŠ³ÜR\è;\Ûÿ\0-[ùƒšş‚6ó\ÆA\ÇWÎŸ?cŸü^ñ)×§ZjS\ä\Üù–\ÂD‘¸ùñı\î:û\×U9rû\ÂJú‰¾ğµ\ãv\ÛJ\Ñì¤½»¸`©\Z©\Æ\r}ñ\Ö/Ù¯\Âv_´I•¼Ksn—:\å\äg%Y¿\å˜=°~‡\èÿ\0>ş\Ív\ßXY[]x†;YfI¥TA\ZŒ´¬?…F=\É¿ş&ø¾ÿ\0\âµzúyn¦¿¹yŒ¯Õc§«ŒY[¡\ÕM{óu9ñrc™eBDˆÛ•ó\È`x9­O\Æ\ZÎ±$_n\Õ\ï/|\Ç\çNÌ¨GB\éX\Æ<\'¡ô«\Z^—>©uF\Ì\ï\Ü\Ít·Ê´9\\§-^§«ühø\Óÿ\0Løn\Ò\ÚÕ¡´Ò Á˜&r>y	\í\Ğ`VV½\â?|T²\Ğ\ìî ›R¸Ò¡{x¦1’\Í…s\ß¯¡?g\ßØ«Yñ\\vú•şŸp³ò¼ıkôO\á\'\ì‘\áO\n\èq›‹5{—Q¼4 Ç­sK\Æ\ê1J\íŸŸğL½cÄŸ¿h\ètkû;‹]3\Ä63ZL’)\Úe\\:6=¶‘ô5ú\í\Zg–\Ï\'\å\'Ò¿,¿hoˆ¾!ış>ß§‡ç±‰ô©ü\ËH\0Kg©ô\È$W\èÁŠ¶ş\Zh~-³m—R‹|°+gÉ”p\éøú\Ö6¢œyR;ü\äñJ@‘œ\Òù˜\â¹\ÎvLT…8\ëQF\Ä7\'ŠB\ÇhO¼:bÜ›pn”Œ\ç¦Ò›#\íh\ÅYC) Œƒ^ñ£ö¶\×\áŸS\Ñ!t~i-\Ç½\Å{`—Ş¤IFz\Õß™Yx|EL,\ÕJn\Ç\å\ïŒ|>™s\"<nŒ§#k\Ï/lŒLÁZı\"ø\áğF\ßÅ–R\êº\\*š‚.^%Qû\Ñ\ëõ¯…ük\á9´û©’H\Ê<lC)ƒ\é^}Jn›º\Øıg)Í£Œ‚\î6\ÚF\ïA^¥û2\Ê\á{x?\íû)¯3»¢gR9\Øü	ñ—…¾,xgT\Ô\å[K;­óLım#5…=&®z\Ø\ä\êa*(\ê\Úgª~\Õ\Z“øcö›Z‰<\é,¥·¹X»1^p*\é5ÛŠ\×Ä‚3­x\n\Æü¦v[v>™¯Iñ\Äÿ\0³\ï\Å\ßÏ­\ê)·[\ç–} \àzW\'{ğ‹ös%?âµ‰I\è~\Ö\r{n3r„ôg\ÄQ©…*p\ÄĞ—<U®“9Ÿ\Ø\ÛZƒ]ı¡u-BT°\êm£\é# ¯ı¥›ş/—‹ÿ\0\ëõ\ë\ìÏ€¿>x?Æ¢û\Â>\'‹U\Õ *\Ç\ä\àsÒ¾2ı¥e>9øÀ2±?n~\Ô\ä¥N÷\Ô\î\Ë+*ùGN-.U¹\ë¿ğO¢£\Æ>%`3·O?Î¾iñ\Õõ\Ëx\Ë]-<˜k\é°7Ÿ\ïšúkş	\á_ø¡ûı‡¿Ö¾cñ\éÿ\0Š\ß_c€>\İ6ü\×%T•(3\Ó\ÂEO4®¤¯¢1„\ÓHÿ\0÷Ñ©¼\é\n‘’G¹\æ¡gÒ–27d\Íp¤}J§M}”Z…‹¯<“\Åt\Z˜nePC`zV=…¿˜\ê¸\È\'­{Á_†\×^0×­l BKœ–\Ç\İ^\ä\ÕFŸ;±Á\ÄCM\ÎZ$z\Ç\ì\Ùğ5|Mx5=A?\âUsÿ\0-µ}›PX[\Åº,0\Æ\" À\0Vw‡´+O\n\è–\Úmš†À\Æ\ãÜš´X5\ëi’?\Çbç¬\å\'§BÉ”Á\Õu$±¦\ÏJtgq9¨Z³ƒmG\àÔ‘uÁ¢3M¹-¡’ilq©glg\0zU5b[oBvö\ç=1\ÎkŠñ¿¡Ğ®!\Ó4ø†¯\â V\Èp\Ò\áQ}k–›\â^½ñi,ü\rb\"Ó¾\äš\í\ê\íT÷@q»\é]/„ü§x\n\Ò\ê\ãÌ’òş\ã2\Ş\ê×‡2\Èq–\çøW¸\Ú:#\Ï\'¯c\ç\ï\Û¯\Ão\ÙÇš–§sö\ßkv\Ëis|h%ˆ(\Çd\0×©¯\Ç\r:kË„XJ\ß.H\Ï \à\çğ¯¾ÿ\0\à¦?\Û\ÅxoÁÖ ›B\ãT–s\å…1Á¸v\İó?\Ó\ä²¯\ì\ï¨üGñ¬\ÓB^ÍŸie\0‚=ı+²šöpĞ¦¹\Ùõüûö=ğ\İßƒ\Û\Æ~.\Ğíµ‹©œ\ï#\ß`g,S£v\Æk¸×¿b¿	\ÍûJ&§£iÖºe¥Å’]\İiö\ËòB\à…bøCp\Øõ¯«|3 \é¿¼m¦¢\É­·š¯*ô\È\ÏŸ¼5=ö¹¨¡}g[›\ís´˜\ÊG\Ò8Ç°\\W4\å);!\Ş+båŸ‡\ì¼#¤$V³Cam#S0ù	\è2}\ë;\Ç\ßôÿ\0…:$·Z\å¬\é&\Ò-º—K©\0ÈŒ\Äú\Z\ê<e\àûOxfÿ\0C¾I\Îö-’m®9\È*{@®WÀ~\Ôô?i\ŞñUõ·ˆ\îlù7m>RŸİ†\\÷§\Ë\Êe)sn~_ø›á§ÿ\0jŒ\Z®³—,Fi\Ìû&	t›Jıøğ |øa¤xLLnM¦\é^¡\ÎXşu\êB\Ş+x¼¨a\ÙX\ä¬Hg×Š‰¦O@n\êÌ±œ\ç~ÑŸZC ™›aÁ\É4öû´‚Dq\Ç\æi$ÁA Í¦…GÛ’Ni%~z\ÔE\êx¦¸\rßŠ¶Á¥sP*_/\0\ä\ÒF«bPûW9\àW~ÑŸ\áÖ´Ù¼A¥[´F¥®`ø‡÷‡½{\Î\ìñJB2`X`‚8\"´\Òk–GFS	QU¦ö?\'üC¥ˆ\åq°¡\îš\ä/\í°K;	\Å}}ûR|ÿ\0„gR“UÓ¦›xÛ‚¨#\ã‘_ø˜\Ü[L\ê]\ÆO5\æU§É¡ûfUŒ†6”j\ÃÑœ¹il\ç-°I\çŞ‘\æi\Îd\'#Ş†\Écœş4\Æ\ë\ë\\Ö±õ.½\ì}1û+\Ü||\ÓÂ’|»i\Ë\Ïğ\Z\ç?j»³§|}ñ|$gı,¶~ WOÿ\0ø”\Çû@Z¨ùC\ÙO“\ï´\×-ûe†öŠñ_*‘\Çû\"½z):\Zw>%\Èò¤Z·¸¿3\İ\à1\ç\Ä>**~Qf?™¯–ü|Á¼m¯ÿ\0\×ô\ßú¯©ÿ\0\àC:·Œ¸µQÎ¾Rñ\Éÿ\0Š\Û_\Ïüÿ\0Mÿ\0¡šš¿Á§ó9ğ\rÿ\0kb’2”öR?\Zš\Ş2\Î9\éU·\åxú\Õı*U“\\\r\ÛT}]ô\Ô\ë|!£5õ\Ò(\0\ä\Õú%û8|5Á^R¹‹n¡|›°Ã”N\Ãñ¯™¿f†#\Å^*¶icÍ­¶Ù¦\'¡œ~&¾òm± 0Tm\0€p+Ò¡ó>§\å<G˜:“ú¼¨¯.\áQ†\æ’ d\ïC|¬V\ìø»X‘~cŠtj@\Ïjj¾ÓœS¢9zb´HÍ¶KJYc3\Å$yÀe+»\Ó\"”&\Î:\ĞŸN\rU‘;™ú…o\á\ÛL±b·\\`\'\×Üµ\ç¾.Ô§ñ¿ˆ“\Â\Z\\\Ç\ìP:É¯\ŞBü\"g+l÷Ÿ>€Vÿ\0Ä¿\ßiVöº>ƒ\Z\Í\âm]Œ(\ßv>y\ßı•úšñ\ïˆş3ºı•%ğ³E¦A\â}W2E©\Ï)\Ûv÷ªCô;Á?)\à`b¦§RV‰Ò­I{Ij\Ï$ñŸ\ì1qñ?\ã¥\â]]§Hga“\"ü›y\áU@\0W\Ùÿ\0¾x{\ág‡\í\ìt‹x\Ú1–™b˜ã¹®{\áOÆŸ|d@t\Ãôy7\Zmğò.c#ıŒ\á‡=E{U\0\Ç\ÕiGİ‘Ÿ´S†n¹b·«J¢Hƒda•>™\Å[\ß\äñP\êóypü¼·j­¿D€ù¿tF:“şŠQ»\ÔN\é#NY¢µ·ódp¥e<\ë=\Ôò)\Ê\'¥yw|s¬h2\ÛÉ‡\Ù¶ö¹H&;Ø¶?ƒ­|SÒ¾ B\"·-c¨Æ›å°œfÿ\0i?¼§b°uÔ¤\Ó+Ùµeª;I¾\é\ç9ªL>n9©/.D\ÒJÀ€‹¿\â›Ş‡\İlŸJW±\'Ò™\å\æ¦e\ÏN)7\Å\"bDŸ*h)$nqŞšƒ PP\Ö\àñ@lƒÒ–E\Æ9¦Ed8Sƒ:ş´ÀÆœ2E-€•d\\ôıj7\äŠZ\\\äQpf7Œ|%m\ã\r]\éj®²¯\È\Í\Õ[±¯\ÌÏŒ_®|1­^ZMÇ…ˆ`Â¿S‘°Ø¯›?k\ï†q\êzd^\"¶ˆoP\"œüğM*‘ö>£‡³„\Ä{)?v_™ù­|­2mÀAœ\0I\ë\é]w‹´“et\à)\ÆL1r+\ÊzºRš©\Ñô¿\ì(_\Ú#M\Ãº\Òqøª?¶ªcöˆñ®|³ÿ\0Ó¿`Y<¿\Ú\'Fõh\'ùÕ¿ÛŠ\0¿´Fºq÷¢ˆş†½l?û¿\Ìøjºgrÿ\0\ê{ü·\æ½ñ›z[ ı\r|›\ãg\ß\ãpú\Ş\Ìzÿ\0¶k\ëø\'xO\Zœÿ\0\ËşF¾GñƒøJõ¼\æò^\àf³®\íJœÿ\0…lG¢(ŒNk®ğ}‰¼ºO”Nkƒ\æu^¹5\íÿ\0¼(úÿ\0Š4\Ë4BL²¨\àgõ\Éy${X\ÚÊI³\îÙ¯Á\á‡ñ]<{.u\0$9\ê\nõ	X±¦Ánše½œ+¶8#¨€SA$dõ¯R[$~Z«¯VU%Ô± w¡†\æŞ¡Q´du \È}ZÌ‚|Ô¨\0æ¡ˆ–\à*L“‚:\ni\ØÈ°¸Vv¿­\ÚøsK»\Ôõ	6‘4\ÒI\ß\0t÷ÿ\0\ëÕ‘.z1Ö¼\Ï\âH>6ñ¯‡ü¤µ‹\íM_o?ºC„C\ìÆ©\Ê\æ”\ã\Í/CCá†“{©½ßŒµ¸\ÌZÆª€[@Ç‹K@~Hı‰\ê~µ\ç¶Ï†µ\Ï|?ğ÷ö“s­\\Xj_kš+U\Ü\ÑÃ°†8\ï\×\ë_Bˆ\Ñ@\Â\0 µx\0€U­\"#s}4œ &\ëù\ÖøirTRYsÉ³ò\rJH\'Y\í.d´Õ¬|3#\ç·`zv+ô5ö7\ì\ïûj\Ï1³ğÿ\0\ÄYU$‘„vúù]ˆÍŒ˜ºÇ nœ×¸ügı•|ñ†Å¦¹\Ó\ÓE\×HÜš½„*’\î\ÇG\ÇN¾kó\Ï\ãÁ|\Õ“\â;Aya2b\ÓU‚6û<\àñ·\'\î7û\'>\ÕôR,RjZ3š/SõCU¹[”…\ÑÃ¡e\åyOLÿ\0Zl¹eV<ñ\Ç\ìgñö\æv‡\áß‰®\å•$Œ\rö\à\æE\Çß·rzã‚½\ÈÏ¥}}9–Gb\\d/§¯\ë_;Z—³f\Æü¤xÿ\0C:n«óğ6Ù¢9\È*z{\rx|}\à\'¶m[Ì¼\Ò\á”Ig®\Ù²[¸\ày€r¤ı\r}=\Õ]\à\ê\à4–	~Y#”eXt ƒÚ¸gmM\éVt•ºA\àÿ\0‰÷#\ÃÚ“xú\Ö\ãI±(SYÁ\Ì\È\Ç\åYT\ÏQ\ÔW«[jv³\Ã‘\Ü$°H¡\ãh\ÎC:ğ®~\èv\"\ëLÓ„Xj\Ñ\İ\Ü[·Ì€\0O–ƒøTâ±´\Ï\êQZı¾\ê\ÖHZşca¤xn\Üòˆ\Ä	\ÇsÓ ¬Ô¥Î©ÆDœW’ş8\î\âƒi‘¤\å@\ì) ¸77²F¼¢.s\ë\\î‹¯X_]\\\ÙA¨\Û\İ\êp\Ì)&Z<r@zñ\Åtzlk@/–ùU§stù$ğŒ\Z…ÜƒÖ¬\\\\G\Ñ!;j‰²\ÇwcÒ­\ëkÙ¤®G/jW5+\à÷¢5QTf>”¬v\n”…`zPX\ÏJ\0#­9XS¤\\(€óT¼K¡C\â\ßé“¨t¸Œ¨ö8\à\ÕÀ1R£gƒúUE\êM\Ü2\è~Tüdğ¤ş\×o\í¤BZ6\r\ìz×†\ßÀ\Ë3gƒšû\çö\Ïğ4v^ ]M_\Æ[ \×Â ¶ò®d\àO¼\êñ\å“?z\ÈqY\ÃBM\ì{\ì.\Ï\Ú7@Lg1Mÿ\0¢\Ílş\İ\ÆB\ê\Ä63m	ı\rsÿ\0°‰\Ç\í\áòz\ì˜\ä3]W\í\ß\n¯\íØ›(	ÿ\0Ç«·\r+P·™\ä\â³\Ço\äıOLÿ\0‚w§\Üÿ\0\Ï¡¯üZvø«Wÿ\0jòl\ßf¾½ÿ\0‚u\Ä™\ã‡-\à&¾?ñh?ğ“\ê§ş\åÿ\0ĞeˆW§p_ò5Ä¿At›s4«H#>\Õö‡\ìgáµx¡µ£³ˆ¶}\ÈÀ¯¼)rp\'=\ëôWöDĞ—Nğ=\í\î\Ì4ó\rş\ÈŠŒ4—1\ÏÄ•ı\ZQ]]o™şaŞ›¸S.d ñ\ïQ+nú\×c\Üü–;\0ÊŠŠQ€T±©\0T”J£S‡Z@9 ©ÊœS[™*8\Æ8¯=ğe›Kñƒ\â¥&q‹;d…V\æ_Î½Lmœ\äz\Õ]+I‹N[’‹Ÿ´\Î\×2Õœ÷?J·\\d\ã2Ó¸‰	8ØªIÊº\ÔAa#p\ìO\\š\çd‰î¥µ¶UÌ—\æ?\ì¯8ük²…NFGëª5«g<´Ğ˜®\äæ¹¿ˆ>\Ñ>#ø^óAñ’_\é—IµÑ‡\İ=™H\äpA\Òõ¦¸öÁõ®½†\'\ä÷\Å?…ú\ç\ì\åñ	l\Z\áÙ–\à\ßø{XBI•coº\ç}rÁ¯»ü)ñJ\Ó\Å\ßü1\ãX\Û0]H–\×còİ—&ï£ø\ZµûHü\"¶ø«\à[½\"V[{\Ìô\ÛÒ¿ñ\ív¿s\'û­\Ğ\×\Ì²Ÿˆ/o<?ñ+á†¥“ªAi>£ğ³¦ˆ?\àA[ñ­ªµZŸš:Ik4¥7t\à\à\Ô[òk\Â:ô^*ğ†­!—ö‘\Î6ô9ş Ö¶G 5\àµgfZW,\éñy÷rç€ª¤zş¨k^±ûZjmo^[B\é¸ù£V\ë·\Ğ\æ´ôÃ¶ñ\Çsõ¥\×\Ó:|§¾:z\ÓN+¡\ÙIò³\äohWşñK¾ªaI\ÉÓµ¸8 3gGF\ïœ×®x\Ç\Ó\Ü\Ù}ŸU¹€^C½\Å\Ø;D±ƒ\Ã\Ã\0ò=Ez^¡¢\Ú_\Ûù76\É5½\Â\å‰\Ô\Ù\áş/ø%ªø$\Ë{\à¶ûuª†yt{‡\ËÆ¸Áò˜ğzı\Ó\ë\\²„“\æLô½¬+.Y\è{}I\"Fu¤•Ô‚¬=Aj\Ã}\Ò3Ò¾]øeñoÛ¥‹+\Ïanÿ\0¿Ñ¯˜ù‘g®\ÂÜ©‡J÷\ï|B\Ñüyo#\é\×\0\ÏZ\Ê6\Ë};zP«h*øy\Ò\Õê–\É\'·µ+ÒŸ\"œô\Åp¤\âºN1S•\ä\â—â¢•·¯…RTq@66œb˜­z\n:RPCri\Êø5°R©\rÒš¹\äµ_†F¿ğ\Í\îQKdûÁ\Ç8#¿0|mbb½óŒ\×\ìô¡¬ø#Y³eİ¾\Õğ=Â“_”?,M¥ôÿ\0.\ÖsX\â\åLı/„q\rFt¼Î£öb?iÀ%ÿ\0\Ğ\rv¿·Œjÿ\0´\r\éÁÿ\0?öj\á¿b91ûIxd™ô[W{ûv\0~>İ¤ƒc8ÿ\0zµ\Âÿ\0	ß¹\ë\ât\Ï/ı\Ï\ÔôOø\'k Ğ¼pY€9?\ìšø÷Ä®\â=[i\ÜV\î\\õù\Í;\Â<E\àCy‡«K§­\äf)\Ö/\ãZ\ÆY\Zi\Ü\îv9-X÷5\Ï:œ\ÑQ¶Ç§†ÀJ–2¶)½\'c¼ğD>l\ë\Âñ‚A¯\ÓO€¶_ÙŸ4¤ÀPÒœZü\ØøyJÀ\ç_¨¿­E§tH—\0-ª*\ß\í|W\Ô\Ö5nÍŸZ\"%h™ƒ7©W\îÖ‡\ç\ëbÂ¾G526W« ùjH\Î\Í!’e”õ\æ¥G\Ç^jõ’`q\ç¥s&ø±\àÿ\0kz~‹¯x“N\ÒõKñº\Ö\Ò\æ\\I(úv\éŞ´Qw2:\Ö`H‚û“À«1‘äƒ´g2+”ñw4\ß	xJûÄ—3%Î›o( p\ßh~È§¹\'¾)´ø¹ñşGˆ¤ñ\ÄA¢Z¬	}gi¢Y@·l$2ı\à\Ìq\×5M;Ø¸Å³ôKo;\Ä9\Æ(úMu‘Î¡9É¯ıœ<U{ñÀ\Òë—·V\×Óµ\ÓÛ­Õ°\ÂL‰8\êMzËºD…\Ü\áS]ôö9g«±pJ	<b”¶ú­  e;\ĞôoZ‘d\ë\ÅlKŠºÍ‚j–Ú¹*²¨qÁ|3ñkM—\àŸ\íM\à[¢&›\â+„\Ó5\\\r«ö‚rnÿ\0}6¿\ÔW\Ş%ó;\Zù\ïö\Æøi\'>\ê\æÔª_Xª\êv²c\î\\Á–Sø®Wò§§«±o\à‹_‡M¥\İı‹ª_\é¼ÿ\0\n\Ç1*?\0Â½\ZIR\Ş’FTrO÷ó§\ì{ñj\Ç\â‚üU{m[»e\ïM£¶×ŒIjIwpx¯|¾Š\ë\íQ[I\än…¸Gvş•\å¸73{3WB¸\êy$‰Ã®Ğ«Ø°õ.´]¥µT\ÈL››6µ¤t\ß2\ĞF|¸\Ü(ò\Ş!Œc\Ãz\Ò\Ş\Ü\Ü\Ëòª¢ªB*r§m\n§;»Ôµ+}?\Ê¸\ÏE@>f=°*¥·˜\Í$÷\0‰%`Ê„c`\ì\r>&V–uW˜€2G\İ‚œ0\Ã?¥`Õ´fó•\ãÊºuñ;\àñ\rÎ¡o3h^!EÚº¥š\0\Ò\Ë*ÿ\0\ZıyªŸş\\xµ\'ŠMB%1yÑZRÜ³±\í\ì;\nõ	pª\ÙÈª\Şa!xè¸¬\ÜSwZ¢‡²\İiIbZ£v%†>\ïzV}\Ã\è\n[Ú¬\ÈUw{ŠpcJnÒ½³ArJ@9\Ø\í55#t¦€†€!’2zsJŠc5+)Jf\Ò{\Ò³\Ç\ç\ÚM\ä<l§ñùiñ\ëMzş£\Ü\Æ\ZıO_\å_šÿ\0´ı‡ÆºÊ\Ü7?­MUxj}—O—(ùW\ì_46Ÿ´Ÿ†LÎ‘©y@f8\ÎP\â»_Û“Tow\ÂU\Ävp#aÁù¸ık\å\Õ\Ô\ï4h]\ÙLö\×0¾\èæ‰¶²QQ\êz\å\î­{-Ş¡<··r¼\ÓHK1ú\×-:Êœ<\Ï\Ò\ê\åN¶7\ëiı›\Z#ó\ê*{yˆ”b©Œ\î\'##µ[[\ÌROSùW-\Ú=\ë³\ÕşŸ2E$gcó¯Ô¯/—\á1G\0[ ğùeğİ¶Ì¡˜\ã#ù\×\ê_…\åó¼+¥ºüÀ\Û!\ã\é^­\î•qZ½Hú²\ÑC‚sO„\äR1õÈ¥LT|*Ø‘f\æ÷©Q·Œ\ÕVbI¹©Á!8\ç\ØPm\Ä\æb ³UGs\Ûõ\Å~tş\Öğ×‹|m\ãkW\×ú¾›4V:\\\Ğ\É\Ë<`b ‡øw1\É\í_d\ßüp\ÓbÖ¯ì¬´­KSM>S÷Qª%ººŒ¶N:W\åg\Ç‹+\ã/Ï¨Co2\ÛA;\Ì\ïp<\Ôi\ZBÀ€=xZé¦›i»\Ô\Ôÿ\0…Å¨kGMŠ\ÆmFoM \ß\Ì~\Ë¦£\ÈS\Ó\ïMiü4\×õür>ñ3X\\\ëz”\Ñ\Úıº{qr\06…8\Æõæ¸½KÃ©­Á‰¼G®G£^5º¼6¶±ªlrª\Ø#–ô»\ß\Ù\âm<Cğö\î\r!\Z}C\ÄVÑ¦¬¯†\'q$ûÇƒ\Û5¦—6š²º?[~x\Ãá‚#ğÖ˜\ÂHl§”™¹˜‚\Ç¥ws·ú;|ª\ÇCN—K†[‡‘còœõtùI¦I¦\Ü*‚·8\Çğ\È7gùVş‡“ö®s‘kƒH½ò\Ée¶vÁVÿ\0–g\Ô{WQ\âR\Û\n°\n¾œ\×;¬xvkõ)$vó\ã¸~•\á?iHşiÚ‡ôxüK\â+E\ÄVV÷Y\"\ÉÀ9,Àó\Ğu§\ÏÊµ:9y´G¯|^ø\Ó\áÿ\0ƒ>¸\Õõû»QšH\Îfœ\ÑW\ÓÔ~oşÑ¿´O>4I§\ßXj­\á\İ\äa4H\\«¢ò7H\İ=rp+–k¯\ÚÄº½\æ²Úµ\ï‹\ä‘R\é&¹f´µ‡\'€:*‚`:š\Êø­­h\Şñ‘¦\Û\Â5û+HcPA!kœ`&\Ğc	\\³¨\åğ”\é*z³\Ùe‰zOÀıBj7ööšŒ\ëqu¨Z\Æó\\=ÓŒGn˜\ë\Î3‘_\éšUõ\ÍôwWv\ê-¶©Í‚?¼Hş•ñ\ß\ìuû \ßi^/±ñ÷Œ¡{K\ß6Kû/L›»2•Y§ôpö\ë_x\Ê\ÍN\ÇøTšÚŒeö™\ÏZI=\npFt»§ˆ\Ö\Ó)1\ä\ä««\\ô\â35\Ë\n`N°ƒG?J\×\Ô\ï\ÛÈ·*~vS\"“\Ó#ÿ\0­\\¥µŠj·2^\\5®\åU\×\åÿ\0\ëÒª\ÔLéš–2½Å·\Ú\\m7]ğU{\ïR\åA\ÆiY„˜ \ãƒğ¨\ï\Z\án\ì\İ!&læ«œŠšW\Ó\0Š‡qŒS\ÍHƒ+JÑ€¹¨\Ñ\Ï\"¦\Ì™\nğj&bI4¹˜\Ó\Ä|sÖ©;€ôa §\ÛÈ¦l2)T’pOÀf\â\Ä\ät¥iXÒš~\í\04HD•ù\×ûRx\ã\\ÿ\0®\ç¯Ò¿Eg¨\ç¿9ÿ\0i\ÙD4\Ö\Û¸?¥M_\áŸW\Ã_\ïo\Ğù+SM·\ÓÁRr}j¨v“œ\ãÚ­\êŸ=Ô¸õª`8\äzkÇ•6ö?n¥v¬µgÓ¿²\×\ì\Ûgñ\Ö\Ï]¹¿¿{8´\èö\Ä#´…IŸA^­YÉ¤k—\Ö÷}–\á\á,?‹kšû_ş	À\0ğÿ\0%÷§¾\å|e\ã·?ğškŸõı7ş†k\Ğ\ÄB<‘hø\Ì*¬ó*ô¤ıØ¥c°ğÁY\Í\ÉÀ¯Ô¯…WƒQøs \Î	?\èê¿•~Ox&\ìG \çšı4ı˜u¥\Õ>[E¿-k+DG·V\Øw£G\Îñ]/v]?SÔŸ\éš`p)g\Ã5D>V5¡ù\âC›­\r!N\ä0\ëO\É\"¼GöŠı \Â\È\àğşŠm_Åº´\×Qµ\Ûb>\Ù“q.:óÂ¯\\\Õ\Æ-±#\æÿ\0üzOø\×\â\æ‡,%\Æ\æ{‹0˜\"Dp \ç²\à±ú\â¾7oxª\ËG\Ô÷Ai&™0\í¯@_”Ç“\É\ç­OøkVøÁ©\ê÷ó\ë³\ïµ& ò \ßpÄ—9#øy®ŸÄ3ğL7Miv÷WšuŠùV:\\ \àŒ`\È\ìz’G¶v-6:bš9\nøJm\Ú{\Íb\âû^¹+\nC©	\Î¤ö\0q_HşÃ¿5\ÏşÑš¥=\Ê\İøK\Â÷v\ãw\nzF\0©$k\ç3ÃºMö\â\ín\Î;‹\Ëˆ[4„”RÜ°oR½+\Ö?f¯\ÚÅŸ³ÿ\0.5K{_·øoQD7Q¾O\ZŒmN\ê\ãœzÓ\ä\ÕM\Ç\İ?h\Â\àœûšl³ R†>\ë\åöÊ²ø§øğU”\Ğ\Åk±$¸¼R–!W<cÖ¼_\â/\íG\ãsi®iş\n¼“W[\'0\êº\Ğ\Ã\ÛÙ¹\ê\×?xö\ã\é[ói¡\äF\î\\¶=_ö\Âıª\Ï\ÃkK?øv\è\Ãu!Š{ø”3Æƒ„^¬A<ôW\È\ßomgø\Ì÷ºX¸–\Ö%¸»F¿˜\Êma\Ó\Ï!ş.½}€¬\İcÄ·~.ğŞ’’\ém©øš\å\Û\íó\0$fÁ8“ø#ı\ÇZ†\ê}k]\Óÿ\0\áÓ§²Ó´ù!I|Q«$ n\ÚN\È;g‘×z\×<¢\æwÁªkTTğ²j$\Ô<cw¢k\ë¤x_P¹k­GT³Àºt\Ê*ùg’xô\ìû%ÿ\0\\|Sñl“j–J\èV·ë‡\Ú%\\`‘~µò¥şµ\á_†-\Ğ4¸ ¸Õ´+÷A«YG0y\'·F\İ\Õz198\ï_¯¾#xk\â7´\íOÂ“\Å&bX\ã‰F\Ão´c\Ëuş:sJ\åaV£q\\¨\í,4ˆ4ùg•7f9wf,\nšÿ\0\Î|ò\n7O¥<\Ï\Æ\Êq\Îk7[\Ôb²\Òndi6±‚c’\Ç‡z\êrIjrn\Ì=Faqk¦D¶g\á[ûˆ&€Qb_¸‹€LUSm\n¼„´£.ÇŸ\\AV¼\Ğ§Ò¼\ê²\æzi$XVT \ÔM\Ôõ¨\\¯\ËÉ¤Šb\Ç\r\Å`1\Î\ê™\0\ÛÈ¨r§œóRòwü(e@@\Ç¨†\Ó\Ğbœ\0\ÇqCh¸QQ\ç2\æ’V]¹\ëMb \ĞÒ™”\Ç\0Œ÷ô¦2CsÒÀ\n¥\'z\0G\"3g\î©5ù‘ûAjF\ãÄº£\î9i\ÜşµúG\â]A4\Ï\ê—L\Ø[Hß\Ó_–?õAs¨\\°<»s\ïX\Öo–\Ç\Ùp\Å>jòš9_\Óş ügğş…©ƒ.Ÿwu¶t€\\\ã?…tÿ\0µ/Ám7\á—\Å\ëı#Bÿ\0G\Ò\Ú\î\"‰‰%gŒŸ¥Sı”\ßş2\'\Â\'¿\Úÿ\0öS^\ÕûlEø\Ù&\å\ÉşÏƒù½^	\Óm\ë©ö8\ÌMZY’Œ&\Ò\åıN¿ş	ÀX\è^6ÿ\0y?ô_x\ÚR3\×@Á?m›ƒşù¯³ÿ\0\à›®Í¡x\ĞÌ€qşÉ¯‹|u˜¼k¯2Eüùÿ\0¾\Íe‰ş?C<¿\\\Ûo\"×†¯|¹€8S_~Å¾&Y\í5M-\Û\æuYn\r~t\é—DJaNzšú£öVñ¨\Ğ|o¦J\Ò\æ\Ã\'Ñ†?gF\\²±®}…ö\ØY[t~„\È0ilp8¡\ì°\äE |Wk?Nãƒ¨\Èn=kóƒö\äø?ª\ÃûDi^&¿7ñ\"­¤·\Ë!\Ùj\èùt\0ğ@=rkôx¡c‘Ş¹ˆ\Ñş(ø?SğÖ½\nÍ§\ßBP·ñBü\í™}N\á[S—.\âG\äŞ®j6Z\å\æ\à}\Z+˜töu¸TI%Á7\Ùı*Å„43\áe–¼°Yj·\Ö\âD\Ôôû¢†i•¤!@\îIı+[Jğv­ğW\â_\Ä+KÉ’\Êÿ\0\Ã\Ñxne!V\á\åù‘\Æz’ =kÑ´tñ›cc£}²\ë\Å\×WRµ\È@;\n08\îI\Ï½Î•;\è/\Ã_6—øZ\ë\ÃÚ\ÙoIT,gø¾÷\ÊG\İTş*ğ]ñğÆ¥i:\Ùi6¤G÷WAX°?t \'s~£\âY®\Ó\Æö>ñ\Õø¶³°´ò\Ş\æ\Í\Õ\Ş-\ã;IO½\Ó¼\Õ/\nx\"R\î\Â\ìi–öN\Z\Øj	ˆ\æ”)\0\äg\Îxõ¤\åÊ›+]‘\ëô›¯|7’\ëV¹8\îi\âP`\0˜ğ ÷\É©c@ğ-Õ•”)qI:¬\Íf¥—\ä4ƒ8,=óŠ\ç~üL‡\Å÷š6¹·:İ³\Ëp\Ò\Ü6m‹\Æ>bW  =+¬¸øŸ¤iú\ÄvºÕ©mouó[\Ï,\\>cœ1ı9®\Z\î¤g\î½[\rN•j\å÷»˜~8\Õõ-w[¾\Ğ<%\Ù\î!UMC\Äfo-\Õx\ÊB\ßÂ£¹\ï^m¬ø†\ã\ÃIq¥Z].©§–ó]®Z1†\'~q\È\É\Ç\'šõ\Ïi¶\Ëi\â[ønKmMVo˜\àF¡q·\ÓnFk\Ë5O‡¦·û5¼ó‰b†\ZU$eÛƒÒ°£‰Sv^‡U\\©\ÒIwÕ¾\Ç£KˆZ­õœ\Ò\å\Ê\Ä(\ç\0e»pk\ĞşşĞ¾,ø	\â\éuM\î\Z\İ5\r\í\ÉK…2}Ÿƒ´×š\êºN‹{\â]\â\Ú\éb‘mNƒœ2“–?\\*£†š\ïŠ5¹´»ä»ŒÀ#7\Ê\ZR¹?ˆ\ë&¢x’§\Ï\'¬~Áxö\Óğü3oªX\Ëy\×¬ºlñ\æwb2}jƒ?|?ñ\ä\ëV-®·¦\\5½\î‹{…\Çi Ÿ\İ8û\İ+ó³á‡4^\Ñ\ÔJ\Ë<‘\ìi\âr¬?+ƒ\Û8#ğªPø—\Æ_ük\Å-.õ\ÒûH˜izÃª`\\\Ä2c2(9\0ƒø\Zà§ˆö\îP}œ\Ï+Yz§8¶ù\â™ú×¸w¾\â;\ÒHT\ão5\ã_³¯\íA\áo\ÚK\Ã+u£\Ê\ÖZ\í°n\Ò\'\Â\É\ì\Éıô=A\ë^Ä™U$\àdg\Úqvg‹¯QTòx\Å~c”/\'=©\n\ä\Ğ2@ \â§õ¨˜\áM9 \Ğ¤—\Æ$‘\ÅH¬z\æ.0q@~Q\È\ÅD¿xçŠš_˜ri8 1%N*&ÊŒ‘O2\0qMv´\0\ÒsIŒ\Ò\à\Òb¦\î\âgœü~Õ“Gøg©;6Æ˜yKƒ\×5ùmñûÍ¾™ƒ¤ğ+\ïO\Û3\Å\â\ÇM\Óôx\ß\ç\ÃM \Ï\Ğ\nü\åñeñù\Æ\ãÉ¬1d~ŸÂ¸g\Z^\Õõgoû,£·\í\àò\Óö\Ñ\Î}{\Ï\í°ül~\æş„õ\à²\Ü\å~?x8Ÿô\Ñ\Ï\àk\ß?m{¬|jlóÿ\0\è?›\Ö\Øwû·\êtfwş\Õ\ÓùS«ÿ\0‚p4\Ï\Z`ƒóG€?\İ5ñ\Ä7c\ã¿\åv\çPŸø¯±ÿ\0\à›2\æ\Ó\ÆX\â>¾¸5ñ\Ï\Ä÷+ñÄ¹?\Ú\çõ\Ğ\Ôb?…O\æm—?øWÄ¯C\n\Îa\àu½Gá®¼l¯`emŒ®aÚ¼#µ³]/†µkp¤x¯>.ÚŸU‰¦\êSqG\ë·\Ã\Ç\âÿ\0iZ„l\ZO$G(\î\n\êPü£=k\åO\Ø\ç\âB›@PV\éC\Âÿ\0\ê?\Zú°Œ{W¬Ÿ4T\Âq\Øª\âgI‰¸ÿ\0v£d.¤zö©\ï$8¢\à‚x óÏ€ÿ\0m½>k\\\Õõ,L\Ïg©[\ÚÜ¬?\ëQ\Ãü_RO>•\à\Z\Ä1\á\rf\ë\Å~Ğ¥°\Ño\"û–ğ€HG,0rx\Æ{W\ß?µ€£şÀºñ-¸\Ú$ŒYj†1‚\ÈÀªL}\Ô\à\é_›(¿ñ7\áÿ\0„;U\ÒşÑ¡\Ú\Ş}¦i\n¬¾¡ñ\ÏLzêƒº7…¬j\Ş\è?e–\Î,hºÎ§\âñ\Ü#º\Ée#1;Iº’\rz\ÊøƒNøUğóJ³Ô’\ËW\ÖÔ‘vøu\ÎI\Éÿ\0dd}q^J—^\Ôo-\íü==\ÅÕ¦¡ql}2ˆ\Ú\Å\ËbD\'=~÷µjø<;ğ\ëÇ«&kv–\à9LÈ¯(]¬=\Æp\ÃU³Mz\Z_o¤ºÑ®/´pÚ‹õ»“,\0#‚5Ã’«\ÆIÿ\0kÒº|@“\Æ»¶\×E´Zµ¼Ğ­°@H,[\Û\ßV¤kÓ­¼Ysr?·¯o6\Û\ÛCEŒH¹ùö\àúW=m¥Esã‰´Ú›`%\Ón_®r;tù»b¹ñ\âÚ©.‡£€\ÄJ\nt\â·;\èt‰n¼1¥h×°\Ç\ÍÍ¹Ym‘òb‹\å½	\ãŞ²µ½B\Ê\ÓÇšn—u˜´öÓ¤-ü)2p¼ıWq\á\Ïi§MşÑ–şü ¹ûu\ÉË¶9+¸õUyß‰\'\Òõeº\Z¤kZ\È{­>F\âK2Ÿ U?\İ;r|šñi\ÔU*·‘÷8ª2Á\à£\Z¿E÷\ï…~XÁu\ã\ë‰uš1²¶\ÊOÍ»NŸ…f|?ğ§‚|+¨ø‹W\Ô\ZHšfUU\ÛH{–\Åhø‚Ñ¾|5\Ò\ì¬m\ç¿ñˆ»‰¸\Øz\çolP\èñÍ®Z\Øi:ş•´·onÙŒ\É\'bs\Ô•\è\Æs”nö¿\à|·¹N~ú÷”tÿ\0=£À\ĞB¾ğü\ÑG$Pƒ2?\Ş\Ï—Z\İñ™$\Ğb67zf¸eÓµe€YF+ü$\Ş\Õƒct4:(mE\ÔIm\Z”·oRB‡šv¯«\Ë\r³@Z\îÁ¥-Ò½{ddgŞ¼=_g^N\ç\İ\æ¹z\Å\à©\ÓN\Î6>e\Öt/üø—ª\è¾\Ôş\Ëjò«=F\ÖP\Æ9R¨\Ç ­}\ßû:ş\Ş\Ú‰¼!g\ÄV\×O\Õ‚\İ\ïc•d<\0\Í\Ï^\ì+æ«¯øs\ÅúL\Ê%kMA‰0\\4\Şb£w]Ç±>µ\àş%ğ¥†Z[{«\É4«›rDºt°“+’qº\ï\ìk\è)W†\'N§\ç8Ì£ƒ5Utöhı\Ê\ÓumOO†ò\Ê\ê\ÛT<W00x\äSĞ†j\ÎO­~H~\Ê?´¦±ğnñ4ıg\Äú†‹¦DA\ZN©h\Ó\Û\Ë\åy\'1“Ø_y|1ı´~üH\Õ\ÓF:˜\Ñõi9D»[\Ì\0ùŠJ{}qVÕT\ÜO T–85*Ä¨2*”w+*\Å,G4¤‘¸eü\àÕ¨ÙS\Åd\ÚÄ›Cg=¨\0c¡¥üzÓ—n9¤iN\ÂMFõ,\ì\ÈQQ\ãpÀ\ê(\0-O_ZLŸZOóÖóÖ€“Ş‰%#3¶A$Â™#`pq^kñ\ÛÇ«\à¯Ş¸›m\İÒ˜¢Á\ç©ü³FÚ—Nœ«TT\ã»>0ı©¼|<G\â\íNd“1¬\î¯¾IÕ®Œó¹?…zÄ¯µõ\ìÀ¹\'\'©¯)Vy[œ÷®	Ë™¶~\ï•\á\Ö„`»·û,³?\Ç\ß\Â÷ú\Z÷\Ï\Ûa—şcñŸø—ÁüŞ¾ı•\İ\×\ã÷‚ğ\çş?9ÿ\0¾M{\ç\í®ÿ\0ñ{\È>¿W®\Ü\'Á/S\ç3{4ÿ\0·S¬ÿ\0‚k•ûŒ\É\ìcşF¾;ø˜\Ê\ß|Pù\È:Œüÿ\0À\Í}ÿ\0Ú•V\Ï\ÆH8\ÉLÿ\0\ß&¾9ø–sñ\ÄËŒ©\\cşû5•}(\Ó5Ë¿\äo‰ù*pA5r\Ş-óü«9X\ì°©#a‘É¯8ûF´=¿\á.<?¬\Ø\İ\Ã)Šh$WO<\Zı;ğOŠ\íüm\á{ZÕY\Ó.½Ñ»ƒ_Ôš\Ö\é0\Ä\0zŠûoöMø\Í~º.¡9@\'’gÂ»hN\Ş\ä\Ïx—.ö‘ö\ÔÖ¨û1F\Å¤QƒŒ•#/\0G­B\Äg®Ç¡ù–\è\Æñ§‡S\Åş\ÖôGT#P³’\İCœ\r\Äe9\í†¾?Õ¿c|Y\Ğ\à\Ó|G¨/„­·n—\Ê\"y\\/\ãŒõ\ï_lœ¤\ãÚš\Åp1ü¨Z\n-¤|]kÿ\0\ßğß„ôJ\ëE\Önõkö³‘>Á}ˆ®†\Óò\ärŒN6‘Ş¾W\Ó]7\Ã\Z†eÑ¤›V¿b³šTò§¶<©S‘\Ó»\ã5úğ\Ü÷c\è3ŒW—ø\ßömğ\Ä_k^°»»d[ƒf—m³\È8\ŞP¤\ßÖ­TÔ¸\Ôi\ê~w\é—:·Äb\×C¸Ó®ôö\Ò\rwf#$ªv\ï\ã \Ç_Jõ÷øEcğ”iW¶s=\İÇˆm¼Ë­J\å÷\Ì\\9Oğ®@÷¯§>8xWM\Ñü-¤-•”0\Û\\8\ÙoTw\êzW\ãx—\àŒZ–\Ï\Ñ/¤\Ë‚	\ÎO\Ğ\à\Õ\ã)ûLœ^§­‘\ãaC3„ª|/O›ÙŸ?ø³SšÏ§A(¶\ÕÙ¾\Ç2\î09c\íŠó?x6\î\Ò\ÉR¸\îù\ÄV±¬,\nGe\äz\ç¥_ñÆ«ut\íEı(Š[\ÈX²\İm?½fª\ç\0\Z³¨%\çˆ#½‚\Ù<\Í]¢7k\n?Ê±!\Î	\í¸öÿ\0f¼l=Q¦Ÿs\ës||1X—ü|\Ìß‰Z\Û\ë^&\Ö\ê®,2Ë\0\ä}+Ï¼Kw{\ã]_Cûs>\è\å\Ğ\È	\n³\0 \ã°\ÇÔ¾ñÜ¯ª[4ú[\Ë|¬\Ó\Ş	ó\å\áF\äs\×\'š\î>\êÚ»øªKYô\ÌR\æY\Ş&QˆùÜ¤õû\Õ\Ù4\è\Ó~Hò)K\ë•\ãe¬¾GĞ¬F\ÒõR\Òòs\'n\ÙS\ë\íL¾ó\Ñw­õ¸Hù\Ô}{ı*9\ç‡lVw¦+›	°m.Ï¾\Ö?\È\Ğ\ÑO¥©\Ø~\ÕiÕ’N]ı“_!-]\Ñú\ä)¤Š\ë\áı7Q\É±³…#\Å0\Ï\Óú\×;\âO†v^\'[h\å>\ÓjwYµü`Kú«²k©D±\Õ#K‹i\İJ‚¤‡\Ç=>•m5GEtÔ¢òÀ•#ù\×Üÿ\0QDjNš2³\n´!84\Õ\×c\ç\ïi:‡‡µ\İ:\ã\Å^{\å\ÏÙ®¦¶‹|7g\åp…”v\â£\Ôu\ßø\Æ\ãTğî¦½À)6œĞ³9\Êğ¬§%öâ¾ŠMD\Û\ÛŒ­ş\ã&	Xcı\rq^*ø\á/ˆÅ¨\ØI&•©AŒG\Zƒr‘õ#=Á¯f:J§\Ş|V7$©v\éEjy¿\ì\İûQø\Ç\àÿ\0‡.^-E\æÓ’q$šUóm–\"p0Ç”\ç¥~‚|	ı«¼ñ\Æ­\íg:7ˆ\0t»¹W÷§\Ö\è\ãÛ­~j|_ø{ª\é¾;\Ó.5\r=Ã—{!½¾Ó‰’\Ô\àò\åFJv#­s0øk¤ø_\Å~ÿ\0„[_kı7W^\Ö\î\ÒP&8‚:ƒ\ÇJ÷\ã(MsA\İ[.œ$\Ó\Üı¹ó\×oûCn=jH\äRB}«á¯ƒµş«ğÿ\0UO|N»MoL\Ò\Ú\Ï\ÅvjZUfU¸Q\×#0\çÖ¾\Õ\Óï¡¿¶I\àš;ˆd–H›r°õ\ÍE\Óz3Éœ%IòÌ¼\Ûw\ç\Ô$\á)†Ns\Å3p\íA\ÇSd8…\Æ;SLœqü©‰²)\å£3FI=«\àŸÚ›\â\àñ>»<pOş…j<¨— <òk\è\ï\ÚO\â\Ä~ğóiv³¿¹\\9”Oñ5ùµñÄ¦ö\á\Î\í\Şâ°­5G¹÷9—:’ú\Ä×¡\Ç\ëúº¸g\Èj\ç¤]’o\Îs\éVC)$±æ«¾\Ü\ã9®~¯\Ú6Gªş\Ê\ÎO\í\à±\Ø\Şì¦½\ïö\Ùqÿ\0¶Lÿ\0 ø?›×~\Ê\í·ö€ğg8\Å\ïş\Êk\Úÿ\0mû€\ßf\Ã>\07¯G¯MúŸ\r˜+f‘¿òş§wÿ\0\Ú!`ñqŒ\'?¯~&\rÿ\0¼N@ÀşÑ¸ÿ\0\Ğ\Í}wÿ\0\Ô%£ñŠ§\Ê#\Ø\Ö7‹`\ë\Ş,\ÖuHu- »»–dF\Î‰÷ª©JU(\Ó\å0¡¡\Íq­+^\Ç\Æ\êH\Å}S\'ü¿\â26RûJ~xı\ëñ5‘\â_\Ø/\âO‡ô;\İRW\Óe‚\Î&Ec¸ªŒœq\\N…E¯)ô‘\Ïp2i*«S\ç+y\ÌL6’+\Ñ<\â™4ûˆ\ØK±‡pzW›a”œ;\éW,od·pÃ€+’<Ç«:q­NÏ¯\ä~¬ş\Îÿ\0\Z!ñş™{2ÿ\0j[¨\nYòfAık\Ø5ùOğ«\â]ß‡µ+{«I\Úb`\Ê\Ù\äW\è\Ç\ÂO‹t$p\ë§\n´DN2q\Ô}kÖ§/h\Çóœ®X*®p^\ëüù\å\0TLÛ±··Z\n31I fC6\ĞDR\Ğ\ájÏ—m\"d•]zâŸ¹H\ëQ\Ç§\î\ÂÃ¸â³µh\ÚD\ŞUş¯ae)„s\Ü(b=—9\ÈúRK[•k\Ø\â>>6\ßÃµLŒ.FF9\åM|±ñG\ã¥ÿ\0…~x‡\Ã:{½Bö\Ëö?»´·a¶O,q\ìj\Ç\ÇOÚ‚–ú‡‡~Z\Ü\'†\ì%ÿ\0‰†²\Ãló\Î|±ü)\Ç^µó¼úŞŸ®|+\Õ-\ï5—´Š\Ôµµl•IP·pNsŞ½\É*\n›(Şªš{ö¯?ˆ®\í</©=\Ä?Ù²@#…b`şD1õWC~x¯P¼M/Ã¾½\ÔKiö¶†<ŸšMÏ‚ÀŸ\\có®G\á×€§—E‹[\Ôu¤Ó”E†[\Ì@‡;#€pXó]oŒnmõ¿„\Î-g¶–\îõ\Å\Ì.ò¡\r•¸<~‚¼Ú³RVKcŞ§A¾må©ªhNúM\í\è²ÿ\0CY<q°R0¼g{\Õ\Û|º\Ôå»mvõş\Â-…®›o,;\nƒıóı\â\í^sª|E¼+‡š\Öv\Ö Ä“\Ël»Õ¶Œ±\ãÖ½\á\Ğx~i0kû¥ûR	–\è\ì$œ#÷R1ô¯7Rp£ioÀúÌ«J®.3§²¾¦ö­¦Ë¡\Ùi%Æ›/2ZJ±ş4ôÇ¥6\ÖK8\Ã\Èn,\å8‚ñO\0z7¸\éVUû%\Â[jr1ÿ\0\Ô_ƒüt~À\Õ[\Í\"{k&]“|\ÒZ·\Íÿ\0´=Ò¾|ı:nMs¦+È·\Ío*Œ,±r\ĞÔ–\Z²DL7h!ü«p2ı½d\Ø^Of<¶-5Ÿüóe\ËÀ}·½iı©\'@Ì .vyVV±½¯¢bÑ²\Íj\Æ3’1¹eööúŠ–\Öö\Ù\ÄS!°\Ô#_••¶’}C£Ú›¾œ…¢%\Õÿ\0å”‡·}´$k1“VulñÄ‹øQ\äa8»\Ø\ÓMf[o\Ü\êk°¸\Ûö¢¿ºogOzó\ßş\Íş\×uo\í­&\ÙtÛ’Œ%²ŠO.\Şr\ßÄŸ\Ü9\çŠ\î\"¾–\Ôí¿„<G\åY\Â\çşú6é´¢\Ò\Ú7hr\ÓZ·\'º\éZÓ­R–°‘\ã\âğ1Q\å«	ğ\Û\Ãskv>&ğ&»§Ï£jl/­§ ùŠ\Ä\íñù¥z÷Á‰~>ø%\ã«-\Ä^$´\×\ì5(K]5Û¸\'Y7º\Ät\ëW\\Ò¬¼q¤¬\Ñ]Icu\Z–·\Ô-°&Œô\0\ã\Ø×Šh:ß¾#kx\ßQŸP\Ô™l5vƒiùıQŒcšö¨bı£“[ö>G•Bœa	GNÿ\0\×côƒ\á\Ç\Æ\r|PŠhô{õMRØ{¥]0\îÜŸ\ï!\äB2+µ÷±\Èqè§ŠüŒø\ç¨6·\ã-SğF±p|Wij\æ_\ì©.~u\êO§=+Ÿ?>*ü@ƒ\í\r\â]e,\í¶\Çugmr\év“\îx&½šWœŒøLf4+8\Åû§\ëŞ¹\âı\Ã\Ò\\jºµ„q.\ç2Ì¹_¨À\ê´§‚N‹}u¦\ê\Ëyq\0\ÛM\Ìr\Üg¯Jüı}sE°†\Û+-SL!_=uIZYnd\îÜ’9ö®3\Å\ß¦ñ%‚\Åcb4\èc\Ê\Æù?{>¿Ê´“ökS£/\Ëåª—CĞ¾3|O¹ñF«wuq9’i[<Ÿº=Ò¾~\Ô\ï^\êFbù©µ\r~]A?z\ì\ÒcOz§¢\ØK­kVZtl\î\æXU\Ï@I\Ç5\æÉ¹K\ÔıJJV\ÙEs7\"›$X%ˆ\Î;\×\ÚÖŸğN‰\Ò\Ş)¯<couB\Âq\È\é“V—ş	í£¢fo\Ä=‚ñ­~­Sm\ÄX\ì\ß\ÜÏ›¿e¤-ñÿ\0Á¤ö¼\È×¬~\Ûñ\Íÿ\0\Ş\ï…6P‘ô\ËW³|*ı‰ô/xûEñ·‹—P\Æ_9m”¿+Æ¿n	Iø\ës€p,`Ÿv®ú4¥N‘óó\Æ\Ó\Ì3+Ó¾‘\ê­\Ôôø&œ˜Ÿ\Å\äî³ŸL\ZòO‰´g\Å‰\Ş\'\Óô\ß_­½¶¡4QC\Ü\0µzüIñ©øÁ\à˜\ã\Æ{u¯.µø\à>|xñı\ë\è6:ú]\ß\Í%ÚŒÇ‰•$µ•¨\ÓNV%CŸ5\Ä\Ú\nN\Ës~Ô¿\ì@q\âkóO™OÒ¾¤ı“~1ø³\â\ß\Ãïˆ±x—Q\Z“Y\Ú?’Ì¡JƒÈ®\Ú\Ş÷Aø¿û/j-o\riº}\İŞpÁ\"vWp\á°x¯ÿ\0‚}²¯‚ş\'·\ŞCdrOoİšj2§QÁ\Ê÷G\r\\E^£TT%	%¡ñ}\É\âUbr€\Çnj 6\à‡&¤\Ô\0{ûccó5\ã°/\0õ\â¥\Ëcõ*Q\\ô54ıY\ìŸp\ÎG¥wşø\ã\â/\Î.´]Gû6\æ@\åı¹¯-3\ÇœEf\0\àşu´g\Ê\îl^ˆ8Ip\è?|MñOF_\ì\İzú=J4d7\"\Î%WŠ\à¼M®x\ËY?x†\Ç[…˜\Ëlºƒ˜\ç\Ğÿ\0	\îExOƒ¼E\'‡n\Òú9¤Ô€‘\ÆÜŸ¯­}9ğ÷Çºge“ûa\á\Óoä£„¡Ú¬Ì»wC\í]Ğ¯\ê~]\É\ZNt\Õ\ãùc€~$j–\Z…\æ·\ãZi\Öxl \Ô]\Ù\ÎŞ™\Èü\ë/Fñ~ƒ\á¯¥\éRG\â(\â+w=\Ñiñ9w9?A^½Ş§\à\È\å\Ó\ç\Ğ%Ô§\Óñ^@\Ê\"r\Ü&\æ=ıqšn³ğ¦_\Ş%\çŠ-´ı\Z\Â$,\ÑZşò\ä¿@d”ò\Î\0­\ÕDş-ö/h£\Í>|:ñ¥=ğE¤\ê1\0]d9cl\êI\É®w\Ç,ó\ŞG©=—\ÒÀ¶ª€î“«F?\Ù^¤9®úI<{5œ~¨mTşİ„\ì0A»%‡ûX\Ôf©\Ü|-µˆó^}J;Gó ¶u\Üv–\ÈysĞ3\Ç\Ìk:•}\ëA\èuĞ¡&šq÷Š:ÇŠô\'O·ğôF\èjR©ó#½^X\Î\â\Ëò‘ƒ\Æ*§Â\0Ï¬ê·’^Ûºi2A°\Ûğ¥ú\ì?€9c\â\rÖ<.³\İ@·q0‚\Öv K„ü\Ç„œ}+¶ğ\'‰t}7Á\È/õ8¬ug\"ıoa/Àu\éŒWZ“„\Z‚\Üöp˜xÎºuŞˆó[{\'ğ\Ï\Å\ë\Í\Ú\Ît·š0©(a¸F$\çĞ1^\åqY\Â÷\ÖG=›`\\ZmÀ\r\êfúõ®^`¾(\Õ%¼=¬	ä¤¬8\ÏV!º\ã§\åP\Í#[\å\ìfºi\Ğ\ÒC&\Õ9=<7Ò¼lUYUJ\ç\è96\n8z.´\Ä\î½ˆ\é\Ö\áô\éC\ÚËœ\Û\È7F=r*jœ7\×zn#•c\İ\Î\í¾\è}=«\Ú\ïV²–Kµ¼²b@\ÜdS\Ëşğq\ë]™\âm7Y„	\äû™\Ã\åwB\Í\ßk\Õ\Æ\ãc\èo\äYW¶\ÔÈ\ÑÌ£\ïÃ¯ø\Z¬–\ïipÁ•p\ÇvA\Ämôô«‡Ã¶Î¿iµ›“÷^¸cüú\Óe²¸/.\æ$™;<|\çğ¬[º-J\ÏBí¬b\á¾\ïo¥2\ãN…\ß\ÏFh&^’F1ùõ<\nù\ÛFJ2=ªôz\0ƒ\ät›E7Í¸\İ;]2\æ\Ş\çjNFH\ÆU\Å#»i\Î$‰ZK\\\ä¨9ò½H£S\Ó\á½\á	\Ì\nğEG§\ÙÎ¿$›˜	õö4Œ¥>\ŞI¬¯ş\ßbÛ„ ½\Äx”zF¯5¶Ÿ­X<S—OºL\İr\ê?¥PKyL*¹\È\0w­}6\ÚQtcr»sÏµ\\Sm[tp\âŒ[{N~	\é\ŞÕ§½ğıÄšK°\r:\ÄwE·9\r·=q\\¥şŠ>\ë7\Z¶a·³”´¨-\Î\í\å¹\ÎŞ¼û\×\Ğ~2ñ&\à«u{\"\ËvŠv\Û)¤\\}\Ò=+ã¿Š2ºñÎ¼·3Ë‹{q‹{f9E€¯©Á\ÖkŞ©«>–<]E\ìU£ÔŸ\Ç\ß\ÇQ\"\Ï¶\ãlH0W\ß#½yB\ÄBÉ»­6\â\ä\Ü;9U@zªŒUÁ\Ã\ÓÒ´©S\Ú;³\é0a\à£9\\(;>•½\à)s\ãŸ\í=o¢ú|\â¹\Öu\'®‹\á\Úñ\ï‡G÷¯\áÿ\0\Ğ\Åg‰˜•j/ÙŸO~ßš\î±gñA³´\Ônm\í\ÛLB\"‚Bª\Í\Ç8õ\é^gğŸ\âÆ¯M®\Í®\år\Ì2=z×¸~Ş„^N\0û \ßk^\ÛûZ|Pñ/\Â_„~¿ğÎ¡ö+\Ù\äeM\Ù_+5\èÊšœ\ä\äôG\ÄP\ÅO‡\ÃÑ£\Í>¬ù{öOş\İğ\Ç\í7 \éZ\Ó\İ\Û\\\Ç\æ,°\\1\'”=Eiş\Ü:›§Ç»\äó	g\nŒz|\Õ\Ï~\Î^5\Ö<gûTøk[Ö®\æ£u;ù²·şB1Vnœş\Ğ:¨Û¶ğ\Ğ\ÑJR\än;\\\êq\å\Í=ıù?S\Õ\à›úµµ‰¼Só¤&Kt`ep¹\Ça\ë^\ãŸ\Øc\Â~0ñ.©­\Ç\ã&¶ş\å\î3!T,\ÙÀ\çŞ¾ğ/ƒ¼I\ãJ[OY\\\ßİ¤fGKS†\ëœô®ù>\0|[ıY\ìŸ\ëYÆ²5S½‰\Å\à\Ò\Æ\ÏO\É\'¥™÷ÿ\0ü\"\ZoÁ\ÏÙ—[ğ\ÌZ´:‚\Úi÷!g.2\ÅòzgŞ¼ö‚K/„Ÿ\ï™…­™DÂ“\å\à×•|/ı–~\"x\ß\Å\Ùø†CBĞ£ı\å\å\Í\ä¥W\Ë°\0N+¨ı£¿h]Bğ\Ùø[ğ\È%¿‡-\×Ë½¾„`\ÎÃª†\î8\ä÷­¥U¸¹µcÌ§ƒº–„ı£›»—D|¡y#‰°Ä‚\ìs\ë\Í5T°\Íu>ø_\â_‰—²\ÚøsIŸTš!ºA\áG¹<Wz?dOŠ ø¤®Gw§ø×’©Tj\éxó=\ì\ê\Í^:6\' ¿Ë†\ìKû$üV\'şE;¯û\é1ü\é%ı’~*ª1>ºÀ\çrÿ\0?eS°–i„–\ÑG\ËD\Æ\ÆqŞ·¬¼Ysfˆ•}\Æô>µ‡}aq¥^\Ígw†\æhä¸*À\àŠ‰\âl\ÖZÅ²P«\Ó=\ÏÀ¿µ\Íô¯¼º®‡tÛ¥C·\ÍBb=+\ß|ñDñ}’\ÙX]4—¥BGö–Ÿ™\È\ï\íŞ¾Kƒ‘¸şœ[zˆn,õ˜/£›\ìf\ß¯w:gk¶5”´’>C’©Kƒ³>”ø¦ºüÚŸ\àÿ\0\n»\Çup—‡|“\Éo\ágµpş ñ\Ï\Ã{K@¹¼mSB%Í¹ù\ã—n0\Ì~òŒ\äU¸>=™L3k–U¢0›˜6{‘ü\ëKBBñ&•ym¥¨*”\ááŒ‘“ƒ\Ô\ÖÑŒ\ZM^–\"ƒQœ]ûG x#N\Õ4s¬]\ê±,\ÖñI(‚fù¥‘N\ã\Ï|Ö¿†<Gg\â½7H½ğı¬÷\ë¸\ÛN\ÙfVûß¼\ÏU}«Õ¼KğªiÖ²BAˆf2 19#\æ­\é~\ny/d×®¬Uo®#XR>\Ç\ät\îIı+<EE^\'©–`ı¾%Sn\Íj\ÙcF\ÓlÉœ(\××™Xò\Ì}‰\íL\Õ5!\ßm¥À&tvN#Q\êM2\ëB¹’_.\æ\êH¢\è#Oó h‰AşÉ¹\î\Éy\'\ß­|\ãM\ê~»X®TôF\ni¦ötYdûl\Ë\ÑT‹øô­(\æM0Æ·³CPq,b1I=¼º‚ˆş\Ó$«\×Ê´„ªı8şum4¡1ùV’@GY&ˆ‚>¤\n‰jo\í)½.@—n<\í_C+œ±\0®}\'Võ‡#XûoM›Ld	\Âûœ¯Ò²\×H7H\Îonl\åŒ\'¡\0\Ò&Ÿe\n”KzA¤\áYÛ›C	F-\İ3£\çI\ÔQ+\ëy—¨e”\'ù?Z«&«o`ÁQ3)ş<\Ö\Ù“…ôk–WŠ\Ş\ÚX\ä)\Énim*a6,p“ş²ÁŠAüÁªö\r\ìsÎ¢‚½\Ç[\Ï\"˜mŒ1|\ÙN[ò\í[ú~›p0óHY3–8À¦^x²=%\Ä6–MY\ç\Üq\ì+„ñÇ½NBö,\×\×Jx{µúªw­#…}N:˜\ÉTÒœOXX¬-c7WN°[(9’C´~\ç<øóc¥Döš‡¦\0şCú×…x\Ï\â\î§\âi\Ş\Ş¿Â½=‡jó\ÍC\Ä2\ÎI\ÈÁ\ï]”\é¤ö9\ÕMóV#©ñ?.5{™&¸¸y$rrXòk½½i¥c“\ÇJ­u|Ò·\áÈ«\Şğ\å\ï<I§\èzr¯Û¯¤E\æš\ì„ZvGK”iÁ·¢F[1\'\ëM\ÜqÖ¾¨·ÿ\0‚xøù\Ótú†—=¦\Ï5dÁ<<iüZÎ™\Ïı4®—B¯DyK<À%x\Ô>J\ÈÀ8\æ·ü\r©Á¥x\ÏB»º`–\Ö÷‘I#ÿ\0uCšú:Oø\'‡‚¶\Í[Kc\îø¯ø\Ïû=ø³\à\ìk\Ö\èöS\0RöÜ‡ˆŸBİµO±«y¡ÿ\0ia1‰Ñ§$Ü´>€ı¸t›[\Æşñ­¢}§\ÃS[C¶ö?™FN:q^\ÅãŸŠ¿¾(xOKÒ¼W¯[\İAf‘\Ê!Fu(\á\0\ê+\å\Ù\Óö€´\Ò4ë‡<ÿ\0OğV¦(\Ò\ÆÍ9ÀşU\Ôj¿°ˆµMJk¯\ë\Ze\îr\ÆK9¤Ÿ£<Ê»c&\ÛpK]\Ñò°\Ô\à\áC\'f½\Ù#\Ôü;®~\Ì~×¬5½PK=N\ÆMğ\Ü+;qŒIŒ\×ÊŸµ\Ä\r+\â?\ÆM_[\Ñn\rŞ*¢\Ç.\Ò7`Wª§üŸ\Ç2©júJ¿,›¶\×ÎŸ>^|-ñ¶¡\á­JXå»²`®ğœ©\È\íQ9ÖŒR\å\Ğô²úX\'Y\Ê\\¥n½©?\à›\Ò*|Q\ÖÀÿ\0‰y\çş*ÿ\0\Åÿ\0\Û[\âƒ¾&x‹G\Ó\æ²K+\É …NÖ±?\àœry5T\ç\æ\Ó\Ü\ãñ\ã_´X\Ûñ»\Æ@1©J6¥:’¬Ÿ«Ò¯›Ôeue¹\Ù|Bı³>\"|EğÄº%\İüV“\Ş5Šùo\"\ã¦\á\Î+ø)ğk[ø\Ï\â\èt5Lv¨K\Ş\ß0>\\õ,\Ç\Ô×œo\Æ=«\î?Øœ‹_\Ùÿ\0\â„ñ·d_5x8ò²k\Z)Õ©yt=Lj†U…”°±I\Ê\ßğ\å/|w\Óş\Ú[|<ø1k\î¥j@\Ôuh¢óiG\Ş\0\0I9\Íq§ö®øû\Ï\î®úóÿ\0£ÿ\0\Ä\Ö/\ì(\ëö†Ó¾\Ğ·“+fAN9<\×\Ñ\ß?n+\á×õ¿\r½\ã\é·>ô\Î\Î?\Zé‡½\'+#\ç*\ÓTk¬=*\n¤¹y›~§ƒ\\~\Ø_4hZ\æé¦‚û\Ï>šUGnIW\Ñ?±o\í\â\ïZßˆl<Msop–p#\ÂaŒ!I8\ëR|Mø‘eñ›ö4ñŠ-´È´\ã,e<’d\Ú\ë\ß×šò/ø&‹(ñÇ‰\Õx\Å;c\'um\Ê5¹®z\ê\\jÎ‚„\à\íøŸ7|i¶<a	\ãf¥9÷\Ù5Â©Ü¤¦½#öŠ·|pñ’nş&\Ï\æ\ç®8\Åxµ>9zŸ¡\àu\ÃAù!\Ê\ädg­KÁ^¸u¨W¯=)	qœ\â¡’Išø\Ërä²¨\éšÓ´×§³¼v\Ìa‘NU×¨ö®u>\\µ,R3—Š\ÑI£š¥TVhõüQ\Ö\Úò9\ï\ï\Úò\ŞR¦2+\êjõ‹\Ú2\Ò\í‘/´••»½»\í\Éõ\Æ+\åø\î\È!KmÕ¥mªù`Ä\Ü\Z%\Í/C–8J®\ãYõu§\Ä\ïk2\"<W1\\7ğœ¹•z†¼\'\á\İ^H¥{\Û(·ï¾“~‹ş5ñ~—\ã&Ó”ˆv¡\î@\çó­\ëo‰\×\à˜w\à\ÓQ‡\ÚG.&&JÔ¥\Ê}\ïgğ\çC•\0“\ÅúX§”½=ºÔ·?4¨ceƒ\Å:TŠF>rú\×\ÂC\â\Ì\è\ï›ó§·\Å\Ùÿ\0Šv\Å_³¡ü§°ÙŒw«ø#\ê\ÍÂ¶^˜\İÃªZ8Gm>ôq\ì¹\ãğ®Vûâƒ\ì ekƒ9z5‹\æS\ïšùº\ã\â\Õ\Ë\ÊBL\ÙÖ¹\İ[\Æo©?™ 	 ş5\ê~µ“§O\ì£\ÓÃ¬L]«\Ê\ç\Ñ:Ÿ\ÇOY\ÆE¦’.9\r3ı1^}\â··#Ëµ‘l s€p:ñÛVIPÁ—¶{V5\Ü\ï2¶d\Ë\Õû´)G{6vÚ¯Œ&\Ô[¹¤c\Æ\çj\å\ïu3!,~:\çšÈ·»2¡B\Çxëš„\Ü\ì½=kH«7\å$¸»\'òª1e\ÆF\ÚtªóÈªÌ¸\Ïª\İ\Ç¯Vı™#üuğˆ#Ÿ¶/zòp~lŠõ\Ùt±øó\àüô7cùU\Óş\"8s©`\êz3\èo\Û\Ûâ‡‰ü%ñCIÓ´Mv÷Lµş\ÎYZ+IJr\ì2@úWš\è^ı ¼W¥Zj–7:õÍ•\ÌbHd[¶\Ôô=kSş\n\'2Ÿúj?&•8ÿ\0}\ë\İ|kñ\æ„²ß‚uO\ßYÍ©K½²\Ç&\×\äù¾\\õ½FùªY»$|%7:<<hRR”º¾§ƒÿ\0Â¦ı¤¸\"mw9\à\Öÿ\0\Z\é>|f“P¼¾øCñ¢6¼Šy1\Ş]\Ò[I\Ø>ı\ruß³\ím\ã‹Ÿ-<;¬}„Ø¼/,†8B7\Ç?|ñññßµ6±Œ\ÕS8õ\Ü*&\ã©\ÆMšBjU©†\ÅB1”ct\ã\Ü\Æı ¾_ü\rñ‘°šCs¥^f[¼`Iz}@\"¸ı?\âw‹´«4µ²ñ6§imı\Ü1]0Uö<W\Õ_ğQA´|=JÙ¹\Ïük\ãFU\'½k¬}œ\ß)ô™mU‹ÁS•{7c\é¿\Ø\Ç\â7Š5ßše–§\â-KQµ–·AqpÎ­„8\àš\ál™7~\Ğ\Ş(;W\ï¯şƒ[Ÿ°\Ô%¿hM!—m¼üÀ\rs_¶¢O\Ú\Åd“(ÿ\0\ÇEuBR·\Ôñù)\Ã4”i+.SÓ¿\àŸ‚\×\ãL\Êd\0I§\Ê\0$˜5\é?¿bO|Aø‘­xƒNÖ´ø¬¯\ç3¢J\Øe\Ïc_húî¡¡\Ş:ö{…	mÜ£\0{dVò|Tñ—$x§V¸¼ñ®xÕ‚¥\Ë(–+.\Å<S\ÅĞ«\ÊÚ¶\Ç\Ò\ÑÁ;¼Z\Ò.uı3öc_A|!øğ#à§4ıRş\ßP–ú\ŞiÁƒ¢1_«ñs\ÆĞ¨\Ù\â½]Nz‹\Çÿ\0\Z|ÿ\0üowe-¬ş*\Õe·•\n¼ot\Ä0=Aæ´§R4\å\êy\Õ0†**k«_±\ì°›ÆŸ´&šŒ˜fÛ;v¯eø\×ûø³\â7\Å\Ä\Úv£¦\Åg¨\Î%$s¸\r ş\"¾\Ó5ıG\Ãw\é¥\ŞÏ§\ŞE’“[¹Fˆ®±>;üB.\ï\ê\çşŞ›üja*s§\Ë8õ:qx*ÿ\0YXœ=NVÕõ>öø©‡&ğü>-²M\ZWó\ÈL\Ş[7®?\nö/\Ù3öañÀ?\êú³euİºC[’X\Ù$\×\çûütø€\Å_«ñÿ\0OMş5e¾:üAò\Ñÿ\0\á/\ÕóŒ\Ç\Ói	ÒƒºO\ï81~\"”©Êº´õ~\ïcêŸ‹°×Œ¼yñ_ñ\r¦§¦\Çg¨]4Ñ«¹\Ü\ë–_ø\'?ûoK\Ü‡q¯Ÿ‡Çˆ%qÿ\0	v­ÿ\0OOş4\Èş:ü@‘Á>/Õ²}.›üjZ¡ñr›FcEFœ+«/#\èFÿ\0‚ux\Õ8ş\ØÒ‰ÿ\0x\Ôgş	\Ï\ãrGüM´±§y¯ŸŸ\ã\Ç\Ä¤ÿ\0\Â_«dwûSH><üC*ü&:¾?\ë\é©Zƒû&¼¹£ÿ\0˜…ÿ\0€ŸAGÿ\0\çñ b$\Öô°;ÍŠxÿ\0‚sxÀt×´±Ÿv¯Ç¿ˆŠ1ÿ\0	–°G½\Ó/ü/¿ˆl|a«õÿ\0Ÿ¦ÿ\0\Z-E}tó_ú_ø	ôZÿ\0Á8|Y´\ïñ–=şjQÿ\0\æñr‘ÿ\0™ø|\ëÿ\0\ã\â8\Æ\Z¾\Ïü}7ø\Ô\Ã\ã\ß\ÄE81Õ¿ğ%ª¹h¿²m·\Ö\Ü}\àœş.+\â0“\ì\Õó‡Å¯‡º§\Â\ŞxkUx\å°SºÜ¬¤µ^O\Ú\â:Œu\\\×Á®\\×µ\ês\ßê·“_\ŞK\Ë\Ï;–fÀ\ã“XV?²OO\n–\ÄUR^„ff+q\ì)sd\ä\Õwr\0Á¤\ï}k\è{N\Ì\Øğş•q\â]n\ËM¶e[‹©V$,p2Nk\ë›?ø\'_ˆ\'¶‰\î<Me\Äe£U,Æ¾3g·•dŒ”‘H*\êpAõ»\Ø>7øúB\'‹ueDT}©¸kzn	{\Èñs\n¹¸ıZ¯/\Èú\\Á:uR7‹- šcÁ9¯ò3\â\ëeõ\"3_1Iñ·Ç’ƒ»Åš®s\Ú\éÿ\0Æšÿ\0<q(\Ú\Ş,\Õñÿ\0_oş5Ğ¥GùO/ê™¯ı¯¸ú‘?\àœ\Ş\\Ç‹\âğÙ‹½,ÿ\0ğN˜†“\ÆQ\0:\ë_%\ÍñS\Æ%H>(Õ˜\Şñÿ\0Æ«\Â\Æñ\\oj¬=\î\ßüj¹\é[\á+\ê9›ÿ\0˜ŸÀú\Ş_ø\'…£|i\î\nhÿ\0‚yi\ë÷ülƒ\è‹_\Ã\ã\Ï²ó¯\êGŸùúñ¤ºñ¿&wkz‰öûSÿ\0f§Eı“O¨f;ıgğ>Áø\'¶\Ï\ãˆÿ\0ñ\Ñ]_\Ã?\Ø\Ç\Ãÿ\0¼i¥x‡ş4¬%ˆ· \r\íœ\×ÀRø«Zsƒ«_ÿ\0_/ş5ü$z¶9\Ô\ï\Ö\á\Ïõ¡Nœ]\ÔL\'–\ã\ê\ÂQ)\Ùù¥ÿ\0g|mñd^ \Ô<T4ë¤·\Û!š2¬ ’=:×˜Kû|<!\Ç\ÄwdO»M\Õú\nøf}Rô“›¹\Ïÿ\0Z\ß\ãQ¹\äP\Íq3²ñ«xˆ·wa“\âi%J8‡e\ä\Ò‚¿~\Z|ñ´~$´ñ\ÔW\×k@±\Ï<a0\Ø\É\ã\é_ üX\×ô\ëÿ\0\Úrÿ\0RK¨\ÛN\Z\Ê1¹F\Ê\í9\Íxò\Í#§\Í#œ´j\ã’I\ã<\ÔKu\ËcºW*S•Zµ9œ•\ÓïŠ¯ğ/\âÿ\0öUÇ‰üSh\Ò\ØBR/\"\ëi\0œŒ{W>~Ë°G½õ\è\ä\Ö\ïÿ\0­_\0*\n|r±\ÏO­W\Ö\"õpG42IrÂ¼’?F<«ş\Í\ß	µõ\Ö4-ruFU‘¤gÀ#µ|[ûGø«Jñ·\Æ_\ë:L\Ë{§\ÜÍº)”c\ë\ÎÊ¦\áÁ ¨\ã ;\ÖOÚµ¬ua2ˆP©)ºM÷?ÿ\Ù','chineese.jpg'),(68,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿş\0AppleMark\nÿ\Û\0C\0\n\r(\Z1#%(:3=<9387@H\\N@DWE78PmQW_bghg>Mqypdx\\egcÿ\Û\0C/\Z\Z/cB8Bccccccccccccccccccccccccccccccccccccccccccccccccccÿ\Â\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0w\Í\è‚\"2‘H\n)( S P@  €\È@E @A\nˆ\È( P@¦@¦@e5¹q) @HŒA2‚#Š\", FR) 0ˆ\ÌnÜ—¹¤kr\ê\ÎTğL\Û9\Ô:!}\'CšÏPF@¤@\0Z,^\ìx\rÿ\0?~ZWY c:$±\ÓnV?^Kk<µÀ=ô„öˆ=nMO›\Ã\ïÆšc*\Ñ\æ\ĞùTÜ–\Ò_\æ\Ñş{¬Î¼\×\Ö9.Šo\0¹€h­n=‘\è[<¯·%i@¦¬-T \Ñç¼Ì¨(oaZ<×“Ûm\r®\å\ïùÛ«´\çô\Ï!k–ˆœe\rN]†\Çó2z²n(¢j\\¹\ÛÒšf\Öt7L\È6-q¹Ç®_TP\ä’npoÛ‹1¤i[•\îM-ø¥šD\\Á²–GfZYYAP\Í\Ö41ÓŠBi-a¨}\ÍiE,\ÒW:Üš¦\neÊ¶·8u\Å\î\ÇGAJ=s°\Ü\ç\ÑZ©>½Š\í\Î?nM\ËR‰,7&–®“\È=hs\ŞgTF­<\ê³²b)\ZJiş~ùı9¯ªDš_H‚w;]*oŸg1œ¾üV¹fi˜i\Ğ:‘µiò—³Ç®7n%š¥M3Xj˜´ù´óú³\Î\èÎƒ ¹mEF‘\"\Ü\çÕ¼§\Ò\ç a7\"†f¹\Øtœ\Zf(W\'Š\Ğ\Ë@\Ü\å\ë›sEB=§«Ç®Wn\"\n\'\Ğ1\Ë]ç¡¢·\nSb(³Yº\æ*]Ë°\éœ \Ñ\Î\Ú\Î×¥¾D–Ü¾\Z˜‹¤Z41×¤×¸\É\å±\Ä\ÔF/N0;†tH¬ıaz‡Üº¥È»\ß>‹«\í\Î\'N=&D;†À¹[\\ŸO6‘bŸ\ÇN)\r‚¸‚o= Ù›¾]‡§†/\\†Æ³\ÒÜ¥¤9şZ©Q›¶V”±\ÍÁgk”¼\ÊEšg;¦p)R\ZNsô-¶!¸\èp\\ƒ¹hd\ä¼\íò \éW{hóM\ã¡°\Æ\ß!Rˆ\×\Ç[@nT¹,]\Ë\"}\0š\æ¥{Naº{`:–óµ4‹¯>¶\Ìİ³]§\Ğ\rÍ†®Z(l\Û0\Ôô›øm\Û]K\â‘\ÜËŒÒ–Ù–k>zsy‚§_“\\^\Ìi\Ë\Ò\Ç\\ı²å…š\ìK\Ô\Ğic©¡ñE…4&“¹w-Mª—\ê\0\Ìa±¶™ˆ	4y¦$°‹+§(Èœu\Î\Ò©4\Ø\êy…\ì6»‘4\äR,E1-\rce%LóZKYj¶‘\Òd†\ÌQ\Ñw9½²\Z2û\ËJ¥™¤	1\\À\é,z¼»\æt\àôXòWRÛ‡Ÿ¶~Hˆ\Ï=¤“-8`©\Z[yÑ‚KZ£;£=dß†\ïŠY\Ú\Â\Ã\á\Í3¤v\r&\Ö:\ç\ïˆ\0‰±\È×¸½¡\Ú14\\\Åğ5ck:fN“Z§7£-4Û—\Îv\ZJi	R¤8Ÿ †0Œó÷!1]‹?I\é XPtŸIöª\Ğx®\Õ0w]9j\Ë:}e§\r+¬f\\Àhu=Yp9ŠAc1EFv‘a‚Â™¤Ïô™¡™\Ã\â§\'«\'\Ó*mc Z±—s£E=X|…†=¥A˜®\ÚNçAaLi±’h’†&²zñÜŠa5b\àsçµŠ\ZÛ—a\nJ4\ÎvpCH\ä PXS Z\ÏBMY\ĞHK\'«-\Øl\'Aƒ\Ï\éd“Ô“Nj\"™™K*\æ¥†•¢Â‚\ËC9\èH¢&dw\0©eõe»\r„P‚kY¤\Û\0€\ÄaĞ—d¥òÕ…2\"e¡Œô,Q2W/ªœnœ\ÜEmP4š­S t™„0\àd\"\ÇB¦Z(#-‹4Y$ 3#5>o¢\0ˆA\Â¤Zd@.`PXPX\íªg;\â¡]\"‚\Â2\Ó\é2MqQ\Ã6ğ\ÓNO1¾`¥A\Õ\Z+B\Z÷	\ÙB.\å‘PÜ±§›(!¤\æi(ªÓƒ€l\ïN\âòı‰¨;M\ìv\á§Ry\Õòi›Qbg\r8—aA—¤!¤ò,(‹k;´tÑ“e‹\Ïm&\ÏB\ÍqRÁ=¦fŒ”\nB\n\n\n‚ô¸`Z\Ï\Ò(\Î\Û\Î\ÙA\Ğt†\Z\à´d[Q: P@ ‚‚\n0\r3.\Ç\"\Â\Ãÿ\Ä\0)\0\0\0\0\0\0!12 \"3#A0@B`ÿ\Ú\0\0ÿ\0\à‹…\Ôÿ\0\ÈX	\Ê\Æ\äù‚\×Y§´\ØñP\"^®vmL7¼©ù¯øX\ÜQ‰$13’“òV+«\í\Èdö}K\Î`\ï¥n&\ÍB¸% `­U\â\Ãg×µLke¹\íuœˆ±–U¨\äe„ª½Å¦D\é+½@µù¾\Õ7yx<€˜`8Š½84®\Î\ê\È$\Î3I\Ç/>»NğÊ¾\Ù}œƒ(\Ã|Ì™“2`9S\Ö\Û_‚\ä¹Z‡¬\æ\ÊøG•¯O6Ï¨{Ü¤O\à«õ€D«\0­k.\æ©\ÖV@pC\rCr·\'6¹\å‚a\ïOMgÀ8\Ã\ÊT.Ni\Ö#€¨A—õ-\ä£+\Í%]›È¶j¤u\\ağ¦¤\çm‹•«¬€Ë’{Ö¡TØ£\rŸ–\r\İNc‰\îıHƒ³0P\ìY†¯ë§)\Ä\ã™)‰\Ø\×G©¥e\Ã#e«œ‰4üi²ùVEmb\áœ@\è¶VE¦\Æ\Õ3A\îªXú¦µ\ê8ò;—=eGâª¹µx¿2\Û\'W*l5³¸Ev\æ\É\Ú\Õ\Ã\Ûñ\Ó,Yh\'¦—}“¹\í9JñÍ˜3qãˆ£\ä6\ÌÌªg­\ã0÷•ù\Ù\çòY_Ré™«\Ê\Ï\Ä\Æ5<¬ıM\Û`	›D™Ú¾\ç2§\'z{òÉ·µƒ\r\Íüˆıgm2\íp\ÍqN 9œ	f<¾,>;(Â©0sÊ»q±\ÙN	’,W\Ù|˜zñŠ9ˆ™1¼bõ˜\"&m\ì%Ã–W\åœ\Ã\Ğ;tU‡\â\ÈÀ&Dwø\ÌN“3¼\ÇGY;©Ä´\äM/\Ûa„m\ä«\Ò&9\nz!£Sğş\ëvE\É-0r\â	g’\Ëz>v\Î\ÉW\Ç\Ç9h\Z3fJÛ‹\ï\0Ÿ\åƒ²œ\Ç\í\èô91k\Äc\íi\é\ÍL³\Î__ƒº·B\ÂY\ä6^\Ç\Ë3L¸R	cñŒñ‘\É\" \ê3s˜LJÉš•ı5±gY‘a¥Œ\âCj\ê\Ø1V\Ï5\î\ÑcùJ¬ø\ç1›x\ÏÈ—a\ëX°ø\Ê\Ô1—\ÕLM£\æ\'õf 9š³\ìğµO)œ¯#;\Ï\æ\×}iô\Û.¼(\'ñ\É‘„\Ø\åY]Š˜ ‹°ò\Õ÷•\ÒlZ¨ô\ã\"ö\ÔX<}ƒ½¸\à¬PH\Ã\Øm\ÙLşY\ä;mx\Å\Õx¿x±võ~SE\ã,\Ôı™\éº)vM5Œl¬ñzlHA¾øv0÷\Ög5;j\Æ-¤|\\u‚+l;\êö\Ósôÿ\0d°\â|f£·H?|\ÇS57\'|N==\Ê\Åg\"Û™\Ú$\Õö”V}/HÆƒ\ËRT¯³MÇŸ8,+P—ñ.½\Ç	…ÿ\0?N\á‰\ÕxJ\Ş\ÔĞR\ÊUköi1Ï‚N	0\Ô\à”\ïÁg¤±†\Ü!\ØA\ÕxM7\Ó$…Œ2=šj–\Éøµ\Ï\ÆIø\É/¨\"©Á°:\Ç<Ÿü„S\á4ÿ\0D\ã1µ¿fú2\0\ßTG—·ø\r\ÆÚ	¦ú!8†\ê\Ä6üI,w£¬³\ìÌ§\í³\Çu\ï\ïl6Ô¦*2¦J\çoWd==•\Ù\Â1\ËD8v ¦\ã¹÷ƒ™&oCeg½G¥‡6m˜& X\ë…ö‰ˆ\"®eËƒ\îX\Ç›L“(úe¿oµ{\Êêš®„V\Æa²©i\é<ÁRƒ‘Zñ0&¯\Ü&0acuö*–\"• \Ít\âb:gc=a\á\Ç`Œ\ä ]õYÏ¶­±=!¥½,iqqõ\"iø\ÏF-j¿\êFa¦³?¹m¶©`Ya\0\ÏJ\n“şRŠ\Óñ\Ó c\İÿ\Ä\0 \0\0\0\0\0\0\0\0\0 01!A@`ÿ\Ú\0?ÿ\0\Ş\â\Ì]\Ç1eró91;\é~E\Å\Ñ\ÍĞ\ÅC\É\éˆò••S¡d§&X²†7+!»œ\\(e)#L\ÊhÀe¹^\ÆNŠ+\Èz±*B–¥Eü(¨Q—±p\Ìtû³ğ´z8R—Ñ¡K?t{·Ce\Å\Ç)X\Ø\Ñ\äX‡¢\á\r}±³‘\Ên‹²\İÂ‡+\Ñúb\èn‹ü—FOD\\\á\îª¯G\ì\\!ı2óUğoæµ¦•p‡\î˜\ÃÓ‹cT^\ÍJ\èp‡\Õùğ\ÏL}—«İˆFQŒ1ÂŠ*%9J3÷T¥ÅÂ‹‡¯X\Î^GèŒ½Œ–¯d´pŠÑ±˜½P\ÑF^M¸~‹U®HZ9\Æ\Ù\ë”~®~ù\ÈQ“\Õ;µ\ÏV1y¶^	\ÑÈ»\Ó-q2…¦p¥Œ½›¼eE–=ˆõFz!©t§E\Ş\Ù\ê\ÇÔ+Tg«+¥ˆ¢»Qœ(²÷¢Š_r2ó­hÿ\0‡/?t-r\É[­_E=\êr\ß&rp¡ì¥”\Êp•œ\à§-”2‘\Ån•‹4¥E\éeL¶\ÆkJ\n\Âû\è¤58®‹şz\ßÿ\Ä\0(\0\0\0\0\0\0\0\0 !10A2\"@BQ`aqÿ\Ú\0?ÿ\0(·\à\â\×õ[ği¯Š\n–Sô\Õ\Ó\Û\à•º?-\'óö~š\ÚşF\ä$4#/Á#ğHpq÷q(û\ÃYZ!¥·¼5dôööGöÎ¤w\"ZRYÒ†\Ô8§é©£]¬A&û#¦£\æg¢\î\Ñ\íYš´G\Ñö±•^(lÜ†\ÍHî‰¤\Şl×º#WØ´\ã™ş¯\ZP\Ü\Ë\ìµÎ©Ÿ\â\Í8\Û\ÃxL‰\'lgĞˆK\èû/±¢0şT7HRÄ•ª\Zk£J5„‹¡,²\ìş?d\åôˆKk\Ã\Ât/¦S;BğJ™<\Î[cd%RQ96û/¡\å(côŒ\\¼#\ZT4zm/\è\Ù\Şg©³¢:;-IZ)2‘.\Èi}²^”P\İíšq\Ú(£b6\áº6\ÙT‡\æc¸c\"$—˜—‚ğÔ†\äF.LŒiP\È1w,Ä£^ñ¥·\ÂW]M.\Ë,Ÿƒ\àñ¿ù…\ZÄˆôC\Ü<\"J\Õ‡ò®;\ÊÆ —f¤+µ—„,?ù\Âo\ë÷’²»¾Ñ¢.ğ\Éaö«/Maø.¸z}\å\áô\Èab^b(¼?q\ß4\ìc#‰ùˆ‘W‡\Ìİˆá²ú\"ğ¼8¹f*–\Z¬IZ(ª\Ä|\Ë¿BYŠ\ïÁó\ZsÜ¸!e\æo”\ÅXeğ¢$‘ÿ\0¼$)\"ú4l\íLd|°±%Í¤}ò°‰\â>ğ\Ğ\àÈ¾±öW?IzZ\ì1\â+‹HCY¡–ğ„}ò‡£VlÛ‡ˆyÁô˜y~\Zaáˆ+R/4„S\Ê&E\å¬K\ÃC\ï1Á\ájÊ®2f†/‹;\Î\Îş—‰³G\Ü::„ø¾f\ænøW	š>\á\æ¹6n,±1›YBù&hş\Ø|W	pô$i{‡š+\à|_ŸY¦©\åeü¬Nù±•†ˆº›ˆ»|\ìcd9±#j(Ÿ¸^r–r7,6‘½0\äğ‹71»\Â\à\İQ‰¿²ø!:\Åp‡)\çs-\çr¡Í¼.‰;ş†\ænb—ûÌŸ÷¬\Üùÿ\0ÿ\Ä\0/\0\0\0\0\0\0\0!1 A0Qq\"2a‘3@rB`¡‚’±ÿ\Ú\0\0?ÿ\0¹^\áûK•c\Ò%¬Q‘…%aG/\é••ó\Ñ%ee®V\nÁVhm$\0°¬Z¯\n\"\Ë*\"\ê¯\'\n…b´Õ–ô‰QSr€*\\0XÕ³³a£‚¢r¬%\Ï~¤\İ]Y©ò\Ö\Ék‡\ÆÁ*–$ğPy*\Ä\Â>QB£T\êbyWR«»7†H^,€\n\0RX\Ù£+Š²U\î_*•4Ã‰Q0²Š§ºŠ›‹¨\ácD©«*\å½*uv¸|\Î\Ù(œxPT\Ğ[QÂŒ(mD\ÙGl(6V6RQ©E(\é0TK[(µŒN\Û!IW²J\Ó\n¨°E|r¥Ia\n)\n½Ü¶‘÷²XF•\å†\ÒRôùE‡\ÃiV\İ!j\ì²\Æ\Ûe\Zk÷%\Ø<¢©.kc°« ü¸i|µp\í°\"½A‚°*\Z*\Î\ØÔ³\ËLw¾\ØhCw¹d\ß\áA26Tò\ßL+{+÷WT4œ(\nN\Ûm“\Ğò®®\n„^ÿ\0ø­•›¨\nJŠÅ¾6\çv£’¸Y\r:K]XÂ¹_Mun\n¥_d…u\å\ìT”w\0\Ùÿ\0kYº\Â\ÕC•xGu¬\Ô\ì¦-\Ñ\Ó\Ùa–CÃŸ€j<p¦¯r»y\İtT…‚»\r¡\ê\èR\ÕtE!b<­\nôşöD·¹Z¡ùo(ô±Ó§<¯\íX•5¡¤­¡¥ªor\É\ßm·jXdOeú•ş_\"vf-\İ~¥_öW¨Ÿù+\éû^œ+®T¡å¢Šd,\0\ĞQ}¦c\ÛO\á{)ü,!°°ˆ\ê,6FÚµp¹\\®T\ï”OTyjv\Õ\çeRvG/÷\Ñ~Ú–¹^à¦‘™Rvò^Z•G\Øı´RyD\nŒ=\Ën;\"Z“ò©¶WÂ•,?˜Uy\Ş:XC¡e•uKU\ç£HXXk¾\Êw\à\ìt{¨¤]ImQ$<ŸJ\ÂÁü/U0ƒ\İ,>•{–ŠDü¬¯qV[¯j\Âôp\Ó\Ğ÷T»ùı­\Ã[wÿ\Ä\0*\0\0\0\0\0\0!1AQa q‘¡±Á0@\Ñ\áñ`ğÿ\Ú\0\0?!ÿ\0Áj¢h\çûMCP}¿£®2Å¹\âR°ösuoùB¦Î…©°ù\â\Şñ2ü7ırĞ¥–Òl™~ªÁ\è»\Ï\ÇXµ¨¶Y{©K4öcŸ\ä\ÄDi*fwY\â(¸…r‡Œ\Ì\ê!W¸št,\Æl¸[!\á:\âM&A °\'Ke¹p_^—\rE\\°\áÄ©^Š\Ès8;\â)l\ÛOG1)–\Æl`qÙ™FnSQYöÑ®\Ä\ïzb—F/lwcÎ¯i¤Ù„ƒx\"\Ì&\'%ô~;§\Å ¸†B£¸cDH\áY	‚‡s¶:450j^7\Ü\Z…Z\Ø\æ,r¶\åk	ù\ÓIÀ¢\Ät8\Ô\Ñpó,\r#¼pEW1/‚_,û\Å\Î)Ô¼Kn\Ğ-*±¼\ÂW8\æT¢ºI9€OfÒ\Ê8¦\å´\ÎW‰€.0Æ™&\ÙN`R¬L]N÷˜B\éˆg\rWx=€xˆS?iùŠ\èT”A®\ï1\ä]ğ\Ì\Ê4m‡¬¹A|®HÔ˜j26>\Ğ\ëR‡;‹M\Ø1Ú•ã´µ\Ò\í\æ[rrt\\\ÎNkp½Ï°Á™®~6C+Ÿ‚(“*ç‘Š\Ûgƒƒİ›‰“L\Â\Zş\îÁÕ¤R\íşwˆ¹o†,<\æ—=\æ.£\Ì\á×’8k!\Ô.\Ø«{Gšpñ)ª‹£ˆ\î)”ZbeÓŠ\âƒ¿A‚8_ˆç»”x\âÊ±S\Ôk\äBˆ¹Ÿe?*y\ÏIhg±\Ş\'#,ø;@¨¢cje½L¼‹‰XMÒ‡Eİ‚.+K\í\ßc.Ù¹D€(–\ïö¦,ú¨r5\èY\îT)7¥&w{Iùp\Æ\ã•\áR¼\Ã\ï™{º¼AjNu\r“0\"f\Ğu8šûL7z/´\Şn\æ\Ö*V\íD_\êÁœFÀ‘vj}D:–ò\Ò,A™“F¹\ë\Ú\ìg6!\áF\âøÀtjv”¿\Óx\è|£¡¹o\áG\å\âsÒ¤\ás*a\Ä9\n¬©©ù\Ñz£\Ú8H\Æ8\îŠ¡\êf½§Z£‚\àƒ0](\×-ô2\ïõÒ›v\ÄÄ©\Å\\\à\ï\×ö„\nŸJË³\âÃ™KY¹]‘Te÷0nƒº\04vHµÄ¡v>Bö¨Z\Ô\è.\ÏI]\æö/liü¥RU0\ìX\ß5\0t)œ¡\ÇK\Ì\ÂUUô¬°ğ”\Ø[»u\Ä\Çc0ŠÏ´»E»c‰Iw*¤«\ÚX®ŒsgFù\â\í(\â$Q¹B‡dQ\äñsP{dş&;Ç˜5\Ğ\\x˜\rµ‹şq\'2Á)›\Â.SĞ©•üJ\á²\Ìó,·\Ìš¦ï¤‹Œõ\ÓD°J™_‹‰¾U6Œ@iû	t°x\Ü{ü™IœDX~\Ñ\n¸MÅ‡@\ÈE\î½G´Ö¼\ÌFô†` [S—ˆ÷¢§» ‚\Ü\ŞX¸\ß;^Š÷u\Z Âf\Ó5Ñ²=\å·2DšX±W\Ì6%¶\"\ïZ—\Ãa8²­Clqşª^x& …[Ö¹	v§\çpŒ\Æ`¸!P\Ù	\ndÇ´\Ğ÷\ëP+\Z%ö\ç0\Ã\í6%\ZŠ«g™œ#¸mKkh`\æ¦Ì¬¤§h\è\ê´ª€4-«5›0B§\ãô«¯º\İúÍŠ¦qo\ásöÇ§)MfÈ¼tË¶º3Z8†%\\0@x\Ü\ì\Ì=‰Q”O7Ó³8\ÈLşıñ:\n_$f\Ì\ç5{@Túq)\"\Şò˜\Òs·¼\Ú	\ß)J\Ï\ÓKl;Gp	\ïˆmnŒ¯eô½\Ê*wNü†§ŸCcÜIøbr{\'\Z\ÖÄµŒözlÇ¡bQÈŒ\Â`´¦\íB\ÚS}ş.[‹qO-\Ë\â0NR\íXNY\Ì¼½£]D÷¡€kpúK\n\Zi\Ì\ì\Ãü´ 8„z<8#	Y\'<yõ\ï\Ğ\Zœgr`zk¬€y¨ÿ\0†:q=£Î¦\×\Òx¶úÿ\0•0\Ú\È\Ó\0ÕƒAÿ\0T«4>½¦\è\Ó\ÑO\ÛıôTB\Ëşâ£†½\æÒ©O¼òı\â¿\íxMÌ“;¨\Ìû!§\ÖG)\Ğ\é×¢3÷?}\æTŒè•ˆk~§k®¯şkú\Út&˜w2ùÿ\0r¡å›Ÿ‹2Ğ¾ğG	k\èšEû^¯-İ¯\ï)a»~Ş·4ú\É\ÃÛ \ßE\à‹r‘´2¢\Ô>a\é67G\ë¼\\\Í\Ú\Õô\ÜÁm\Æ\Z\Ëôbb*}GH;Ã´‚U­EmwùÇ˜RŒ\"\Ô\Ùû–±]mAzl‚Ş›fMÏ¨]’\ç˜\é\áı\æ)Û©\è\Ú(:#¸Xÿ\0\'\ï¦k\çûõÁmJaöš\'6O¦\ÊgˆûšE „3\ÔW\Ïñ\Ô\êWEÌŸÁ*\Õ\Ï\r*\Î´D¥yô~vB¶R‡\á%\îXR ,½Ï“\í1-ûb…ø—ÿ\09ö±\Ü*¨•*:}N»2¦|Av~¢HG$®ŒpÁ\ïø\Ñ\0\Ù\Üy›Ÿ\Ç;\İ\ß\Ñ\Ñ@O3„|by?s+œ\Ù\Şm_djæˆ\âW\Ñ]M¤•¿ğAez\àAı•Jš›TıÁ(õÿ\Ú\0\0\0\0\0\0AD4Cl†Œ.\Òú\Ğ6›d¦riº\âü \r÷³\\ÖŸyÀ*$ñiß§öÀß–¢\Ís\æÁ\ÛT¶§nù\ÛA\í\0÷p%\ÏyZ9r*\æm^p\İò3‰`€xp\ë\Ä’\Û(õé‚¦\r0À7 7\ÆOl¥5¬\Ñ\ßÿ\0>§\ÖVö«,ü¹¦³±N?g¹ÿ\0\Ò\ìw¼Á\Î4†«\"\äF:\ï†Ç²+¦–\ç»\r\ç\Ë\Ş\Î\Ñ\Zs®D¸3t”¤š«„¦\Ît@µ®“TŒ\Ğü,\\+8ŠoÅœ\ã=\â±ı\Ó¨\Ôcb}½£‚l7\Êaõ*>ş‹Cqj[H\å¡\ÇûJ†\Æ/˜@\ä’&û€©Û¬Dd‡ıJ¶û‚\0\Ï\İDÀŒ•8Vó¸™\08¢ƒL\×áœƒA^2Á€.\Ç\áS/ªVÛ‚\Ã\á˜\Ïrúi¶ßŒóed-şü!\ÂT¡\Ğó|\Ù3/¶\Ö\Ù\ßÑˆ\Ş÷~Uyuü{±¤\0mı\0‰$RIe²Ye\r‰’ÿ\Ä\0\"\0\0\0\0\0\0\0!1 A0Q@aq`ÿ\Ú\0?ÿ\0Á(vÿ\0C°Gòv\àg\'\Õ‹ˆ¦†*Ÿ‹«EX!„GY\0\ã\r1Á/.–\\V›\Ä\Ğsr#Fm`Kô\á!¨¯r<e\Ë\Í4oÛ„1S’\â.\r\îh\"±N¹j\Ô~\Ù\åŠ\Ò\É*=†\å3p„#¢u‡&\ïQf\âZn\ã\ÙF\åQQ?gô…\Çù•7K\"¸´\ÑrU\îu…J¹T\Ê€ı‚\È\éœb¬@±*š\á2\ì&\å9²,\'•l€\Z\Ä%\îN\à\Ó>J\"[ö\0\ÜE¸i±­\\µTj\Ze‹`¥Mªb§%»4\'ÌœË”«€¬ĞŠAF^\"-°h¦a\Ó(·‘U\î9N’\ÔqKlP‚T\ÒrR.ª\"¿\Ş>d¼\Ö÷º”}• Á\Ç)\Û\nL>\0\æ\Åk\'Q‚ò[ù	xf¤»O8c£Ì¸8„EL\â²À¢«d¸3RZÏ·‘ƒ8\è…[2\Ô\nÔ¢¥`\Å\İ\ã2v1\êXTx¸`SS¼X\ê˜¨³J\ÜØ”ğu¸¿\ÉM\Û—‡°j¢­e\Ür!‚;a¨E˜tË¨§œŒo\äb•©V\ÙCP\ÑXAL”vñKƒ²¿‘¸F\ìeE\æ\Âb$6\Â\Ä\Z2‘¿‘U\Ü%u²Z\ë\Ä6NÓ¨š\ÃØ‘‰*Ù¦Y4^#—†}\Â\Â†\Å\Ï \İ\ÎK¸¶>b\Ø%q)¼8\Â¥\ŞED\ï$ø\ÈC˜uğU\Ê^\"²V1!˜e\ì\æu³³À\æ@UG\Å`+cCQl[‚g¨up\î\àB\ÇS\ã\Ü\âW\Ğ\Å\á\ì\êWû‰¯iÄ²\Ş\Z–=L\àÀJ„\æ\"¼’¥MFu¼ü:Ÿ!Á\Ù\Æ›‡ ²\"¼’‰F]JJGO²0ğ\ã`}üPi€–Go³ğG1rğ÷ó\Äù\à\Ìs6Kòb\á{02KÁ\ÔW\'—‘\ÍC±C¿DP–E¨7‘‡¼	4z„òi9:÷\Ô@+¯g8\ë\×r³\äK\æŒ4­şcÿ\0’a\È¬9¦;¢°œ\Í.\à‘Š\à\"\"¿ü)\n9›­\ÛfBJ\â)ûÚ˜´\êV(Ü¹~MKMÿ\0‹W+\ïÿ\Ä\0 \0\0\0\0\0\0\0\0!1A Qa0q¡ÿ\Ú\0?)¼\Ñ|B\ï4¹”\à‰\n*ñn4\Î…Ï‚!\Ì6xy›1\ÜzDmt\î\\EĞ„L·tz8#¤\â})ùˆ<ğl¾cù€t\Üt\ã)\Â\ãoDõ8D¾\è:&kl]ø\Étz¹üM\àô1r\àÿ\0¥E)1	D„‘¡¨\ÚcH‡ôCı\È\ÑR‹±$t÷ôkWM4Ç¬=S)—¢\Z\Ğ\É\â6¬Ó¡ˆ™\ĞuDf\Æ•›\èZ)©“b$†£G\Òob\r\ÏPòÆ±¬u§„\Ñ\r¤/\î?óczø‰[É”C_¦\r˜7lÿ\0	C©R[\Æ5>\"R\à£\Ğ\ám¢¶ª	|\ZPf\ß\à\â\Z6hsPsD/\èÑªÅµY\Z#ƒ‘·\éhp\r\ï‘\ØMS¡\ëL P\é÷\r;G\"«^GH\Ú4\Ù\è\ÛI«¡8´6©üiº\Z¢hm7S8£¬®\r\Ça„\nPru\rp\Í°FÅ›:\"\Øø\ÂHmP\İ\r\ãÂ—\Ø\'©Jø2kG\îƒKd±(„tC¶† û1şX±\ØÏ£TUŒh\Ç!ôš&,i\ÜF>±›\ÓZ\"½óE\ÌAYı	u²®†…´Mg‘ğmÁmc±\Ã\nv×¸\Ñ\\\r‚F#.a»ü[K§ô9\à\Î$)\ì\"x<ò3±\ê\Çc€Ø¾#D\ÂQ¨=V!*°Xnlj¸A‚VpJ\ä•h\ë9;’6)nŠ±¶Õ‹a=\ãC§CB\î\á«x¾B\Ş\Í\Ôcª›˜Ï„CÓƒ~¢Jn„Ô…§0ø2®ˆm\â\à†	Ó§‡¬-(…¥z*J\r\Ğo\î‹w\"BË›ˆ{\à\Ól\Ğed\n„œ	k)¨„O¢§\Í%X÷¤joÑ»±¡Î†!Q\"\á_\Ó‡\ÊAˆapEX&1\ÑJ&Ÿ‹CA´Ö„*\Ä:(¥	$´M‰¸ ²Œkµº\Ë\èF#À\ÛÀ‡&Øœø6š(v¡\â›‡—G\Å\Ñğ7¡¶[\Ñ+!:ş:m\n…‰	C\ÜAŠ\Ê$¨õ\Çe\Õc\Ó\Â\è\Òkb\Î\r\"Ã•£‡†\áA\Ö\ÍQ\ÈşN\Í)	H\Æÿ\0¢C†÷<\Z\Ñ\ì3Q\æ\íñ\è}\r;E–\à\ĞWX$x\ä¢M½‰[HH†Q¬r>\Ò\ÑGøCCk	ô\Ğ\Ö\Ê\â/ß11ÁÀ\ÜğOv}§¢SE\Ø\Ü\Ó\'\á¨eZ\Äÿ\0\éØü³š+ü(¬T\ÙMkÿ\0ÁÁ\è\ŞôSH]ñ³f§CÆ˜\Ö\ãùä¬¬\ÛÅ¢ÁBu_·Ã¡#¿ü\ÇxŒAw\æCb\Ë\ŞÄª,H§ør\á\ë\Óşc¼CX\ã+”\Ë[ÿ\0ú<4vwÿ\0‚;Â¥3½‹_KD8¿\ç<§xT4¨Šg\×\Â{ƒW/h_J¾˜‚%\â\"\ãAlb\ç\Ãs¦\áHú=O\ít)½Ÿ\ÌH¸u\Ç/®\n59lh\ë=\ÇSi4<ñ\ï\é’*~”¨\Ù\rE	>µŒóC\Êğ:\År\r1#‹cM½‰„–\×c\Şñ	Ÿ\\\"–p_ \ÙÜ¥S9š+b¶¬ô‰¯Â·ß·ô›=?¸ú¸_õM~ÿ\0•ÿ\0„Ë…½=úÿ\Ä\0(\0\0\0\0\0\0\0!1AQaq‘¡±Áğ \Ñ\áñ0ÿ\Ú\0\0?ÿ\0\Îÿ\0…ÿ\0;ş\Æ>·._ğ¾?ÿ\0/o\ã~‹F>·#T»\Â\æ\'MtË¹qÿ\0\Åõ¹ÁšA\áff‡v¿KôŠ‚\×V\'¸;\ZkR†Ó†¾5(<\ék\ã\Ú/ˆ\Ìj\Ç_ø–\"4:}\0*\ĞÂ»\n\æüMyv0Í¡€ŸG\ÑNeÜ¸Ë˜\\Kkm¸\Èq\\Bu`±”¬8\êø\"\Òş\çüsû„­©´RE¡]4±¨/l*³H‡\ï\Z„n\Ö>|dş£¥.‰P”¶–\áÿ\0`•G|³(;\ÕX`\â\å\ÄQ}Gú–M%\è®%˜ø\Ó2Ô…M“\Ü\ï¿ôP-\Ñ-×Œ\ï\Ş3†h¼|FÖ£@®¼z(mµAu\ì@Î´$\Ãûñ´¨\Íb5\Æ8=¥şRX«§qed\éw†\â\ì0‘k,a¥À\î‰B\ëªÁò@YŸY˜ç³›½¥i+\Ï\ë\ï0ö^\ÓAN¢D	0gCx`İ­\ì\\,;\ÄZ\éjq&\ZSº\æ¡(Ub‘}”\ç\\\Èô¼“œ\'XKŸF\Êû_Ş²\á¶\Å~a%\ÃÀÀ·\Ö`ˆ\Ô\Õ2¦bø‘¿¤P.‚’®\İLO º\ép\èZ\ĞÀ^µ\Z:2\ìM•¬ñ\ÄŞ–\Â%\ãs	\Ã9¬Á<ËB¾Ÿ0)Á\Z[{\nª3\ï}\ç¥&ó×±*ˆ.D\Òh65\Öeğ’ÿ\0DQİ§\î`q”¨º8Œ$™%¯Û¬F\Ì}\"\Ëi-·9%m\éí¿­Â‡P‡$¤ ¦U˜´;5\r(,\"\ê\Ô\r™^\n¸ö\äğ\Ï\ŞX\r3¢ó)F‚t1‡l6J·YŒµÛ“\Ğ19~o\Ä\ÇI‚˜|C“KJşˆ,—\\]Ll\Å}¦.\ËCñm\0³\ÕÁ*\ì­?¬5\æLÃ¼¹ø¨\ÒÀW±\Ä?\ìA\Ä5S\Ó<\Í^¢\ŞA\ÔÀ°2±\ãü‚Ù”[\\\ÔOxœ·Ÿw\ÆøŒ92U@n‹­\ã\é¸³\Ã˜&\Æñ¼Ï®¦\Í\Ó7¬µù/W¤° ­#£•­¸3†¨Ú¬^0\'ej{‘\ía\Ò)KEa¿\ê^›¾&&1ş\×t¸\é<\r¬h<©G¼\"V‹­:cĞ¯N§h\Ø={H\î,*\Ú:ù\ã\é\n‚\0`»÷¼E\Ğ\ÛjÀ\ÓtŒ¹T_¤\Æ\Ì\È4w%M¥ÁÈ¯\Ä	\\\Ø\Ü–\İB˜Vø˜£W\íıÁB¶¶³ö\á{LW¾@¸·\í³p\ÊpN«¨J‹b­«#ıkv.`ñ9C0AVš¨„\ÕA9\Ò¶¾\Â\ë2\Ø]õ‡]ÿ\0¥‚ƒ¡Qk®ƒA\n¥{¢İ¾¿ò\0¬lğò5¤7=ÿ\0\ä¥%ô\"ü÷Ó?[¢¨µ¤\ìuó.6k\ã\Ğ\ìKŠ§r;ş5x]bÓ’\ÌTA}\Ğ#*­W\Ù\Ç\Öo¥„¦\Ï2\Ğ\Ğ\Ü0‚\å8N\Ò\áYòdrôˆA\Zm8÷˜ €„«\Â\Zg–#T`*÷˜\Ô\Ztû[¯\İF%®(\ã\Ş\Zƒt\ßy‚jÿ\05øôµúm_2ÿ\0\Ô_û,ú´ü\Âq‘M\İÀ°\ã1\Ù?@o\Ò9\Æ\Ë%\Ò\İ/\ï\íñv/x\ä\î…k§3lÅ¥z;”Üº€(â¥€\àü?VN\ïù,LªqøN“!\Ò+±¬üDíµ—•Œ)JŞ…\ÆË¬]\ïƒ]şDâ²‰Juıñ/`˜Â¨À°3g\ãM\ÉHkÄµš·\Ş\â\í(\ï\É\Òj m}b\ÄÆ°û\ÃW7\ÇN\æ\Ï\ÌÀª3†\nF3\Ï\ïyu\ï;ŒU\ÑüN._7ˆx3“õ¹hB¸\rJ÷1U\Üw2Ç•\×ûşø¨¿©8ŒD\ŞfX6J¨Xe<={K ¤\ï6Š©yx\É<./ 1I†lq\ß\ïh\ÖÖ¼\Ù\Ê\Ã~7\í/F8µ:\Ê€€`QX9¾!h\êS±QS\å \âv‰\'ƒd\Ş¬™~J;w\ç˜\Ínx¶¥FõGh¼D%\Çœ©rp‹Yc\í\Ì(\Í\áoEI\Éw§\Å\ÂW|˜uù`9\Êh|Â¶U½a(ªöfø	jX»\çô…4>\"aQ\Ü`is\Ú:ş¦\0\ZM\r¥€\Z\Ñ}\ãEQ¨C.Ë´HCQF\İ\ÚÁö…9¯gH¦ \'4p~fÁœ˜`.Ğ£şLÊ®ŒŸO\Ì\Ùi–\n€”[\ÌB,nVaEcCg\Ö6n(C}ºÊ8˜­F•\íız(d\äøş\à`\ÃZ\å\æ]\ëÏ€\Ä\×7P bu´>¬\í\Ì¶\Ö\×W?˜¢õb6˜3°xƒKL\ØQa@üAL8%\ØÁ,reØ”\Zøb#–\"PŸvÆˆ\Ğ6^\ê Ih\åw9ƒ\ØE\Ä­xM\Ø\ÙûGõ\Ğ;¬K¯.¾ğÎ³2ıÅ†\êa\à\ç÷q\ìU\0\ç\Ş\Õ\ãJ\Ã«8\×L\r\ì´`ŠûU0*[û\×ÁP\ÆJ³U\Ó\Ú1:›V+	\0Ã±ğÁˆ:—‹\å4—+9\æ\ëV3%Ç„ı\'¼O\\ÀŠ§¸\Â-Áˆ)eÖ’˜m„uP*\ç\'Ü¼E`\È\nø…j\ãR\ä\Ñ _4Ä¶ş\å<\0öü\Æ4\å=„ ºÅN\Ñ\ÎYd`­bwT\Ï\'±4\ç\éMß‰}ÒŸŸ\Äw-—\à7f¡B·O\â:—yLw ¯k\íG\n&Š®f\0<÷ x@rc7 ¨W©K\ç\ã÷ˆœ*qwB®G€óe\Í\İ10_µJU<oF`*ÿ\0X\0  \ÅN¢Ä®¦O¨DÀ—#¨\ëø–,Z¦\å3*÷P®ùKÑ©p\íi/%©\Ó\ÓO“˜wor-\\\Ó\è\åöŒ¨%\0µ\ĞK#±²Òš‚:x™¬s\Ò$\Ú\Ê\Óp\çD\ÖAXÔ¼\Íö%=e§*û\Â*„A#\ä·+v0¦ùê¢š\Ô¼²£\é5g¯\Ş~ 7\Òº{ùK\İÅ¹\Ô´&6Š»b2,SˆNt~c°\Ã~V\âi™ æ˜±÷ıı\Ù0\ÚôûCô1ƒ÷A¶w*•H\ÅST\íø‡\å>†±ˆ8\ÊS©º\ë\Ä8\Å\é${N\æ\ær\êİ³\Üä®•,k¡Q\nt¨\Z\ÛÑ¤t›¿©ŸÌµOk³úÂ½EGZŠ\Í\átƒW*¦iğA“¿\ïè–µeğ?\Üy\Ìp9\äŸzu¥\ã]2ÿ\0pösj\ÊZ›=\r#¢‹Q¨®\ŞGñı Àˆ\á\Ôw\â\é¯x\ÉÁ±›Î°.òNr‚„±\Ö	™\ì}¡\Ã¢\Ó\æVg~&\"\éü?Û¹ƒı•‚šV5ÿ\0`YK^\æ`Ü€áˆo\éN§\á\è‚\ëUüĞŸ’(¢•\ÖCOEK\Çx\Z¡lˆ:\íDF\Ù\í‘)\Â`\à”,-Y€\'!5±¨\à\ÃöH\é~µ®\\¼\Ì5ˆ›+\æ&VL©Æ…\Í_O¼µv<o\Ìx†ol®ä³¤·õ-udV\ë§h¡Ÿdˆ²½\â\0\Ó[x‚™¬t\Ç\Ô\Ñ\Ê\ævÓ› ![€Xµ¿£9ˆ\Ù÷–\Ìj8‹·ü—DsZO´{©\Ü\"R:1œNc\ê¨Ì‰\í*‚:!\n–]ù™¢ƒ\Æñ?[³\Å\Û(.\ëy\ï0@z\ä±7M_2ş&Y‰‘¥9úG\Ô\Ñx+J½üD¿N‘¸r~\ÜLµ_@!“\Ô¯\Ûe,´Í‡ÁcZW\ÊNô\çø*>f“«8\ÌBqD\Ò&¹\ë2ğ~\Ìw9ÊŸ”Z\ÍXtˆ•Y¨)²\ÂI¡¹\n‹cO©¢-eQWwö\"\Zø\ÔS¿\Ä;Œ‰-d+[1öa\Õ\Úr™\ä`\0±|À«ñ\êú>›Q\êÀ\Ã\áûÁ’¦u\êı\ã¿\ìÍ˜>?¹q30\Ø\ÊmVO\Ë~©Qµ•c\'\ç\ë,t¢“*$t§>´€i/\Êõ}Mˆ-½\æ¡\âlT\Ş?•û\Ìû#\ì\Í\ÓôSim%\È\Û/\Ù-\à\Z¥{NbÉ¯WD>Ì†\Ê\â.}-=-•ÿ\0t5i›\ÄÈ…+‚¯Q\n…ÓŸFô\Ú<vN\Õ\ß\ìC\n­q\ÜSV\Ë$\0×¼E\\\ÚüebŠ€k´Yµµ\Ú\ËeR\ÒG\È£6}S\Z—Ÿ}+ ÷©„V¨qo£khğ1\Ô—Qlû±ô\ĞÅ’i.cg\\z0×®ğ\'‰¸\Ó\Ì+ù\"°N\×\0\ë¥\ì¤c\n!=G@‰„pŒ<8^(7 ‡©xŒ% @”p\ã?B\rLK«Š\è¶-E[½j3|3^\Éj¯ğEAc\×(M?U\Æ:šDô,\ÔiVZ\Êo¤\é\ÓØˆ\r\'V\æ«õigHŞ´¿Wğ³wˆ¤\rÊ’Ÿ\á|šüO©ô¨\ê¶…Ÿ1Š\×p5ó7Y\'…k§¬>aZ¨\"˜c4Œ\æ[\Ú\r\Ô@5AB)¤\Ìi@ö`\ÅYhº36”•óôDØy\àO(+h\Ï|tE${8€(\Ä TQFi\é¥\Î† \ì†\Öq`/ËœKZI„\ß\Ğ\ÌX‘GO¤‡m¾_\Z•$;z<%\ÊU\É\çŸ\Äi#BËˆM\äˆRù\'\Ø\Õ!`	\ÚV%ˆ\Öîº¯0 5dt™ÁR£j©¯Š”²¿BŸˆ‚€¶•_xRY\Ö	\ÖS¬[Œ¸±bù‹Œ¶#¶“\Şı-§—ıÀ\Z‚£\Ş\"\Ì`¤‡DMµˆ–@A9¥:@ó\Zˆ-	\àÎ–¿[gV\Z€€€õg´¾\ÌÄ©R»D•T©Q\"O=„2»šk\ŞOH^¡Ä©³~°ı\Ì=\çÿ\Ù','jewish.jpg'),(190,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\r(\Z1#%(:3=<9387@H\\N@DWE78PmQW_bghg>Mqypdx\\egcÿ\Û\0C/\Z\Z/cB8Bccccccccccccccccccccccccccccccccccccccccccccccccccÿ\Â\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\Ã\Ç\ÑJú“›3\á}œ¿W (j+YMzO–\ÓËz×ú[\ËÛƒš»›1\ètX\âp\æ2v\áGN¸Vl\ÇX5\è~[G>u\ë^s\é\ë/nI\0%+]<º\é\åaw\è>w˜Ÿ\éôğ>‡šSR›U9\ÒYİ˜\é\Ğó\â\ìr«}9Şœe\ë\Â\Z\ÏGœ\Õ\Üzlòg£§\'\Û\ä…\Ê¬\å\ÕÇ§§\ç\Æ\ßV3øº¯”\Éö{y~¾{xzeúrÁ\èğY·óôt¼»¿Ÿ+3Œ>ü\ïW\\õó.\Í\Ó\äÕ·\Äú\ÅÛ€ Ú”\×_Ç¾ÿ\0»\Êh¸\ŞO\Ï÷CZ«z\æúù¹vğô*\åú¾b±Ë§—£w÷bb\î\Ï×ŒXô,O6\ï.L\Úñ®_¶ò»ñ®œ­©.==??=œU\á\é\Ã\ß\Ñ\Ë\ÛUo<£]?¶\Ìk7^ûx\\*”\Öÿ\07¼º\Í\×Ê®	=.¹¹g\ÊËœ¯wW7SÈ­§+]úkâ£¦\è\éU\Íz\çV¹E\Õ$¤c|}Z¹z\éÜ£§Ÿ?O,—\Ö\æ<:*¨\Ã/;R‹sB\É\\¢µ¸¯\\â€¨[O\'®\Ü)\ß\\ı%]<ùºy\ìù\ÙóÊ–6\×\Õ\Z¦\\Ró´¥jÕ¨¡˜\\\Æ\æ(\0¨5rôu|~—%=ÿ\0O\nõ\Æ{^vyŠ#-}j¨”KÎš\æ\ï(rÍ·4\Ö71¹…\ÌnR \å\éù}ºyt\Ã\èá‡¿•„4ö˜¶g$Fj®•X\\\Ù\ÖÅ©œÜ§@¸…\ÄnU‰\0¨*\0r3\Úb\ÏH\ÛÔ€ˆ®L\ë™:e\Ş%5<ô\ZW0\Ö+¸\ÊB’X\0Rû<\Ù\Â!\nÀEs\\\ìô\ç\İU®u\ë6g B\æ7B\0*\0\Ã\Z¼!\Êó	c´liÎ¹y\ë\Î\ë\Æ+n:6¡¬\×y\ÆÄ€\" @+\0\Z¢,ú¾z\ÙR‡ƒ\ÌT:–\n3\ëYNc¦Mò·=†±‚!PEB\n	\Ñs½\nºO\"‘\ÚXK0!½bk‰l\ZÏ¾0°\0P\0\0\0\îs\Öú\ÖK6Y„-#¥œ\ã@…\Õ[¼\ìë‰¹Fùİ–MDV!X‘\nÀ@ˆ(\Ö\Å\İª\èD˜@\Ô6¡r¦i®e¹ºr³;EI	\n\0\ÑÆ¶Fú\×È…¤j\ÌG CZ†€«…5\É\Ş.\Î\Õ\Ív \0\0@\ß\ÏwYÑ¶]*\0%”³+c°#Ÿ\ëp\ï:1·,,B°*€‚µóÕ–t#el@\\8Q\0	x2ò·™\çU\ë5\Ø\0\0\0\0\0\Z¹\î\Û/:Q®\Ëe\0\0c° A,eç§ŸÒd\',\æ\Ò EI\0¸·\Ë;:1®¶¢\0•€\ì)ˆ%Ya^^ò¥¯Y®€\0\0\0ºq«,¸\é\Æ\Ë-\åpĞ£@A\nRUb³\Í.\rJ\ì²W)HH\nÀBM8İ²»:±¦¶!+M\r\nT)HUË®\r•jN[\"\0\0²\ìj\ì\ê\Ë4CM–ÀJ(¥@A)£N}”œµª\æ\0\0\0\n\ÉK§\ì±YÛ–\Ób\08)\Ò\0‡!Z«Îœ\íJ\ì\'4\n\Ä#¬‘£¶W¬î— jK\0<\ê\ÇNy–Àg>Zj	\Z@5»\Z·:…\Ém5 0¦\0(pJ¨\0L²ù­)¹…JUB!XÍ»:²\rN”m]vNhSAªP\"œ1jB\ÉKd¨…ˆ†²h\Æ\ç-–;;R\Şi@t\ĞA)\n€GªlªˆU]‘B€\Ü\ê\ÜYR³¯.³U“‡M\0T)P\0  „F85Î²½DJVW¬€J[q«\"Ê™nM#¦€*\n\0  €\ËoR‹#R–pÿ\Ä\0&\0\0\0\0\0\0\0! 01@\"A3ÿ\Ú\0\0™nlt\ëôğF;,J%5›\ÆôL²\Ë\Ñ!\ã%\n\Z\ÖBTñOt	IEfù÷c\Ã)¤™†9µ\êPı¨¶l’7¢1¡¡\ÆÌ¢Š6›HE¢\äfŒ˜û°cù\'¤ŒLNõ\Í1s$«L´&&B\\\'¦mTED¡£<)öô^ô~³I\Æk©dó\Ù9ÙV?e\ËDfœ¯Z­Õ¹.\Ü>9\ÂjJ\ÉKŒÓ·cše“\É\Ù\îq‚C÷2q\'\èd”·2Y¥-_f\çÛƒFO\Õ\ëEj\Ñ8“‡‰÷ÁnqÆ ‰p2^‰Ä’üõ¦Wü\î/U\ß(™\"?:tñ\æR-²xc%\'¯Áo¹x8“U­ş5\á’2@j‡Á¼\ä\çğ\Åø¤Œ%(\×\ãƒ‚†‰B\É\ã2p{+ğÁ‘}\ëVdõ8\ÊıEœù\à\È1xXÑ™Rœ´Q88888ñÅd_r\Õ\é(n>²2\áQRt{6\rŒ\ÚÍ¬¦Q^2,^«:œœ¾Hª\Ì\Ü\Í\Ì\Ün,²\Ë,¾È²,ƒòd\é”\Şl\ÆI‰X’Gò\\K‰üœv­1±>|Z\ç	P\å\åZc|¢\ÉGU%I\ê£f\Ãa´\Úm(¢Š\Ò\"\Ó­E\Óòu>Uôf}	™:_Š#™¹–\Ëe–Ye–G\\R¦Œ~k£¨\Ëò\ä“\ÑBÍ†\Ói´\ÚQEh„zx\İ\Å:~^¶n8\Û\Ò+G\"\Ë,²\Ë/H\éş`‘ş\ã~\\˜\ã–BN8Äµ½³‹µ%\æê²¹Í¾Í¥Q]ˆC\åtÓ³ıƒ\ãË›¥Yeôù\èúË‰ce–Ye\ëi\ì\Ëd?ƒ>E\ÊV\ÛÒŠí³\æ=4÷$Eñ\ße÷I\ÒÏ“|Ş‹ÄŒfXú‡Ÿ$n3Á5/‚cƒ–_rô´™‚[ ˆ¿=!\Ò:‰+ÖŠì½zym’õÁ—\Ô\ïs\íÿ\Ä\0&\0\0\0\0\0\0\0\0\0! 01@AQ\"2Pÿ\Ú\0?d$½\ßõ]˜\Æ\Ù9ü-”¨”-e“!!2\Ë\İ\Ó\'¦5»#Á8ó{F-“j?gñû¤ú4~‰ª•Ó“?TĞµ\Zò~ÁHDØ™‘8ü”5º)W\êŠù%&\Ë!:\Z\ßJ4…¥{\ê\éä‹¡L„\É!­—¡\ì‹,L\Õ_=Oún(©*cüt-%SS\á\Z=\Î\ÊTCW\ì\áø0M‰“\ê_D¢\ÑDbAbŒ‰\Èd\'‹#%/jê¤©tB920Q\Z%\Ã/½f1’ğŒ¬±\ïfr\éüu³5|_£c\ë„2f)ø‰\Ø\ÍG\í\è>w¼Põ·}—\ßN¹!ª¥¶¬\ÕWat\ŞÕ²İŒ}›}ô÷B‘cc³{>\Ä\Ù\È\ï\ÚE’\äQ?f\Ë,C*\Å\î¡ó³eœõß¦¶D¥²E£ƒƒƒM\îº\'²‰‰EW¢º<EÁfLÉ™3#\"\Ë,²\Ë,¿E!²¬\á\"\Ñh´ppq\ì!û\ïtŒLLJ(¢¶^2\Ë,²\Ë,²\Ë®¢bbbbbQEz\ëk/°½J\î/fŠ(¯v\Ë,²ı\ê\ê_\ë\×i€º³ÿ\Ä\0\'\0\0\0\0\0\0\0\0 !0@1\"A23Qÿ\Ú\0?Ct‰;{üoñğ·JÌ™£\'£N¥¶µEj\Å22/ƒ2F£\ÌQ\é9\åQ?“$Ô¡Û†}IH£¤¡“bb‘	_•ıŒm!r\Ë>˜˜p\ß\í#\ãü3bøû\Ç\èkx¢>\Èz„«T4I\rkK¹Bf)Z\åù\Ñ­gÿ\0[1¥%\ÜøTFOh[–;\ĞF5\ÂH­4bT¹e‡R1g\éıf<°]\ìÍ›\äıbc\"„´Õ’F¡É±¿@øÅÁ,q—\Ùüh‘Â¢W*\\r\é\à\Ù\Õ\ëI\Ñ)³­‘\ï¨í•¤ı\\¿[Æ»%m\íz¿dñ4S1Ã‹ö«Ä¼TW­eò½W¬ö¸=!¿Yò²ô\Å\ë=­=\Äb\Ò^º\\V\Ò\Ógs¿²¸¥®£¨\ê,²üŒ²ù.(l¢Š(¢Š(¢Šò=®6%¯²™\Ü\îw;ı\n+ÀÄ½õ»:¢\Ë,²ø?J\Ë/TQEQEPıU§#¨\ê,²\Ë,¿Ui\êŠ(¢Š\àüY|l²õeù†¹QEx,²\ËôŸ»,²õEQ[~j)¼W\Éù¨¢½G\éYeø^½E\Æø>\Ùÿ\Ä\0%\0\0\0\0\0\0\0\0\0\0\0\0!012@ PAQaq€ÿ\Ú\0\0?ĞŠbj‡ˆ¼Ø´\"ˆ±\ZJtÁH9e¯B\Æ)\"¼W nı\ØôOÂ‰\Ğ/\nfÑ…§\Ğ|ñ®[T\\B\âZ4ô¾<O\\\r¾ğSD›¶!|Cq\Åõ·Á`&\â41x¼\\f}\â,\ÅõĞ¦\n™»\Ö#M8pß—ÿ\Ä\0%\0\0\0\0\0\0\0\0\0! 1AQ0aq‘±@¡Á\áÿ\Ú\0\0?!0P´³1ù\Î‚Emo¨\Ù\ÖÄ‚\ËBˆv\Æ\ìu+\Ş.›,ózpIU‚±\ÖPR\ÓLa2¼)NŠ~†\ØE–\Ğ\ÑØ§±cœ‰>D¤–ˆ„·\Ê\é’}ù\ÃqVY¶.\á	…Qv&\Öø\"d\rd\à†,¯Š\'\î;&2=ly}¬õ;0™G\Ğ\×Lh—e\ã°!¬‰˜D–D{¶\è®Pø\\(\ìb¤]ğdQö¢¦n\ÊL£”\Äôø!ù(t;ö[\Şx­t}®)¦\ÆÁ\nN\Åa‰’|\r\àùkE[B~‚·\Ô<\á\"k\rÇ¿¥\Å(\Æù«V&S¸7c\å1\á¢Ä…\Ş\à\Æ>lC]¡`—”!¨\â¸Sh›X\Çğı“£|P¹qÄ…Chp2„\'\r\Ş3À›;\èwæ¥–V^at9xğyBˆm\r¡¿ğ6\ÂøHBD\ØA¤4ˆB\ä,°¸¡3ºƒ›]ì¢²²²²²”¥)yËƒ\Â\ë…,[Nˆ\Ïv/:ˆˆˆˆB2Án]8–›¤\è\Â­„\ív_¾$TQ³yOxd5D ğº\äh‡³z !\×(¢\Ë\ã¢d\Ùe‚—)\ååªŠRTAcQ°\ÚxYÁ ˆˆˆˆa8Î²AmR˜¥\Ä!†5f\ØH;¥ò¾…\Ñ¢\Ê|pjûDjJˆ,»ê½¼_£öW²‹,¢ˆ0Å<DfZ¯\É.\â\ï\0>\é{üHô?œv+,²ó6\Ä-£B5CU^\r|­·¤†±:\é\n9‡vpı³ö~\×»¡†\à\"Z;W\â„#:\'”’Çûg¥QEÀq\rQ\ç—\èRüLpMOı\rÿ\0ø\Z/Ã¤=\Æ!1E\à\Ê¶ªB3f\ÈBqhzGŒ¼\'‹(\é\Æ&ckıH\Ğ]‹\Î)Kğ<}ôG\íü`÷¾T|ğ\ÚÁı\ìŸ\Z44\ïc\ÜB-¸&Q4;\ØıY…ş!x¥\Ìk½!°‚)rœgıGB·‹\èj\Z“”!8\ÒCDU…\Ó0\Ã\ä{ùeŒ^“¼´U|öğ*º5ˆ\Óô/\è\ì\ÓMZX¡„/š\î –?ÿ\Ú\0\0\0\0\0\0\Z0:¦‘/Š÷\nÅ·Ø´’½)]P¼B,ğ\îl¤Q\Én\ŞX i\'l‘\ê\ĞbZ®ğ÷\î\ÂÁrbË¨#ka°$­s«…L\ì2e\âÒ¨õ+½ .OgŸ4B0t Ÿ\Ä\çª_$uq•0>¡ñ\Şs\å¿\ÜÌƒ\Ù\nzÀûñ_û\ZaNTš\ë+\èBÏ;t“ß“Š§õ\";d\éÊ’fAÿ\0¿“\Î2EF¤.á˜©š\Ê]\í I3bAd\å\ÍWZ£?L>8~\ç>V\Æ\\‰¼`Ÿ\Ï\äD_ûZ@/S5’\ÊiŠuô\ÕOlc\Øq\Ä\ÓI$’D\"’U¸,œ[E\ÎV \É(\í\ÆØ¤g&Ü–\É\0À\Í\ÍYà§«[µ\àuM÷m*Y\Í#½fI	KI \'¥\É#¡\ã¶Ş’\'5\á¥¡a?£\Ö‚£$ÿ\0%­ø	8q’\Å\ä\ÕÀ†\é%qôŞ˜$8‡*`$pˆ-©”[\Ç\Õ\n\"n =\0G0–\Æ\ÔK\n\â‘\0Mq\Æ\Ô\à\Òÿ\Ä\0!\0\0\0\0\0\0\0\0! 01AQa@q¡ÿ\Ú\0?4k\Ï\Ô>(H†ˆ§Á,9ô+\â€¾F\Òôñ2DF±±º’‡\rbc\àø¤AV†şù\Ãt\ÛÂ²)\éC2ƒ\Ñş#õ	<X!µ¿_¢m8ø¤!&\ß›({B	6\â6L[\ØI%u\êa\"•t‰Z7Ü“£Ø„Øª“‚BBÿ\0\èxôI¥zf\éš~#ÛŸ‡´\Ã|\n;Ğ¤¢e°\Z¨5„$\"Zmôy\n\ÜB÷ŒUA¨\Ê	+bô\à\Ø!`¦¡rx6Q3\Ò	\ÂÑ¬!a\n”JH\Û\ĞÃ‰—…o†\Ä0´\"‚E.n\Z<°›+>\Z¡/xB¡„µ\éF\áJ\'”\Ä4x&Q12”llohhhtµ€ü‡Ä‡”Å‚bb \Æ1òsÁ¢zxJ3\Êb	T0´2 ŒD¾–\âğ„\â°Mh ‘\"\Ö\Äú\ÓhkC\ÃÀt\ß\\\Z\ëm‰\Z´D½ƒ!´>´1\å¸Chn\ÈHL\ÔD†\Ò\ZD!N‰”<¬7\nQmm\r$=²Š++++++Â”¥)K•\ÉğQÏ‚=#¶!¸ ‚\"\"\"\"„!;„\à\ÅL‚‚¯Áz_\éE”YEFFFl\ŞXŠ\\¼ø\àœ\rĞ©÷€Qe÷ğ\Ñ0¸z ù\n‚zaüOç¦\àÑ£DD\\o\nBrø:ÄˆjûPû\è†\Íú?è²Š,¢Š#yb\ìõ\r`ƒhş\n,²\Ë,¢ŠX}­cÁºB¸O\ïDd!ğ](¥Yo7…•••••\á°Å†ˆBuBy\Ö\Â\nR”¥/+‡­\rôD&¢ò\Öa®…˜ˆˆ‰\n\â)\á<2ÿ\0\rğB,!\ÂÕ‰\Ñˆ¸Á±\á¥.P²´\æ{“\Z(“4¦ø6„1şÿ\0‘\æœYüa\á÷!ñ§ÿ\Ä\0 \0\0\0\0\0\0 !10AQaq‘ÿ\Ú\0?›\î¼\ï]÷ƒe\"÷…5G\í\Âq$ğ$\âÁ…ˆ<³%~\Â\Ä;ı64ö`¾%º\à7²úp`“0\Û,™s\ß/FõoHû	úì¹Œÿ\0¦},|\'	øI^cf\Ìó½lmKp\ÃÇ‚k”X=¥¾¿ÅŒgô³1şj(|>¯o°‰ô„¶Hò-	\Ã%ş3{\Ã\×\Ãş\Ä~Yı†\Ñÿ\0\ì\ïørŒ¢Á’«Sn½\ë\Æ$²6NR\×\Ò\Ôg¬o’>\ß\nò0oùY\Ñ|\"Ü–KcG„ˆùvSöS\ï²‘\ï.bL<¥°ñ\Î\å÷%–˜€t$‡±ó”†?º=-¿“½G	±\ÊY3<‘;&\Ëşp¯T“!÷†U¨\Ù\ê‚\ÇD¾F \Ş(‘—Ÿ¶u9yc ‰‡¶³¬~\çù\"\\0\Û\Å\é·%…†\Ûm·õa\È\Øò[e’á€·o,²\Ë,²Î¤’Idœ?l²û²O{A\íí­­­­¶\Ûm½¯\Ş~¸H\ÙRÙ°$lY³b\Ò\Ò\Ò\Òòó©Á»…f[mŸ½Xah\ÄÍ›6l\Ø\êeŸ‹m\êôùk\ç\á;ıpdÉœmmmmm\ë–Ye…˜sœ}„%­‡\ê\Ç\äty¸¿ñË›6,Z[l:OM¶ŒÃŒr\ÏcıX±bÅ‹9ğ{\Ëyy³Á\È\Î0ùøœ2GG†\Æ7–x#a\ÂşA\Ã,X±eœ	\àmµ•n\Ô/Fj Ú·Áù&9$²\Îg(¶\íñ}ƒğ\r·†N	1\ã|\á,`…\êµnİ¦\ÏÀÙ‰ôˆ²\ÎÍ@¬r\Ûm\äLG\Ù1\ã{¶8bÎ¡e–Y\Ë3m\è\Ş?f›a\ìœ?\Åó\àı\ÄG\Ô<›\ã\Çú\à\àı˜Œ¿ÿ\Ä\0%\0\0\0\0\0\0\0!1AQ aq‘¡±0Á\Ñÿ\Ú\0\0?h¹}Ø„4\àºgßºx·¡\Ó:Ü²?\\\è@\Ñ<–E\ï\í\rƒ}\ÙXù0\é\ÉØ–\ä\â\ÂQ\Ğé‘ƒ\á\Ûyx˜O?iØ–\Ûaˆ,fÛ©\êh[y>šs–ï‹±“\É\r„ã¯›[d\'@³‰€\Æ|:®N\Ö\çk^\Ğ¼\ä®\ÓÔŒ¥ø«y‚\Èlv!4\ß Áô¸€É\×hQyb\0\\3Á\É+—¾ ;q¹°l0—5±{`Sˆ;A-p\ÏL‚\Õ\Ş<.Ã§™iš\àcG¹÷c\Ñ,›\Ä<\Ş\â$o}Ys\í°dì¹	ü»-k»Äµ…ˆƒ\r:<\r¹\Çb\Ò\âÈŸˆWC„‘7e`÷\æıW-g7\Ä/pÉ›ˆõG=)`ó\È\î\ÜFg\äœ×h—¤Åœ™¹‹9®Gƒ\".\ëX\á\äğ\ÂÂ¯¹\Ş\Ñõ)j\Ùn)ó,3R~K\á¸a\è\'•,mÌ¾a¯³‘÷ˆF\"CH\Ñ\â\Ì\á rR\æ ûƒ\î7\İÏ»›Y$½ô\Øeh/ì³‘¾»H!s\ìgº\ÛvÁ3Kb0ñ<Y®\'„K¤²ü6ö¸!¬½¥\Ø‹œu|õ\î\è\Ò[ \á(¸cùÕŸV=X‰9?OHh½fI¼_³õ\ØzoG“\Ñ\İ\Ó-Èµ¥©…\ã P’–&Lœ°°°“¨F~Ë¼®\Ûl0ôù\'\Ü~	³¢Z–Ü”±,ºÁ\ÄNN\\\\XI%–Y\Ôel|4\Ëõ\'D\ÛEl¤º\Â\\!¯¢T½%}Zú¶\Û~y&DÈNŸ‹™\Ø>l²t[†O)Ã„Ë„üÄ®\ÏH’–—&nĞ±\'BXXHdœÁ±¹	&@‚±°\Æwz°‰:2\Ë$²Î­–(À/T	\åµ6Ád3mü‰\ÛÛ°9|Hzmü¯\Òı~5[·n\×Sm¶\Ü.\Ñ(#öÿ\0Isğ€Àóg\Ò$#Ùˆ\æ`1I}\'ñ\'¹?Dü>³f\ÇFYl³f:óò0ù’`\r.\çùl@Ns‹h\Ä\â^d<\Éy’ø\îgC››0İ®m\Ç\ÜE\ÏS¼ü\"ø·\ê\ÛU\É@sÜ¸Ã«\Ş\ì\×2\Ï\r÷·\İñ\ÚÕ»µ\ÄY1¦=M-/º\Ö\ç\Ü=\Ø\\D„»\ÇÀ…,vû»\à2ş	ô	~³3\á\è‹!-A¶S\â \êÇ»\ì{€÷óĞ›\Ô`c<\r–PeÌ½\Ûbøynıÿ\0òi\ÌbØ­\Ïû–YeŒYgGk7jN/\Ôzd‡	ş£Áü%zÿ\0%z/©>\Âû‹ğ¿+ğ·nX0Œ\ídz‚\ãÍ­­¬,\rÁ›z-\á{%²”y¿•¹pUÀjr\Ñ\Ç¸§“\î¾ûó¿+\è-z-ú³\Ä\î\Â\ç-‚\Â\éÄ\ßñq\î3\î3\Ô\\úŸÏƒ­=Nz°¬\Z«Ø¶@ÿ\05\ïõ¸§c¿\Ûd‡®ùœVß¢_¥¯I~\Ë~\Ë~\É\àl’¶O´\Ù\èB{†\ÙzókÕ¯R#`í“\ÕØ^\İ5vq\â\à\ÕÀ´\ã‹\Û+\æûï¿­j×®œy;H±\ä\äaÿ\0†İ§+•\èşCú‡z¼[÷kks\ÓWˆbN\ë\Ùa/ôÿ\0\âÁ\Üpo\'\×k\Çk†ğYe–tÏŒ¾\ÏMû\"-\ï’ı\r\Û0›^¢	“]@\Îö––{-ªb,\×ÿ\0a`c¼½ö…\Êz½[\è°[E¶øvrZ£Èœ_ñö¼–¾\áù\éÕ«\Ô\ï\×ı\ë \ÂòXO\áboñÜ .,Dü›€\ËÄ“´iQ\îÓ¥f6\ÔLû²\â\âüµõk\ê\ç\Ôı\Ù?]F\Ï7ªÈ¸X­¼•n\ß^g¿k´ÿ\0‘ƒdí‹½=\ÏúeÂ“¶¶Å–YnZµ.]ø9\Â nŸw¢°‘#«x‡];\r\'° FWş tõnƒ\Ğ±\îÏ»ì°°°„${¨ğË¼\Ç 2\ÊEµµø~\Ã\ßò\Ã\è\Â`â§Q\é¾,´Y6\ÇÁ›[[~*9•Y<°k\Ğ~\Ñ\íÁ´h÷Q€|6\r\Ã2v»\\\"\Ë,²\Ë,’\ÉûÌ²\Ì\î\É|6½=3¡ÿ\Ù','cz_ambient.jpg'),(190,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\r(\Z1#%(:3=<9387@H\\N@DWE78PmQW_bghg>Mqypdx\\egcÿ\Û\0C/\Z\Z/cB8Bccccccccccccccccccccccccccccccccccccccccccccccccccÿ\Â\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\Ñò}`\0ÀA@!¨J\0\0\0\0\0\0À\0@\00$k.¹¯Ñœ»Š[pÏ \0\0\0\0\0\0€‚ÀÑş\ÌwT€‰Œ£&\ÑË°\0,%\0!€€Pb(õe·×–°\0\0†3ù6^]D(”A@€	Pb¼\éú}À\0\0\0#)\ÏÃ»|\Ú\Ç.€\0Aˆb°D\0²_G\Í\Õ\Ò0\0\0\Ì\Şm`\0\0\0\0\ï\Æ\Ï~\ZÀ\0B3\0\Ì\å\ç;ËªòjÀ Á@@ºSô|İ¾\ã\È4€À\0‰ˆŒQó½æ’ƒ’\ç¡\0Pİ†\ÏF{PVh,\0\0À	\Ü8\Şm& \rD@O€\0\'§7}/5¦“!yh\0\0’\Ï7™³´|ÿ\0@\0|ô\0³¯«.i¬\Ô0\â‚\Âò³`\Îi8\é^V>}À ,\ç \0eŸK\Í-9¬\êrŠŒ\Èp\Ñ\Ñ+1’\æ\áùş¹kŒq\íÀ«8\è\0O\ÕòBº#”\åqˆ‰¨Vy\ã¼\"‚Ó†•uÍ¾-‰P\Ä[\Åš~·’£A¨\å:\àyóªk\0q\Æ=	i\Ìöeô`üıŠ \"\îz%\"\ï©\å}Fg/:9¦S°XEL…fƒ@F/™í‡£Î°íŠ€.\ã %\0§ÛwÓ–S9\ÒaiY°‘\Î5ˆ\Ö@ó\ç\\«›\Íóm§$9¤ªÀø\è\0W£¿£+u\ãA\Ó9DË‹\n€\Ø°\ëS¨U\áôóô\àóôU`\Üt\0À‡§œ\İ\Ş\ï74™¼ó\ÇPE€39Œg`\æ\å\Ş/6\Ñ÷y©\ÃMùX\ã\ÚÈ…]\ÇN\0ı9¯>ıO—Ÿ¯	³¶Tf,),4“9q\Ïñztk’×‰yu¯€Â ·˜†#\ê\É\á¶\ß–Î¥\'#>»ºs \ÂRk4œ¸\É\æ\ßE\æ~¬ª\å@0wPPvGÓ\Ø\í\Óöù¼\ß|¯ûv\Îe\Ús\Ï\ê@¿‹d¹r\Òù+Ã°bX\å\0b-\æ¹DCÂG\n©\ïYw—«w2¼º¯\'·Ëªó\î\Ş\ç\Ğ•X\0Y@\å!PJPH¨8pıf\Ò]y\Ütk\Îyõ\êo’–¿µsZˆ\0, %+…N€” $:!€D:“ö\á,ôzq·©\Í\æ÷´\çŒKóyuH\re8\0\0!RF±²5(D½9ô½\âó\ëŠ^\ç§yƒÃ´y\ê|\Ö8T†8`Fˆ”¢*T„c`*q£Ùg^byÿ\0.Ş‡ÕˆP#“\åÖ¼z·¤©8\"5\0…I\'.ÿ\0¡ç¾´œ\ìúZs\Ò3\ZO=\ç\Ğó\ég§\0\0\0ˆ¨H\ĞU\İÎ‡³k9F¨2ó™‡pók(” (%b\ZuJX\Ù\Z­Û÷£>a`\Ï8w‹\Çóùuœ9e ”*—5‘²4\0H\Ğÿ\0^=n\çë–•‹\Ë\ÎF]eòm>k…Q²5o4‰Êª\0+\0ªÀ«©\Z³©\ÓöcxÉ–• \Øqó\ë/iD¥djQ>h*±ˆT\áR%¾}?Np7fSA\Í4\ß.µ\åÔ¹±©AOš\Ç\nƒÿ\Ä\0,\0\0\0\0\0\0\0 !0\"#3@A14$2CPÿ\Ú\0\0ÿ\0\Ë\0š\Î0u¬…g8Ÿ”HJ4”ªpeV\ÙE6q\×\×\Æ\'\n†¾\ÃÁ¡?‹¨U·Œö§‡r„„\ĞÑ—\áİŸµ+*3Â®uÕ¾X-´{pò’o©­gj\Ús^*ÙˆV\Ôu,kš!2Xw€\Ôûòò<È§\Öz&¼Ç¨µ¹\Z\ëÔ€oğyUIHŠƒ³/£z@eOo¸¿›Q¨‹ış+\'–’5Œr’5\ì ‰¦zr6ä­¹jBY\í+g\Z]wjŒB%”Ÿ\×\ne\æ’ö$¬®\æ¨-VJP-Œ\î\É\r½\ÊN8]G‘†™eƒ§s¸ƒ[«\æXµ\å–õAğó\ÏQAU1\è\0QX4tbÒ­.D\ëN¡\ÑWuLš\\†¹¯jØºÀ\É\Æ{„€ò¢…!J!/^sÅ‘X\İ\Äm¦‚Q4rœZl’L¥\áA·\Ì\Ñüöa÷\î\ĞHö\Î^\Z¹»À\Û\Ùõ\á3x™H\Ìò\Ï<F+v¦¸ö\äA\"B\å\ã÷³Ú‚Ü¸k‘\nl\ÍwrAµµ³m\Äh¢^\"\Æ7$zh\Ô.\Ë]Uü\0@’o\ØB\çFô¦v\Å4\Æ.Ô£)ª~‚(\Ğ\\ñ†XI\Ş\ZpÓ®a!–93R©•©”:X&‰D–²\ä#\Ëx9\Éû?c¬ñR£P\'‚MÛªşB\\ †\Ûj=&zXcZ\ÄM#\Æp¹¹E‘1’%UÇ¥¿H¦>d\Ów¶z\\B\Ú\ZÈ…†%†z?\ÚşA£‘NÆ¼BWˆŠ·Öš\ä\êò\\9‹øÿ\08@\âpò\\°T†ûm7¦¸s¢¯\Øe\ÍQ²¶B\Û\Ôg\é<\ï·ñ‰¤tñ‡§’X«\Öj`š¬liPU\ÍÎ”€@q¥³:w]I\"_%¢ao8&9Ym¦’£9xKº^(k8a\0†J‘‰§b£\ÊB\àk2W½®”\ÊuŠZV/[	\Ê!Œ±‚\ËBYªI6\Ø_ª\Ôe\Ì\Z¤5\æ2\r#\â>’¿°)`E-\ê8~µ2nB\Ö	BX°õ\n¿\ë\è\â\êrI\Ã4‹‹\\ş°| ‚\ÚdŠ]\ÈÌ$øºô\á7P\ëˆw\Ì\\¿¡kô\ä\è\r»\İJA\×\à\'õ£1™b2`–É·n\ÊU×’œ`õ§{\ë\ë—\é²Q\Z‹…)N©p2·~£J\Ñâ¿˜F·	\ï\Õ\à\ÚO”umúô?\\w\'â´¯­x\Å\îZ±\Ö\í\Ø\"6\æ±\Ş1iw<CD\"•¥¯ù?}³\Ã\ëû@h!a\â\çqº©4b\ì«\\X¾\í´9¤”ÿ\0rÆº\ÜUœ[‘\"\Z vM—\é\"\Ó{´\'\ßpŠÓ„k“\ÚyªRjHùğwÁd}´ö\î)Î²q=\İ94¯ñ\"$‘JB\"\ÛØ«Ÿ\×#Qù²šRª\ŞQDt\áÖ¾…i___ÿ\Ä\0)\0\0\0\0\0\0\0\0@!01A 2Q\"3BPaqÿ\Ú\0?ÿ\0Hõ\'\ä3òù `r™ë˜r `qİ½m+ú8®Õ¸ˆ66w•ÿ\0x.tÀFõ¾MBo\ÎoL.™\İcC\ry\İ\êXj¡´–F¸\Ü\áƒF\ã/ˆs\Ô?©dõúÁö;gœ1¬:œm×“\á€O\Ò6ú?¸\â›¤4¸Ú¾\çKKª¶/}™Õª\ìz‡V\ãh|„\ÈG_¼  ³>ú˜À o}je„WW²\0\é\êyš¶§µ`j€\â2•\ç²5<u£<£\Ü•\èMşÀ=œO5X\\‘UWõ?¨?\Ü\r\èö~{\èKñ\Ğs\ÖK/±>üó	#N\ãø‹\íf2Z\àkÑ£/ŒQf£›=\Ğ\ä¿eo\íhüA\Èn{ùZW\Åx\ËCG\â˜\í\Æ\Êc¾\Êsy\Ù^q\ÒóŒûJ+oÿ\Ä\0+\0\0\0\0\0\0\0\0!0@1 \"2ABQa#3Pÿ\Ú\0?ÿ\0–¨[\ÅOüšıº\×\íÖ§?jh\Ù|ö£†ûµo\æ…Z\"xbü°\Ûu\êÄ™FM<L½8\×ni!¾\ëÑn\×\èO\ä9\Õr6ŠXt]q6\æ,/\Òõ÷\årkt\äS\Ë\é\×kô\äb›ı©£2NH…t\Ùr¤rS-ø\ÇQ\Ìgf¬U–zCv5&\È\Z›\Ó&\Âô£&©\Ï\Ê\ÜyˆtØæ£)\Íø…z TM’ô½C]­Kğ‹’}Àj\ìm\Ï+bµ\éï–‚{š•²<‘\ÃL¥Mª\'\Ìs92µ…\"Šv\Ä\\SHÇ˜Zac\æ’\èô6\ã_\Ô\\±\á$Ë²ø¢\Â1Š\èX¹\Æ\Û\Ö\Ó4Di\\0¸\ÒTÅ³_l…	”\ÖCVp¾k=®kyw>)¤üW¨$\rñzX”ƒM0)%\Ş\Í_\ê?\Õ<v\Üx\Ò§FQ|[õ>M\âL»1\ÉmŠ±uñA¾CVÿ\0#cö«V+üSù\ì¡Úš2§$¤pâ™±¨\ÖË¬«q~\Ô{ N’!5¦`\á¿ki~´C\ã©Le\Û(ùtÇ°\Ğ\ÖAuö\ÍÔ¶±‹¼Q\ëB>ü3}=t2ı=0jú(¹\â—\é\ëB7¿‘¶ƒ[h}Ÿÿ\Ä\0<\0\0\0\0\0\0!1Q\"2ARq0@Bab¡ #3‘±\Ñr‚C’ÁPSc¢\áğÿ\Ú\0\0?ÿ\0K¹E«g&	_·\Ñ_J°ş*A>k»Xµ$œ\Z1*k\áÀ0P\Ğ\0ğÓ¬æ¦“Lø`½\ë$q³ğ­4\Únc³‹­=\Û-E\Î6ª]\Ô[¢l»x\ÜQº\Ë\Æ\Ó{){¶ZZŸŞƒ.¨9¦\ÍF\àQ·E\Â1³z´\Ãi¾Œ7¹Jó\â\î¯ºV‘\æˆV\éº\Ãó\n\ÃÅš\å\Ø]P÷B\0\í\Ï?jI€µŸûB\Ùk9™ZÕünW¶\×\î½|6}\Ão\Ñ\n¬`1¹G\Ğ\äˆw\Äf\×ç¯„Æ…?\İÍ§p·º˜ú•.\×9ºÿ\0n§Ş§ª…qİ¹\Ş!xn\ë…&\âı£“Q4¦\ÎÓ¸B÷²8[ùP\Ñª5RyoQ¸«\'\Zf\Ï[~j»\Z—ü•S\æÿ\0\nõ©ª\Î,ù-Q\íI0\\|¡jP›\Ì+\Ş\Æò¾1şĞ¾1şĞ©µÿ\0K\\Gzd\å	ã“óhfú³òD\î:£\Ïx’¦ †\îg\çÚ€mœš®“|qV\ê¸Ô¾\å\î\Îş\ç²	«®vñ¥¤\×\àyn »\×\Ò1±\n\"\ÍA\İÏ—X\ÑÀ\Éù•\ëDj’\ëLo³fˆ\é\à§õ†ğ…¨\Ñ\ÍXn\Ó\î@w{x?ºŒ‡\Óİ¾1\ZN^l\ÕeÖ‚³XG›r‘´0)µ8¾ı]\ãöT…M™õö5ù)»¥’†^\ä×¾\âD£T\ï\Ù\å\ìE\ãz©\\>\È<*g\Í	¯dkj™ôZÔ§ö•©N¥3\áœ\ÓJ[ojb:ºü\Ç\ÙRiÀ\Ï\Ù[M¸\è\è\ékTû.’¾³ôº6ª<I]\Øn\×\ã\Úp\Û\ãª\r;/S“õE§z\Ö\Ú;š(ùª\ÕÔó“cQ \Èq\Å\É6Å©+¡£¶T›\Şw\é²İ·\Ü*½\ÃXóP4\Ë\Ü÷l›Õº\ï·\áôSRi\Ò-Ms\Å\ß$\ã¾\É?¸ñ+]\×ıÓœ©³&õt›—r\Ğ\×ğŸE,‚,c\ìt\å\Äp\ÆI\ÎmI.\âj\Ö\è\Ür©x\rğ[DrF,»\Ì\ázÖ¥?´«u\Ãe¿\çAiÀª”]½0;$YSY§¼1	”÷¹\ĞQ=]S\ãh«d‚¬w6\Z4Y¾\ä,¸µûòP\â<¸”!¸\'[½¬0\Z­Rl8nnı0úRG™pÆ¹û7O\Í\0.>«\\-[·\n2\'\î£$ú¼:£ŸXÿ\0>°QŠ¥»O}–§5¸v½\Ë\ç\Ê\å}##*ûC›J\ÚôW5\çø•—øŸÂ³6OqA\Õø\"\í\ç\Ñt\r¿‰\ÔO\ÍY`‰B›poY«¶\Û\ÛøRŠ\Ü\Ù?2©œ\å¿ıôN~A9ù˜Ñ‘µš8¦q¾ª*=õ\Â?D\nMÉ¸¨h”\Íûİ—ş«N\Ú*\ÕV‡<\î=Ğ«\ê0Ã·…\Z2wIOk¼\Ü\Ñ{2M÷«¶›xTøIŸ”J—	§\êµ]~Z,†:Ç¢\Ò5¹L\Öø FK\İ\nù¦Ó€\ï9	l¿ºÁ¹[~µ_F\è‚n\ì¥!­\Şfj[ôW.ˆRº7‚$\\sQQ ¹—ù­J\ç“Ä­šnı®E\Õÿ\0N\×[7_+RƒZ™j©kxZ/jZÉª\ì&ò®×«½Ûš‹\Üq~}’\Ô\Øÿ\0+W£ıÖ•ª‡¥¢²ó–U[ôpV™óÆŠ{½\ä\'½\Î. &¹·À€\Ä\à·}ù+\Ä7\ï\Úl¿\ärBM—÷_¹\Ê:#\ÒğnL\é_5K…0ªŸµ0Æ¶_	¼´¶S\èe\Æ6Q\Ò&ú·4÷<b\Ô\Ûc\ŞS6‡˜(oõ.F§q—5I]%]VwFô\êN2\æ	i\Ìv’8\Ü\Z‹©l\Í\'£?õD\é6\ã\Í1¾¨8hen’#´Po7S\é\å‡-3\æ?uPyS\Ä\Ñ\Ú*\ÍT\ä†¸\ç‘A¯¹\â\ë÷\ègˆ¾c×³ß€¼«G›EV¢\ã€RÖ‡V‰¿¸¬~ 4\ãv\n\ÃL±÷8\ì¨}\İ\ÃxS\Ñ\Ùnd§\Z¤vwF/6\0`\êä©³k½z.\Õq&HN,Ş¬ºø¹\ZN½¸´\è¬?\äŸN\Î\Æÿ\0¶\Ù<ÎŠ•{\\n\nX\Ğ4†‹Gz\éX.;`}\Ğs1\ÑúŸ\â{0	õx\İw%Ñ·iŞˆY\İ\É\Ş4Oˆ\n\ÔaŠlÔ»ç¢»·\\\Ş\ÍQ\Ş>i´˜-<Œ\ë:\â\ä\0À&\æó¡ü”¿c\É´{\Ç`†\ßœ\ÏWÿ\Ä\0*\0\0\0\0\0\0\0!1AQaq‘ 0¡±Á\Ñğ\á@ñPÿ\Ú\0\0?!ÿ\0Ë¢¨‰B‚tgp79\0>ôFœdOú…1øñe0l<9\Ê\Ø\Åj\Ê€tP\Ô9û¥§(À´ü\ãvş¨–ñ­\ì6òQı0†\Ø:–ÛŒò\Ù(\ç},6{^SğeÁ\Ùv“Àñ…\0sY\Ïø\ï\á6ò\ÍPº Mü^\åOÈºİ®\0\î„\Êa\î¶D\ÈO%\âl,„§\Ìg¡ŞŠÓ¯½‡\Úc\Ú\0¿Tô¼\Ér\Â\é_óh²xOw\ßD\å–5K(j\ç\è\é\Óø\Ì X(‘÷\Ş\á?\ë¨v+ø<`R\ãds\Ü\n\Ù^‡*%\ê,8\Ì\'üMµƒXø5‘i)ş*Ï¿D\Ãø‡•]¨½ˆ\n@Ü„œó\ÜXù „å€Š<\Æf\Ö<–öHI€©*…ù¢x>SA‡©¹\äø\Ée°šq—ğAK·õ²ôş…ƒ¬‚> \ÅAFÈ„\Ô=X£ö8óL°[…Eej\ì¨m\ÌvE¿@Ÿ§„Àrº\å=Ww¤:ÎÆ£(é‡ Ga\Ût\0À\â\êÃ•j5¬ú4\İ)\êL\å\ìD\é#\è ‘†9³w˜‚œJÁ>“†c\î?2ƒH4‹=ü°s:omı@\×*Á\Â=\İ\Ñ\ZF€p.{!”À`\Ñ\ZCõ#O\Ë\'ŸsAX[Ğ¨Y\Ô\éM1\ZH·\ÔşƒTsø_\Òh+H;Ñ™#ya\é\á\ç\Ö\Ç\ÛÀ\íp\è5(‹ø\éª\ÆMÊ±EN(¢u‘`\Çõõ\à\ÂS\ÅKmv8Wy¨ÁDv H®\Ë(÷±Fï¨ˆÁ\âŸvD›\Ø:7\Ñó€;xLqŸ*#\ŞJ\é‚ø4+\èº\ãH\åÈ‰ÿ\0¤\Ã÷åŒ÷©ªšŸöƒLOÏŸ	€\å`·ù!\Â#ŸB¢?óE@\àd!u\Ò\"~TR\Ø·–\â@g\n,n>\ĞyºE}ÂŸ†\"E¶\åoOaÆ¤\âB¨ €#Š\Ç\é=‚šäš“X\Ş\ë\à5\ØW\Ù4‚;ƒ¯%3‹ôõO¤ \ÈB÷±>\Ñm¶;\r;dğX:\ÃŒ\'\ËA]H\ÌNN\è>\ï\ÑE05»’L¾¦”0Dö ?:Z¢\ç±““\à½\Ñ84h2G%2\0\Ì\Ô\Ñxß™œ	tş‹#>\ìƒ\Ïm\Ûûi0b‘‡P£ÇB¦\èD‹ôU  ğ*Vù-\ä\0\à\åğ\ì£\\Œ%ƒLı¦–‡¨\ÒXø—G‡‡¼\ïK{õ,Š\'|œœ \Ó\ÌJ;\ç5Lÿ\01†n¦¦F´z k6g9&‹\r`C\Øú‡€ıI\Ô‚d«¨¢1«øa¨\0|ŠEM\Ü!ƒ\Ù-\Ù\ÇÖ€	4\r\Çõ9¢o†©üZ8\èY3\íW\Â\Ç\Øi\ÏKù]4\é\ì\åZmŸV;„À\Ô\îÂ®¸8`*^1„D‰0]\Æ»ú½U\É\Ö\ä :¸«“s¨Uy«\ä\Êpd\\Ãª§)“\í\î¶ß¨”\Ë\Ğr:úOû£/„ˆL£‡A\ÌB\rT{?\Õ	º«ñ\Õ\0fÇ»­ºwL§–ú0ˆ@®À\ÊƒdI\á1bqƒ”\"‹;Œa\á5ğ¿€€OmnF\éƒO\"0G\äŠÈ¹\0÷Œf_xÀ!°_¥›¨\Îb†\è¯\"µ€Œ+[\ÇÁ\Ô(l*Q\Êp8)„=\å2–~ÀTZ‡\î\î¦Á`Ë¢I.d”CD#]m\ä„P\"A‰}\È\İ‡œ]¢³@,ıbŒ \Ã<(\Ùº\ËTŠ?)A‰?‡\İ?(\á`\0B\ng0‰øP„Ac›7w&Á\0skQP\Äk*ğÀÖ¤j|#À\'\Ô\è\ì\ÅØ„S \Õ\át\ÖŒDtô_)…¨8\ÅiÃ \Ôü™9Ï°¯WFQ9-”F# 3\n\"\Ì8g‰\'\éM6ö…Er\É\Ö\èW\Ä*®Š\Z:y\ÔdhÁYW@At4¦…±²QÁL\án÷dÚŠ(ùH\ä`d AŒùR\à\È „šTpŸK¦L™_V@\éM²&\ê\Ú\0ÁD \'CÑ‡%?UoXmø§°™Po¤\àèOd\"¢ÉºˆÀI%H\Æ\Â\nU»¼&\Ô&TA+«\èjP\İ\0TSES\Ó[±E\r¥ŒõN‹pÁ@*\íúÈ–rA’\Å1—\"˜{•´š\×YÁDÀ••0È¢B¶†ºğ¯£\è&SC”(U\àYfƒ@T\Â,ò\ï„)¡DŸ´¡rE›(ò3¨ú/¡ÎŒŠt\è•%V2¬\ĞZˆU:\rU™\Ğõ*Ïº\ZE¨•Áô†H¡(ş‰UA&İ„*mIÕ›R5a\n,uQ÷h²¸T\è&Š³¬‹„ÿ\0jšb|\è@X\r\Õ0‰\Ì(ğò›¢\ÙB\0\Ğ&ñ.U\ÙvEÂ¨ e(¸GZ`4²tJ*Ë©;¢{0\Ş\08©T!¦\0`\05\Ï\n0=K¾ŠĞµ‹ğñ8S0\Ô7@«\âÈ¡\à;2\Ø\é N\0\îK&”\È\åY8)Äu®†¨\ÛRoT\ÒgÁŠ¿1¶^f¨˜”Õ†—Z+“\ÉNÂ®\Ä_xN/m#µ\Ù$®\Ê%=ˆ(Q[K !\È\Û\Â\ápœ\é–\ç™Pš÷B9‹½…Ê‡b8uHÿ\06\ĞB0\ã\ÔO\à\Î\å\0›	\ßFR†·5*\ÈÄ l‰–l!¡(–)¡3¢\áU]I\Êrcº\0²c„_• ]\ÄlÁ6\à=\Î\Î7„\å»C\n`0UËœ„Î\Ğp\æ\Èb¼“wÁôO*\ç„\0o?r)\n$\åLB.\î\È\Â\ê$¦t)ÿ\Ú\0\0\0\0\0\0[d°\0\Ğ\n[m¶\Ûd’\Ûd²\Z›m¶\Ûd’\Ùd±\'™ œ\í±\Ûe’\Ù\ì³4\0\0\Ê{l’y\ì±@\0\0	%\ì²/}µğ\0\0’A+%\í¶\Í÷ß€\0H\ÉSm\ä¶Ò€I€\"\åk±\ß\í°\0\0\0\0-\Ğo\Ûl$\0\0\0\0ûj\Û\Ûe€$‚H„ö\Ûd\0€H ¸X\Ûm\ä\0\0\0‡\Ñ{d\0‚I\0H¸\ß;,	\0$7÷i\'md@ 	$)m$–\Ğ\0@\0’\0 »ızvš,’\0 \0´U\ît\r¾}€I\0E[`\0À‚\0\r\Ğq$\0p\06i5-}…@Ê¥†)÷Ùˆ‰»j´\Ôû>\Õ=Bğz\á&E5˜€mó6?•\ÉMó\Ã&\ÒIdœiI›~\'™D„\â>%\è|\İ\í>:d\â&÷\é;?ù]” `r\Í\Í;i$‚IµO.2ze›0C ’H†ñ\á\Ğ\ÛRU/@\0H7È‚øV\\ó9H\Ü`\àÿ\Ä\0$\0\0\0\0\0\0\0\0\0 !01A@Qaq±P¡ÿ\Ú\0?ÿ\0\ÚAğÀ{>“ ~®”*¶ë·\ç§g\ß)Gnù[i÷\ãİ¹”\Ú/à®ŸŸƒÙ®\å\ëlwoÁ\Ô\Ş9¯SÏ‹q9w/P\å\Ş>17vş:¡ú¥…>q­·ò¾±eö}Æ§¤|bÁ\ï\â\n·Xó\ãş!*?,%¢\r˜¾>*ÿ\0t­GœŠ\Ë6œõãšƒ •·\É„\Â\Ê±=)L	S¨[qÔ±HŠœ¡øøZ R\á¹Î‚SlÜ–b!X­‹º!(ó+\Òo{cFğ«\ë’<&§~\â›%\á\nİ•—ÜŠ~„»òh½#Oû\Ì\î=ü¿¬ù,ü’Í›#wwš\ß\í\ê[w?tv5Ö£A¦öƒ€\áŸûGT\Êh\é:3CR²J\år\âğú0I\á¿Áıé°¼V^G­^Gy	½\Z\\T%ò,\ïc’-·\İ\é\ÓÑ†º\Ò\è\êTò^U.\Ì%Ër2ğºœeh²m­\ÍBV‡|.¼o5$¬*/ˆ\ä1\Û&š\Ñy¼m\ÅR\Ü=K—/¨\ãÿ\Ä\0*\0\0\0\0\0\0\0!1 0AQ@a¡±q‘ğÁñP\Ñ\áÿ\Ú\0?ÿ\0‹JÇ—\×c\âX=®hŸ)ıh†:¼U?Iº×¿g\Ù\ì \áŸEzø»ı]¼™†gv| ¼O¼?c\ÔD\ÇÀ\Ë4|ò]\ÅJ•Ö\äø*Jeÿ\0y—\íü|+£]šo‡R\îÔ¾k¾\Ó\ìc¹Lød¯Ì¹0ii\íŠ\â5\ä•\'ƒL\0¡\Ù>-‹\ë2n\İ\Ë\éğ\îˆ€{eƒÓ·dvÿ\0j{–ŒŸ¼¿\í¡Á*_\Û\áP¶.]~ü°\Ï5\Ğ5|\Íôş{ö)¹cMp]¶a\r°\ì9ó\ê\\Û™Wfûª³\ÂóûpF\ß1¢K\Òk¦¹\ÉŒ%8áº„Y|‰^û\n±ı^LòF*¶À„\âùì°‰Tƒ¨	_\ß6¿¿ûS²o±\ÒA½q‚šd¦\Ñù\Â\r\'.¡®—¡%rp(\Ù§÷š˜ì˜ª\Ê0sûOk\áù8U\Ü³Y\Ñş_\ïş¶‡P\éxñR±\Ê\Ï0\İ\Ï3Ló=®=ƒ\×\×\éğ@¬^›ÿ\0¨„¤\ÄúO\â\0aÆ¥sr\å\Ë\æ\âp\ç„\à3\\Vbfi<gò$÷/ıBW\â6m¹^q½’ùe\Ã1Œy®\rF,®™\\ª\ÈJ8<¡7õ‚‡—\ã}	x–‘U6‹2ó\É\ÕS\ÌÇ¤Y™¦P>¼:5\ÓU½\Å.£+\è=qp•*Á*³\ãÊNU«fO\Ô\é›z›¾!˜\îokP\ßB²0f‘\"B’&y¸\ÚóP!Á* fŒo\ì\ìşI\æ^%\Ã\×’Ÿ3\\\Õp9²ñ\Ñ^vv\Æ&1?^V\"d>bÁ¸t\\ ©J—(\Ò>x3ˆ.}eÇ€r\å\Ô35¥>¢7©L,–%\Új\Z%@\İT§0C(\İ\ÔÀ—\r\Ãsÿ\Ä\0)\0\0\0\0\0\0!1AQaq‘¡± ğÁ\Ññ0\á@ÿ\Ú\0\0?‡\å´\Û\Ñõ\ŞC\Ôÿ\0é¾µ«€\îÁ®¨{÷1\ÃK/kŠuc%\ì\ÇeÆ´øBn\écQòMÿ\0ù÷‰:ˆ·\êôê†^;\ã^5€H4 <»\Ë\Ú#\æ/d\î\Ó\Õ\á:b\"R7yCŸz\Ò\èa¬\ìğôüoò¬ş;şªd^¹~¡û\Ì¨°€ı\Ø?<\Ä9ó\Ë7 woQòz\'ı_Á›\Æ\Í\â«@wcƒR-;Gzûÿ\0ÊY¹kù\î%,.m­\Ö##¥i¿ò\è\Zy›üú0 µÁP¨m˜0\ÚAÿ\0ºÿ\0\Éh¶|ö:Ø„5u­õ–o(›C\í÷\Ó1¨ø¥‹“÷p˜F_©ÿ\06TAA#\Ë2)zµ\Èo\ë\Ç\ä[Q\åš\İUw{õò€J­\ÔøZ\ßş \Â\ÉNİ¿&|fTı“ø‡I¤6ğZ\àadG\í,11(M\ÇD¯üô¹p…üŞ›ş\Z¬»ºav \ÜkÔ½@^?\0O\ìA§v¥dµi@™ƒ»®Ó°\ãÀ \0Aù\n \Ğw°w‡R\Èş#_ŒN\ë%oNO1L\0lLŒp}Ñ•øT¨¡*¦¥¯•ˆ\Z\Î&–+ñ\ê\ìœ»­Oœq­\Î)İƒ\Ç3M[\Ë\Ëÿ\0\"‰q‹j­\Ó\à`\">—v”\ê\Õ\Å`ƒ/\Ğz\ËÌ¼fo\ë^´Àƒ4¬ÁUo\Ö|\Ärº\ìa”¢€åš‘z\à]M¯ñ!Ò·mùL¯\Ë]¾XU¡\Í\ì\à|1\ÏóE–Ë§\ì>¡V«¡>\Ñ\r÷\\|ul\nXg›ú¦nwOğ˜‚‰~SOw\àG_Kü²:\0\Ğe<e:§\ë\â\r*Àh.€\î\à\ë\0¸nšr<h:º~D\0-]¦c«\á\íp\×ÿ\0&DqœüCeku\å\Z\ÍUJ\ŞÓ»«Ái£³\n²2Q‹e‘ĞµyN¿^¤Õ°J\İ*\Íd	£\ŞPI’ş3 ”u¦=ÍƒAz–Z\ëú=@\ì97:m\êM\ßø`Bß hb;`q-¯²…D”h\Úg4cƒ&¿€2\0Z®[mh¢\é\äÏ‡¼4õH§\Î\Çv\Ø4R‹~Yx„\Z\ÕñÚº¤\"@`(  \n)cV›¨:\ÙÓ»TKˆ¬PÍ­Á£F¯|\àö:}{z«A­N¨\ä\êD°\İFE6UG\æwQ¼Jï½œub™¾ó\ä\á‰7y=†‡¿¡\Ä*Ú¬¼~T± ‹03\ç+j\nyñµş²ŸıVJ·ª=·\î\ã‚eõ2\çºş‘¤°Õ™\Ú\åc4`#—Š€	\'-Egµ6ü2ş-€\ée5\ÓFj|\á£u³òq0¢ûKQı\Ñ!\Ú\ä\0E›\ám|\ë\ÉZ6¶è”Œ¦S\ç÷L\Ç\ËE§«¯µE(€•¸\İÕ¾` ‡\"^ \Ô\\±noøFd:û$T¤B\Ú\ÜV÷	£\ZÛ¤\Û\×ŸBKŸJ‹Šß£ß‰«—g¯/ƒ\ç\ÖÀZp \á¨-ö\ÂY,&‰_)KÒÄ„@\Õ\ÚXd\ÅJ:™jºªV\ëG‚l@ò\'ù\0†ó\Ğ,ø¹a\ã\ìj;\'Q\ÌB  6Àøu:$²u’\Òå—z<q\èóù«Ş€ \Ú<\â¶4M \Ş\ë\é(:¨¢•_\Ü÷€^·\Ùú¯¬\'7oö\ß\Ô\ã+W :§½^‘\Ò¥\ØQt²\ëF©&—«,«ª\ç\Ö\êep\Z¯in³\á\ì\å\æ\İ\äxC›t‰@\n¦>6\ß\ê#Hkg\å>\Ë?uGWœ>e\ä(^”Ø§vñ\ÂÀeğw|\Üÿ\0±\Z-û\Z37\î_\áqõp¶\ì‚¹\Éu\èU\Ö*VŸB@›\0;\"\Óoª\0Wi~\ÏFP\Ò9[\èº\Ú%\Ø*R¡’Á]]¦+[\Íš¨¾üQ\ìX=…wÎ¢w&Rô;\Â	Æ„\Æ(ø­‘Ló‡ùxŸh Z\Ñ{^\ÒJˆÁ\ßD;‹\í+Ÿî‚«DMf\Ìl¦@Øƒytˆ‹grÃ¥\æº%v\Û\ãÒ¨7\é~‡£7`j;p(“€‰p»w=\Z(PA¢\\oBK\ì€\ÙòÇ¢]†E~Û‡™‹Ú±º\Ê-®–Sb¨¾,ó){Ôˆ$* –:²åº¸–\0	½v‚ô®²õL¡6d8ºvs\ê-{\Ñx²\Åø\â61ì‚¥ºhmzµ\Ì©\å\ì¿k.‚\nEaÜ½\Â~‰Ã•aÀùH\"%(Î©|†<Î°”³˜-^—¹w1PiR³ôq^vK6\à\ï\éK—•ñd#²!uZ?)ê¾…\ÊU[	«\İ{Kö»\Î4Z\í-]\Ñz²ö±\ÙbºM\ÅW–QV\Û+\ì@ùƒ_2µ‡tOŸû\×xV`79É¯W°\Â\Ò#•[jw7]ø7¸zœ\Ûş6[°\ïCŞ¹•o§\n„‘§¼\\›\n–¡Ã©ó\ï\îWÁ\ß`ö˜D7_Ÿr^\Úú<\ëW6=xôf“_|+³£\\\r&¨›$^ü\Ä\ä¤|‚™6Ã„\ÏP·¼®µ^L)6X6~_‡£{ò^\ÇF\Çr	rj¨6òÓ¶“&4X\Ù~‡\Ì\Ç\ÉÎ¸\ëA]p\ë\Zª¹ c\Üa ´j¹]W«é­‘Qv`\ç8\Û}\Z­rkd\Øòóhº°İ»ú²qZ\Ø±-F\Ş\Ói\Ä•r\æ\ĞqF¦ªe\Ûr\ïihˆ¢dFP:+\àq¿Ş–Úñ£\Ö\\\ÑVw¶\Ïb\Æ~\íhyªó£-\è\å`Í€€®Et~¦,5´\éğ\ë\ÜÇ£¢ó\äC\ÉYvMË¶Y]—¥\ÔÅ›O`\ÊÊ‰0Ks \ç°|FŒK´\ë:û\Ô 6{\ë\å\İq\Ò&7+\"Íz¿UJ¢\Õr\Æn©C]\åú9’\â\Û\é´3¬šÌ Im\ÍU½FEEŒ0Z.>Fıõ\Ö\r¦\Â<&\ÌÎ§#©–ëˆ—\ÆE u€¨72\Õ%mø\Ş\0fúÌ—Feö\ä c›}1\rÄ´\è\Ì`UˆyqE_TĞ Y\Æ¹öö>\ra9=ÿ\0†\äÛ™\Åô;q/1bÇ¬~ó\ĞRfX•K\Ä\é.\Ìm¡.$É\n•ML \Ş\r ˜,\Z¨¶\â+(\é\Ğ\î\×IS$t—v~\åı‚\Æ\ëmU\Ï\ÖZz!\Ç$lÆ¦{W\Ã\ÄA–k\ÂI\ÇX\ä­\å\æX`½rCC\Ê^®½f8=p^Í²§ş@#«ô~\íƒôDfb¾s»K‰T”\r\İ\\\\±\é\é¬6‚´J¬\èLÀD\â	cbl\ÓHe^‘§,\ËWWUl\Ô\à\ç¤]1[Z5Œ°;>ø\ä\ä‹u\Zıp\ãÿ\0 0~¯\çˆXkA\Ê!-\é\n#—\â¦\ÚZ{¹,eX\ÕÁsk].Y »+uWBÎ¹ô\İ\"¿OE\Ğ\Ä_£¦\ÈQ:À\Ø\ÊÑg¼EÊ½\â·X¸Z\r´—MaÄºW(¾÷i\Ú.MDdğ\éX-`7K»¤øš=2mÕ²ü\r\ái‚A\é4[\È+³ ¼K\ìˆs—+\Z÷N!^:…\0j\Ë\ÍÖ‹›Õ¯;q(\0\Z\Ï\Çr±{Å«Z^%Q0\r\ëKX\Z\r\ã€C‹YDÒªY\Òo\Ò7X™w›•¦óU\Ã¸fiq£f¤‡vY\Ï\n\ÌVwˆªay1zÇ´tÖ˜r\İø!F\Ë\Ó\çÿ\0\ß9€\0´Šú‹\È[\å‡\Z^›ªÀ¹\ÅT=\0±gQ¿zñ\r‚­\Zo=1§ 8BÕ¨oMT´x¨zlûKJ¬¢eš\Ä,10\É.`Š²¼£\ß˜\ÂËX«Z¢Z¼—5x¨€eÕ—CH\×&t„¦ñk\ß o\Ù,±X–‹\ÍóËƒü@\ÕG‹}ı\Ğ,GQ†Á5¥\î\ÑÃ¼¥+Jô¼J·Œ5\ä¢r…Ÿ3>_‚”ıDhX5Ä­[uËƒ}XarpGQ\ë\æª$\È-ñ4#’DqsZ}Æ\â\rW¶|Â q¡\Õ\Ì\ZVF šfB«Ie#K\å-û¤\r\êƒ¥úQ2Â¬,uÍ¼D\Ğ\nHaV¶\×\n V;µ\nı:\Ä%(\æ\Ñ^CùŠµ!÷\r›sÌijXN8m>ñ¼5ƒe\ÖH\r\æ`»•Y\Ë-”\àˆ€‰[m0½¶\é,–L†š\âR\ë¯ô‚n%\Øn\ÅB\re­€^}¡¶u4·g\ÅF‚{/\åZ´Ö¯\Õpw”\ê-K~\ëù§j‹\\Ø´^´V˜š¤´\Z\0P´¢Ò¸•4¥h\Åv„&o\0uŒùO2©Zw²™\ÕcB	¾“C\ÌJ/\Í\ËÍ!—w1Õ”!~e\ç:\Ë0€¶iiQZtù›(®ó@\è\"À+\\K.Ä—ªi¬»‹¯$Ë‰;\á~«·J \â\0AĞ•(±\É+´_90x«´¸$²·>\Ó@\0ƒ´rE\r%›»\ëpx-\ÍËŠÇˆ\Õ\ïtŞ­\ÎA}N}ñ\àş`\â›só–±ZA]’\Ïf½&)&\İ 9*‚«[¦\å8÷”\\\Ä\ÎtˆF6Œws¢\ÜCDs¸›¤1mS\É.†eÁ\Å\Ë-W¡ˆ¦^;$¶1hwa\éºUc‡¡\Élü+x\Ö\"\ØÕ3ƒ[!©{\Å}^‘c\ÅòA²\åZ#CØ³*\ãJˆ\×GhÕ´®¤– ­f¦1¼°L\æ\n\îe”‹c\Ö	\Ö\ìÁwLb\İ%ªˆ\Ö33Ã´\ÑS‚·¥@+¨²\Æ\è\rE]TZû¶ÿ\0,8\ÊG\êa‚Q\n{5\ítr§X•–İ²<‚üÁÌ‹E\à·\Ş\ÏŒ	šª-\â\îÃ•Àğø¹F\0Ì©O¦!\Óú4…Ò¥™M¬†\ä…\ä™=`lPı\Å[L\Ü4\"\æ\â\ä\é,:K\Ú9ó\n¨\Ò`fñ¼hgR5£=\å,v¹ª#\í\ß\Æ!\İû@‘Rt\'İ¦UKQ;f@G \ÆWe\Ûn»[\×\ÕZ!°*6\Õİ•V\à\n%\Õ.À\î\Çä¾„º£ƒ\à\È!\Şi\Z#©»†£s\ïW\æj\â/6ß¡\rbe™M_£¤+kf%@2CH\Ì\Ò\í\n¡\0	½j6ƒ‚\Úk\"f99¾“9`\Üt\Äÿ\Ù','dnb.jpg'),(190,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\r(\Z1#%(:3=<9387@H\\N@DWE78PmQW_bghg>Mqypdx\\egcÿ\Û\0C/\Z\Z/cB8Bccccccccccccccccccccccccccccccccccccccccccccccccccÿ\Â\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0Á3Ğ›‚sŠfî¾—?~/!:W¯”\çnOF2o|{¢v\åv\Û0I`M\0@ @|\Í#qÀu+ ¯¶hóû:\æjq\às7¦q4O5Ú ¤MYX¨m@\á @\Ğ(	\é\Ö\Â\ìŒ\Îhz¨yóğƒŠ\àUu\Õ,\Üf\éS³\Ï#\ê\Òz®™ÀL\à@ @\èX6\ÃK1T:ivî­Š!|ªÏ€Ù˜®Õ·7˜\á6\Ã`@ t!›f¡¸ªé¶¦m¢\ê\ä´W\â\é\Â\ï\ærwbT\æ\âı<q:8Œ•¹+†À @\Ğáš†ºÚ¬+\×hMÀVš\Şs7N,ŠÒ™Y¹P•Ñ¾ÛªHNTÍ†p!°:!À‡1º\é ü‚^Œ\Ó\Óe«\ä3¶ó²;`Ç—\ê\Úu\"\Ó3·\ï\á§‘+wJ\æÀ`\Ø`\à@C€ÀEwz\\¹^Ø¯Kjø\İ\röñ§Z\ä	¡\æ÷\ß5K\è» \ÇO#Ë›;,¬²»VÕ¤sB\r\à@Ğ†wFWF×®GQøfuu÷G\É\ê¿t’\Ûw›1:©s&ßº$dax0c\Ö}›:\ÏH\ÍEq\æ\Ã{¹1¸gô\à1˜M\0”dFT;2\ÚF[õG§º~y—Ö™õwÕ‡\İ\n†‰\ç\àG©ˆ®·\æiÒ‡9›\Õ_²\âÚ#\îj¿lEEó+–±EC²jRl_83\ŞUÒ´[n}Õ±C\İ\"Ÿ9’m\ã\è\çN&\Õw¢´Ú³a2öX\Z\0õ\å\Ä^…®\Ó«q®\ç\ZJ=\'âººtR4…\Õ\È^Œ&ª\ã}\\ô\\ôªÚ˜·g/Lx®8=vNf\ÑõY\ãE#\ÓMt_\îWŒ·\Í{\nµR†N…\è^œµ\í\çV8\Â:9\Õ\ÍUdù:\îÖ†–ó³\ÌSp\Å	Ó‚“\Í&‹–œ´V½‹\ì\Õ\ç\è¹j\ÒN{\ëR=œ:§	º¢\Ö\â\Ñ\Ãi\ç\Ê$J$ı\r\Ê\Êø\Ã\Ì\âo(©“\âs°k4\î\ÑÙ›ó†4zn\Ì\ÂslË£%‹K\Òr|5¸÷W0”\â‚1\Ú%C>nSrkvÆ¶:õ\æºR\ëA2#°\äp\×Ï½\×=8ÕŸE˜g¢óV\ÇN¡y\ê³r.{³5º\'\\¯$_r\Ò\äÜ’°n¨WX—E5n­E9i©“¢4\Z\àù‹m®\ÜbZW·\Æ2<\ä½Z;i\ÙM\Üñ=\ZOz“¸«òÀŞ’Ê¦{o òúq}X­eôE\æ—M\rù¼]\"kÒ:Aóe¶\Ü9\àW\Zi¢\Ñö‹›K\×\ç)=\ÉS]c\æ÷¤-UßšVğ)¸(\Ù\äa¾`v\Î\Zñ›>]|÷·\nP\Ôò,Y\î£;\Ğ1b£\'~\Ø\ã\Å{b¿o30\ÓË¿\ÎtH\Ò=ls\Í3¬\İ\ÌG\ß3Gš˜¬wü›y_Ayú&\ØœƒØñ>—o1\èN\Ö\Ë0>b\Ûa\äZ“\éóR\Ê\î\Å{H\åú<nO¿.\È6\ÏQÈ¾s]?¢\á®wG;\Û>B¯IƒU,›#¹4ù›:¸£#.\ïxöóŠ.eº\è.l¶\Ôy/CÁÕ£\Ë9¸•´.\Ë\Ğ%×“uº#\é9§\ç™óªŞƒ‡¨û\Ë5Q°>…Í¶5\ÇM%\ÂÅ uòºY\n›0\Åô\Ò\Ì\ÉÁ!¬MŠš\ähÜ±¸­\Ô[§{è²‡/#Õª¼\Ø2í¾‹‡¤]\\\\3L+&\"\ïh½¦[Š	k\Ü\Ë1D2:P¨Şƒ\Ï\ê¶\Ø\'[²°ún¤Í¯W«c’ióô­¯\n#\êùj3v›Nw¬öf\Ã&„\íŸ[^V­}É…\r´ó¹º<ıg\ß6\ê_4İĞ§>[57˜	»<ôF‹å¯‹7y\'\Õğ\ÒÜ³S$\ÓWAIu\n/w©b\Ñ\È;B“ Yu\Ùôh\ì’\ê\å\ĞS5¯\èøQ8õ¬·g$ŸbÛ› ˆ‘€PNòß·>V	us“†%ºM\ã’9)¶–@{‚‰0\Ü\Æ\Ä\×\ç\Z—^?ewùøU—I\'¤UG½G\Í\ÓE¬	¹\ro\Ó\ä\ÓHa\ŞZ0mMŠId®\ÚYijo[™Ò©\è|ş\Ìÿ\0N•ıxi\ZönŒJ\Ú\Ï@ö¡°8\Ì\ç£Å¨\á˜]\èUl\ÂK&d«ZY\rvı­ù´æ€¤BN4«m\Ë«\Ëôu\0V\ÉíŸŸf–j5B\ÕVh\ç¡\Â\êsœ\Ş\æz!—<L\äòjÖ–@o£±k=\ç\ÊóY„	y9ÍkÒŸNI.Eòø–¦‡0ô\×7ĞŠ\î\Ïù\İ`{\Íô8\\Nv\r\ày\ÚC)¨8¿k¶–CIö=·\Ö!¥MšI™\rNv\İY*¬¯|Ü_“škù\\(=q»±\İ\ç1¼®-¸’m5\ça­8gjÖ–\Z‘\ãƒNƒò×¸@¦¢I&¢4]nv\İIS(¬ºxÙ‹\ìòly\\ÁK¯qª·o³\ÌG+sv\ç|J\ê¤ /:‰i\Úí¤­Wœam7;À¦ªI&¢4]nv\ÜHğ®n\×7Òƒ¼Us\Ø^Ÿ:õRÏ£‰-jò)\Ó\r\ÌS:\ÕÖ\Ó-®\ïÿ\Ä\0*\0\0\0\0\0\0\0\0!12 \"3#0A4@Bÿ\Ú\0\0˜ÁŠw©´5¶\Ó\rx2†™WAĞ§{D£¯Vjå)_\Çh\Õ\\œ»x\';–¦\é\Ã^7/\Æ\âÅ ù„M#1i’h\ÛÎ³ùş5À|±¦LtX‡kvœ\İ\ÉA\Õ\Ò+°\×\Ô\Ç#À.«X\ĞjZömşª\Å\Zô\çQÇ´\ß9£—OZ÷rœ\åC•±=E†µ:O(º‡?ÿ\0¡ø\âL¾—¤\ÅRÓ”cTxb\î-boM¤D¢\n´£@º6šİ\Óüşø\ì»ò]«Cc½mY\Üğ\ÖúL8\ÃH`Ü³}“«›*¯\îu\rJs\âZ‰ü6:»9µ\ã\r¼jG³S0\ã÷n…¸\äÁZ‰g…~u(f\Í_Œ×§\ĞÛœ,«ø5\Î\è½R¦ø¾D®5Ò²\êö¶:h¬¿*»š§[u\ã¼Ÿ;Bšı0h\ÔX¼]šÿ\0-%iúuÊªÖš\Ú\Ë¥»,½4l¥Vúµ*yŒEc\ã+?·\'\è\Ö.E‹H`¥^V[¯4ö©#B´±™\"ù¨#r\ëz\ë^ºM\Ó\ä\Ó\Ze\×\ÖvE„\í³\'\èR\àiÂ½bdÙ­¡r+xõ5dñ#IV;±¬\"µ¶-·º¨u\Èo \äM…\Ê\ã\Û4jŸ\Ô\"\Î\Z\Ç\æU¦®\çI_‰\îÌ²T%‡®š\0\èmº\Ë\æ\ÓÀ\\Ái¡²\r\Õ\Z^;Z,ƒ½œ;ó´¨t\ä\Û	Ş§@ÀNÁüÜ%v{6\æUuaÀ&i\Ó \Ñ/·œò\ÛM°\ra\è{¤±\èf9\n¼\ã2-\ŞÕ®\Øg›X\Ú]§\åjÑ‚	¤EÔº\í\áÜ·n\"\'k;¤	¤\ì{Á(ó»\í\é5\ÚQò²\ÊEw=Ai\Å\Æ‹«\å\İé¨ª5²\Ú1\Ò]‹µRQ+¶\Ğl WA·†E\è\Ï\Ùf\á,¤¤|®ûM/U\ÆXŠm­H³,H\éex¹\Õ\ê×ŠŒ\Ğ&?\ä¾\Ì_øK\äû5\î-ó¦h\rlÊ‰\ì3ºÀ`\ê6T\ÊnıW}\Óx\ç…ùyv\Ø,±²j+~cµ•\ä\ÇÈ´Xy\ê¸\Ö_i·!Mc¹d1Ÿ¦\ähl]F\ï\ì=ôÿ\0b˜Ë¹i¸V”y_ö\ÖõŞœ†« }w\İ\×Nj6\å\0\n¯2\îZL¤\Ùjùş™ú¦\Ô0ŠÅ¿ª~™\ËInœş²ô-\å¢YAÖ£\ä}€•4d‹øe/Œ4(5lI—\ß5-n—å¦µ˜%sZ\ÇZ‘Ø»LJ4™wò\Õx8Õ‡–’=;W7û&GÙ¤£\ïOß¶³\Õm³¨\Ï2„\ÙS¹7y£\r­Ue\Ø©.·›dÆ§y¾\ÑJ1,Ã·òUI°Š,®¶•´õ¥¡G¿ì§•*û“\Ã;\ìO*<³\Ç\í\Ä\Z-\Ë\Ì\Éf9õD±l™Uşúj\å®S³°F•R\Îı+Ky–¿-\çi¡\à8R\ß\0u„\rŒ\'\î®Yg2Zí¯§]6dW\ã\ä¾[ö(²«[]kM\ê_&\àğ\Ì[En÷T\Ó\Ô\Õ=US\Ô\Õ=E{EBzºgª¦ZCZ¶*¯¥\Ü\"\İQ:E\ÊC\áb.¤ZF…\Çî¯¶t_-\êµ-\ÔÃ‘L\ç\Ó=E3\ÔQ=E\Ô\Ñ=E\ÔQ9ôÁu1¯¤OSDõOQDõ4p«N`Ó‰E3‘9‚#nvñFÚˆû¬«³\ÃR\ëªl(;˜}ãµ½\â\Æ\â…/\'8Nh›\ÄÇ±G¿cªtM7U\Ú\é¬\İ7CR4zM­¸P”(8nrq9b(\Ôò\Ï(;5;iöi\Ä1»wwIi\Ö\Ë«ZXó*—@5<˜Ú¡¦\è\ê,‡b\Øl«/dO\r\åü\Ô\èNA\ÕQµ¹¶\Õ_RÑ©E\Ú&Am\é\ì\Âá‘\Ë\â{ûõš{+\Ğ?ªIc›<\ê‡\Î[fÁX\ÖiÙ…Àõ™r\Éş\Z	´M«\Zg§3Ó´ô\í6:@\Ú\Åòª]\Òs@MMÖª\Í:i\Ç\n\ê¨\ÉA[{\Ô\ê \Û\ìN¶LÁ¦Eœ\Õ2ƒ{\ØjNZ‚İ•*Vrİ¸avÿ\0xeõ¹—O~š\0f°XD´ç˜cK/µY‰fÁ\íW{\×tU\n%–•¦ö@İ‚ğ\Â?x\Z1™_te\ÓÚ¢<Ocö\Åúr>ùƒ*\ïox{*–(¡\İPz¥‹‘½¬m©‰\ÓÛ£%f_ß¯]=¯\Ş)\âı±~œ¾`Ê»\Û\İ\í	\ÆyŒ>ş·A\Ò3¶\âpK¦Co³‰?ÿ\Ä\0)\0\0\0\0\0\0\0!1A 2Q\"0@#BaRÿ\Ú\0?ö\ä\èü|›eD\ã¹hÖ•¢•z2ĞŸõ&\Ì%¦H\×>\ìR\ä\Ë\'»>/ú\'\Ùb>Iaú1¿w£d]33N69S>Oú¼\Ë]›\Õ¬Wc[e¸\Ü^’Vc»¦J\ãqô¨Bz4™Ñ’•›n4S#jbø¬”%ºfw\ãún[H\ÉKHş\ìIø™²\É>fŒøg\íó*R\ìŒy1|Œœ\Ëúycú—ôcŒò:TDfN\È\ïLS\İ=òf•Ş•üñ\å¡`K±\æ>?\Éo„~<\íòdfD¤G\Zª^7hKwFÁ\ÒEø3G‚\rõØ§ü\éÑ¸”\Æ\í™qpš?\Z/q‘rzR‘Tù$¬Œöğzö3|h\Çò(“¡dû7\'ª6ûÓ³ı‘š<\Ğğ/qÿ\0m\å¸ò¹ñCac‡:1|Œ½ì“¢v\'¤q)®Gx6\É\Ú\ì\Çûz\Ø\æ‘6üöòc\è_d\İ\Èk–W3d\ÌmÁ\Ù,Í³\ìÁ|’_±6G³31¯&VcT¬½kØ’H’¿d\ãûpER\Ò<†>9\"ÿ\0¤#bôÍ‰üGWHK\ì\ÅöIù&ÈºfNE\Â\ì\ÉKÁH‚<Š>Xİ˜\×$Ÿ¶”•Ğ‰<2¬Œ\Ôc\É\ëc~üD„hQ²rÿ\0TN^ÉºZG—¤WÑ½Î‰*#*Z/d>Œ\è\Èo\"ü’[•™Ÿš	Y9lTNU\íy6}H\ÅÁ,u\ÌM‘Kö8\Õ\Ä\Ù\Z¶<q«^\ÈvfD\n´zl\Æü—‚Pú3Â‘‹\âBx\ïö\ã¶\âJvÉ¥¶ı²Iöt¸\Ñšl\È\á|œ4¨\Ïò0tM\'KŒcKØŒ‹ƒ§¥’[y7qd&~GVa\èËÅ˜²mÇ´cV‡\ZZÉ“vc|VŒ‹§d§öK\'|%\Ù)\Æ1¨“šq¡u\í|Äšò-\Z´C‡LL\Ìø0üF\ï‘\Ç\ÉXùZÂ¤\Ì\É#J&¹g#ƒƒ°\æ4M\ë\\Ÿb‘—£\ÄNú²mcU\É8\Ó&\éİEòIdQ\Ğ\İ\é7\ì\ÄK½!6™ Ş“£\ÇX“1Kr¢k‚q³¢k<\ë\Ù\Ò$ôŠı‹\ãzF\r—]˜\ãôK\ZfLn&/¨‘‹\æO²F±ö>ZHŠ¢VSÑ•¥i\ÅibUh‰T‘×ƒ\ÓC[DH\Åò%yƒq)X†\Ñe£r7!M2\Ñc-iF\ÖÅº&õ\ä\ãÆªÆ‡‘\Âd¿hØ‡Ñ‹\æ8·.	\Í\'LR‰¹‹/K‘¹\É2‹\è²\Ñhµ¤²«J)\â“‚\É7º\Ù\éª„’b|™c\'#¥¢^×¤˜½\ÉĞ²Å®M\Ğ?_²—Ù´\ÍŞ›\Şù‘‹LF†£€ñ¦zEW¶N™\'Æ˜úş+š#ùú2e\Ä\×\è\ÇŸ:#\İ¡\ë3³i±šQ­2ü‹\Ò#6\n\r3wHÏ†¹B1:%+ÑŠ^\Ü\İ\é’>u]\r{\äÑŸ\'¥ú\Ä\Çù+$\Z}ˆ†E‘ekŸ½g\n½v(£b6Dx\èô\è3\Ñÿ\0¤e,lš‡\ä/úO±J˜Œ<º%\ZbVÎ´R#+\×?~Íµ/\à„ì±¶[\ÒÇ¥óhY7Æ¤#¦K&î„¨c‘\Ù\rs÷\ìŸde~\çÀ¦\ìS7›‘h¸—\âú$G¡û­%+!bTEZf‘Ÿz\äZF^Ù³\ZöKLc\ìB1÷¤„¬Š¤9Q\ê•³,¶£#\à¢3hRL’³k9#-|\ÇÖ‘zÏ­1’#Ğˆ|‰N‰J\Ì]i>ôŠ\Û\É9n2½nˆõ­kÿ\Ä\0+\0\0\0\0\0\0\0!1A \"2Q#0@Ba3Rÿ\Ú\0?¼v\äl‰$N6§<Im‘\Î\ÃX\"TXşp†E\à\ÉR>D\Æó\Íó¾‡†A,moš#rJYşdbjF2Iif2h\Ã\ÉQo°ã‚¤qye*J;²´\İò(\åZQ»$±\ã÷\Ò¼+&K\Ü$H‚U#QŠòi\ß&±/ğƒÜ”\×\ÄQ\É\Ú44&TšŠÜŒ°ò-÷%V(\î¢2~\ì9iDöş\ZYbw‰HT’:\ÎN–\nqÜ•7\r\Ğ\Ô\'\ÉÚ¦f\àu\\\æO‚0ZI,\n*\ØF¡g\È\è¾\'øVN;¦¶Sùv¶DÕ³û\ïfE\ì9ã—´ª\İI\à\é\á\Û\Ø\î-X&µ,2T°(¦B\É\ZWƒK²¦?\Ü{™ºx‰E\Æy!S\ìJ9\ÔJ¶g“fiˆ\ÛÕ‚Ÿ—\Ô\ì\ŞQ¤Ã»1\èK#Xx³X%Á±¨LqÉ¥±­r­D¡±²O\ï%>	=\ÉpEe\àq^FQ¥3Nvˆ­Æ¼‘\ÆJ¼u‚,\Zö#23H©¢qÁ\Ùl\ÄqGLŒ\ìAa^\Ò\\“~\nK\É\"[	\İG\'m\Û>Œ\ìj\Ê!\ÉW›\Å\éä¨·\É)$I7¹—Œ\í—nN^\nq\ËÁŸu¢°„¼“yb²D°M\á\rš6È¢i\Z¶-\ÕùÙ<2psgfK\É‘)f\Ü‰\à©Í©¬»I\áY\"„Æ²%–OLI\İ\Z³²d\Ş\ÛH\Ş\ÑFœ”\ã\äR\Ü|\Ú\røG\äsn\é?—Ù©¾6¹#şOÍ¤÷‘\"›2T^m‚k©Å˜\êı\Ù,lqx6¸9{\Ù|J|H¶Ä³\'½Ÿ>P#\ä;\à‹\Ã*>$^\Ä\ã±-),Ä§-‡Í ²B8*-óhSòÇœ	I\n\îaÄò#2|\Ùs\èC´$U\'\rO’\\80MûHÌƒö‰ù¿R\ÜRÁ\ÑÉ´òW™®GM=q*|L\Ô?T\×$G[Qú§¼\×/²ú+&T2H™Œ“XE?ù”\Öb!Yg]\à\è\Ş\Ì\êe…K4Ü’zdT–Jq:ŠÊš!RD!¡b\İM_\êŠTõn\Ê~ª³\ÓÁß™K¨„ö˜©Å“†\ä¨±—À£Á-…-\ÈKVó†t\ïeGªD\"•=\'\ÂB\ßrST¡’NU$P¤¡nª¾•„Sƒ›\ZÒ°CL\ê(\Ø\Ëf:y\àph§^t˜êª\'\Â*\ë\ÛAQ{7(ü\n<›\Ø\é÷\Ø\ê\ßƒ\ÓF.|š„¢\ã\É\ÓKÛ–Wª\ê2„c\Ù\Åy*×Œc”6\æò\Êz ‡4ü‘\ã\ÓUn1I®[ÿ\0G²\\á¦\ÏÉ’%QN“eG\É.eŠL\í\Î\\’£\'#¦££vN^\n±rE:U#”:B£6~5Cñª3³3³2šj;Wu\änğ:qj\Ôj4\Äü“¥,š4E”>%/$¸1™¡7\ätjg?¯\Ø\è\Õ\\±Ó›òv\çöh©öv\çöG§¨üŸW\ìüz¿c¡W\ì\íO\ìTgövjygjvŸÍ²k’;²4©òŠ\Ól\á\ì(|G\ÉÜ‘‡’•Hi#\ÎMŠ’Ï¦+\nó$S$ó²l\ÖGH\í£¶\Í¦\Ö	6`«©GÍ°nˆu€º¤Ñ”Ä7¤ò·¼‰‘\àU=\Ø\Ğ\ã…v\éı\Ê\ä§ñ\"Ô¸+|Ÿ‚_+e¡¬¡­ğ`M‘«(‘\ê3\È\íO\ãvc6–ñ\è\\\rzgV8gO•–wuA¦t\äşC·JšZ™&œŸ¡\áZœ¼]Ù»G‹§LkP\Ö/.0v_’…4\ÑZ–“§*|¨R\Öò\Êõ?¤}(—\nğGv\í/(ûG&™Ü—\Ù\Ş~N\ê;\È\î¦<22pd¤§t\ä×½‘§–Njœ0†î¬‰p½\nYV“¼x¼^¤V£\æ$£5l\Ú^\Úi£\\™Cxö95ú†y\'\'#vQ\é´ŠòŒ6D¸^ˆñ\éF6ÁªQ;£t\å\Ê*LT)\Z)%ƒE<l„uNTx™)d\ä¥EAd­USD§–#\"3“jñ\â\ÑV”r;ÄŸ\"\â\ÕÎœ­ò´^	MAe•\'®Yda)Ÿ‹/±\ĞÒ·)¬±\n£Á‹5hñez¼Iò.-\\\éù+|Št%2£«o6¢½––\æ0S[\ŞP\×Á(‘\àÿ\Ä\03\0\0\0\0\0\0\0!1 2Aa\"03Qq¡r‘#@Bb’±ÁRÿ\Ú\0\0?\ÔÒ–÷c}t¤^1Y*\î\êN™\Äm)zIU+“Ş\é3´s%™*fLq\åTù•\îúÙ¢9«eÂ¬\èÇº’9v\ì÷ª¥ª\İU<\ã\Ëw3¨†ù3‘‡eşF	´O\ìk¡ğ‘Vœ­‘­òY\r’ó8QÚƒ!\nŸ\Ø\ázTPB?\é©\Úvwì³‹\àš˜üÊ­ûª¥’\ëÜª\á¥É›*º¶˜Sw|õ5³+3)ªÑ¸˜\èÁ×¹T7’Ğ©yfz»tw\ë\æv¿6È‰=Ó­3†}-©—y^\Ñú+Á\ĞQ\æjF\")!\ëmI²*28§\Ô\íPˆÅ„\ìµQ/¸‚	}•\æ\Êh£†”\"z^Ÿ+c^öH~¥«vUM•Bú\Û,2~\Óòv·g…u©)\\Ù‰Y?\"|\Æjvsg;JI±ÖŠY¢‘P½\É#rE•³0ÂA\áÂ \ÃT{ZYW++J¾GÉƒh³F\ÈÌƒ‘™‰\è7\çi}\ÍP¦LME¥ş;‡\æs§_3©,ƒı~îŸ·qQÿ\0¡\æß©M|\ÙUu¶”òL\ë«3Î©BU\í\Z>¦Î¬TÍ“K;lšD\Ûd\Òû™Ü§\í<\È;NEx\ér,::6t\ËÕ›=¤te?R¦²?K4\Şe†\Òt\Ú),\Å.“–û˜\"\Ïg\å?m©D˜ƒ©:\\ö\\³ôªt\Òa\ÚK«\ÌXyŒ\äNµQôöT\á¦\Ù\É£\r]Ü­QU.™‘‹\í0\è\ÊgI³\Z»”()¤\á§ğe£ùŸÀş\r&j•‘ü\àpSø+\'¸d\Óeö’Œ5\ë\Ê\Ş\ÄŞ¡zm\nh\'\Êùğ¢LN\ßR¯c\r<O~j8Gƒ5eƒ\Ü_m©²ô \ÚhT\ÊJP\ë\êz¡¯#\n:#¢\ÒØª\áDó\äK\×{ûI£>„T6ÿ\0¤\í\Õö)õµ>–«\ÑúÙ¯vMN#°\äM#¯34¼+¡\Âÿ\0CH\èŒNš¿_\ê]³RM3R¼Ğ•)\ÉN:yA«)V¦Ê£Z_©ªö*\ÚVá¼•:[µ£)\íh\Î#ˆ\â8#ˆ\â*kI!\ŞR8Y5#S\'e^ôfÉ”ôv¦İ¥\'‡ğG\Óø<?ƒ\Ãø</ƒ\Âø<?ƒ\Ãø</ƒ\Ãø<?ƒ=ŸÁ\á|Á\áüÅ”\èe|\éFJ=\ÃÄ—&f£ \à\Æól\Ï[ğ˜Qš\'ög“8U\İ/\'6ªŠ½ˆb{\ŞGg2!ÉúñBXjRb\Ù\çO>\ám1kË¸\È\ÃR2yy1S™Jc=\í©ù¬\Î\Ë\"­VL\ÇGú\Ü}\ä™!d>¢\ït¹\ïWi§‡ı~Áb\ĞÑ’\Ä1Û©‰\ïWy\\=Öˆ\Ğ\È\Õ\Zš™gd1“Ì\Éz»\Ã*K¹\Ì\å¸ç•œƒ*lŠŸ\ä–\ÜnW\ß\ënF*L.¬\ÉnJ\ì\Ñ\n\İ-\n\Ù\Ûhú™ş\Ç\Ü~–¯v\í34\ÈT\ÙõgC+{w\Şçµ«¿S2mV\å*ù“½ÿ\Ä\0)\0\0\0\0\0\0\0!1QAqa¡ ‘Áğ0±@\áñ\Ñÿ\Ú\0\0?!•`v¾³¼#\ĞÈ´\Ï\nï¢¸µtQ1|©jµ­X\á‚Ğ‰C(¯A)·¥Fz¢´\ãøÿ\0\Ú»YY‚^3\Ğ;\éX÷\ï/·fº\\¤%ñ-\ä%$\Õh\é\à\Zˆœ5¨Ç¢\Z›\ï,EA&\äV¹6D°U¶E¸ {\ÊI‹u«\Z$L$Îœ•0³,£,<\ÏIJ>°1Å’†Ò”½\\0öş\\D¥’\Ô?\ì±\Ğ]\ZƒJ‹u¨üLKıå—‰‡¼\ÆY\î¥\íè¶½\àn@X‚\Úf­ƒS­—\ï(ùsÓ´}\á\Şâ¦¼K‘—¿HHûyŠ¨TZ(÷N\È`ğƒ’^\î¦\à™‡\Ë\Z§=ÿ\0Àñc\ï\Ú<>ay\âZó\á.ÿ\0H\Û\â\áˆM`V&ks»Ã‰¯ğJ¼$LÛ‚:\Şù•\ìŸPZ\ØLğ”f!ê²¿0ü\ÌAÜ§‰]\Ö3^€*;”„­\ïS²_ˆ\Òxˆ8L¶:6c\è~ˆ\Ü\':*ÿ\0…q­jŸn“Še1ÀJ–\æ%\äŠ\ã¾!\ÙvJ\ÈÁd¶zNµ—´\Ã\Ê/„(ÇœM~RqÇº\"4™‚…P†dal\Ä\ZùÙˆ²\r°ÀAgy8qh\ÍXf¨y©V\Å|K/Rz0HÈ“vfñÒ\æSû˜Sqœ\î”7<Ëµ«¼¯fMê†¨©n>‡1hn(»û3!t±Q\ĞNe3\Ş \ÓP¶‰‘\Ê,n@§{à¢¸y\ÚSû•$=\ë1\0)¾”\äŒ¡y\Z\É6ªgúpøxgUy8üŸøŸlZ&VQŒ\Í>%„\n\Z‡¯W\0ASŠa@=–\È#\í{¶\Ò‡|ÀsË¢Ï¾g\'È£d\\8F¢÷\í\ÒÓ¼C™áŠ”Kk%®e	\åG©·x—\é5}‚[\ĞG[\Ò\r0Rö \Öû÷ƒd–eù€\Õ@Ú®a(òe\Ã\á]Ê{©ó$Úª2\æFwjbZür\Âm\Î^Œ}¥²Œ\ÑÇ¸õ\Ì*¸PŠˆ1Ä³\Ó2¬}&eLÁ§u-l\Æ\\\Ã\\y	\ä­\Ì†g…\Şiü	\ä\İË«\ÇOh›–/M:0W,\Üz£¸\éŒş`\Û;#…À.Z›<Bj‹È‘w\Şnô,¦\á\áGP\\XaÀ[·F¤jTr\ËnNc‹nHG\ê\î!¥\Ì^–\åBğÀƒ{-\á„Y\rõµ\\\Ú+Naßˆë¥\åX™¸Š\'Ó¦d»„N«\Û9‡J™q’ˆ …(û\Æ*‹PrÃ¥G(\Ú:½\ZûC÷£\ÒnaZ\İK}“³\Ú ~ˆºbŒ~ñ¢^eoL˜\å”P·¨Á2Ü±î”¥]x–cO3G\åD\ÔUYqH›l+2\Ü\Êşcñ¦	\ëú\ÇE\áØ¡Qš0<°Ávu\rõ\Ên§)>9o\"÷>ş\'Æ–.,x¹ƒ/¹7\Â\ÉÁ0ú\ÖÁ\Ö\ÉAƒ§\ŞzÁ6Jğ©¹|¾3÷\Ä	b„5\ä¡\Ìıñ2k7\ÚÀC¤¢ª\ë’#ŠÊ£1\â,2œDQ+ò\Ó–1¾xdEº\Ê	§¶:X°<ƒS3ÛŠ\Ç÷µ´`9Š/Mo.¿™”¿;»\Ç}si\Ø>\ÌoŸ§\Ş\'†6\ßmt*\çÍ›a–Ì§(UK­\í§z™$\äÚ¶/D=9*;U{¯²`²Æ¿\Ä\éƒ?$\å&tö·ôF:o9L z‘\îG¬/~\ä&xGK\'?F\Ó7t\r¬‘l¬4‘\Ä\ãpö&;\Óı¡N–\ã\Ğ_\å\n¾ı§,\î\èğ%°T©‡Dmô\"\Ø\è\npJI‚\é\é¢@„“4@J\áYn\Üğ« C³\ÓS_\'1™\çsg˜~\Û5@0^ŸeH¾`;F™@\à…¾\ÆXûFö¢Œ-\ÔOı\'\ê\'\è\'\Û8‚[ğŸ¤Ÿ´¬ ‹/ \Ó4\ë,B\Éø³7fk§ q¾cL¼n\Ôtƒ™›ü\Â\Ûó5Jf–\"­+\ì„modı\â#ş©ûı‚~‘?h‡ü	û\ÄV¾	Y“\Ù?Pƒ¸ø\"êŸ¸ôM\ÛQ#‡M\îoÇ´{§’¥–üGÿ\0X™\êCH2ƒ\Í/,§vM’—bö‹\äı\ä\ÂCgBúMt5\Z\Ñv\ê€6JY@\ã}¡şú	\Çß¥x\ì±}\å§Ö›ó/¹šXY0Í“ox2x\Êw13¡oH5\Æ\ênö¨u-u\"jUMü\Zw:%°_\ĞUF7?LĞ¹r\â6©”\Ö¼î¿‘\Z\ŞùŠ–QC\Ä14è’£sNs\ZÁ\îNXÕ¼cu\Í\Î÷İŸ9.§–ÎŠ³ÅŒ‘)\ê¦6Jjj9\Ú;\ÏhyùJ7ó\ĞT\rÀú\İŞ•Nd}\ßNQ¤±š>}º²_ÀCh•\Õ7¥\ÌÁ„\'\Ù\Äù?@ú™¹—L)\Ú\Zo\è\×Ë %ŒMšø˜\Ön\'üh·l\Û£zIQ¤±\Ùô…\éxŸ? ”Æ™‘ú*Z[ß‰eh \nN\ÃY\×_\"Ë  XöŒ\Ö+Á\ç§gî˜ŠT£ƒ©7@Á\04T\n\ê\Ó1{\Ü\ÚP#eƒ˜<®\ì¸]å—Šq<ú\ï\èşd?¿E¢\æEğMƒ_Q–{¹ic/4H€\î>H–\Ñ\í5Ÿ,¹gô&\ÈWô’Œ\Ñ\ÑjZ\á®\İ\ØD^3½ô¾±÷K·;Sgƒ¦á¯¦¢ûÇŠ—=>—W”øˆ\îi\ì›&\ß%\Æ=Z¨ô†j\\@²\İe\Ã\İÁ3q¹*\à\Ó+8ƒ¬U\íJt\Ş5ôzğı¯)»\Â;g\à›gõ\ÌVøD2\Ç-L\ßG\î+¥ó\ZfÅ°œğ\Û\ĞQ±¨ƒı\È*\Åu¶Q“§ÿ\Ú\0\0\0\0\0\0 i¼ÿ\0Ò€‹$’I$²uj\Â\ï†\É$’I$’KğôVrF$’I$fPt, Pd’I$N¢ùQ(\Ë$’I$¨‚\Ô2\ïd€I$wR\'¯ \Ğ$I$\æGYˆS\Ì$v\è*VO·\Åf$¦ÉŒ]5ğí’¥(\âq‚ı¾\ÊÍ¯\"°¹Cr&¡\êñ¦•ö\ä.\Çş“=\îõ|-\Ë\Ëe¨+DR`\\¶8~\\\ãVxSÁÂºnût‰S§Gø¤ğ*ù­ö\0¹\Ûc‡È˜7/¢N\ß\ç\Ö¥ı½¯+±©yÃ•öD\Ë4\Øi]|\Ú-Õ‹&b\\|::©¼*$ª÷9Õ©YM{\"™¬\ì^\n1Ò¦wºb\î\Ó|I}™\nÁ¡ˆ‚}>\0| \í\ækŒ_«O¬;6d{\Ø.\Ì\Î9\Ñ^—y‡›n\0ğ~¸Úƒ\Ô;’\Õ&\âÀ–À¾I5w^.œ™\ã§\ä=¦)@\İ*,\åµ3\äünÿ\Ä\0#\0\0\0\0\0\0\0!1A Qa0@q‘¡ğÿ\Ú\0?ş\"v7™?Õ„°½gş_‚§\Çş‘<€ƒ\Ë\0v>Œ—?d1r¼Oš\Ù\Ğı‰ÿ\0¡¹fßšzD†û\0ci¯\ê\Ğ_\å\â\É{i,K\×\Èz~ö?\èe\Ø\ÈÃ³¿\é-¢‹¶\àıy:”=“\Ëi²\'«@\È\Ğö0\ì;·Bş…xyÆ¤œo\Şÿ\0(\Í&\ä0#˜ö\ç>Lw.\Ùğ˜\ä@W\æ-Û©\Ö\İ\ÄC¶Z0‘iÿ\0>sn%„AZ\å\ì\èf\ÆóB\"~³—:“\Å\ß\":\Ùÿ\0—òp›½A\Â›)\Ûykğl`T-\í\äJ4~\ÊnB\ã~¤w\Ë>ùÿ\0\n\ä“\'&}»öŸ\Ñ\ÄzHñf\á\É=;> \éa½)\Ì\Ğ0Ÿ\Å~&O=\àa0m^}\åŒ\ç¬+—0¼»KÉ±\é2 oNü8G}y«\Ï.	jù~v\r“Q¿\Ùó¤|,s	K>\ï~\Ë„™\íwŸ\Ò\Ã`\í\Û*™ ‚_‡‹>Ou`[\Şv·‘\Ö\à\rÌ“:–‹–ˆ´\îÁœ²2]sl\Öö\'Gx–6~“2øHGGˆ©mÉ´º·b>a\ÂS‰›À´Y5o\Ù]_œ0Y$£\Å\Ò\Ù6ÿ\0\åK¸\Ì\n““>»—]Š?Oı³¾\Ç\ãË—/^ÍŸ3s°`2\ËP7~Dy†\×z\İ?Ã½1?\Ğ©ol@CŠ@å »G<‹ ²öU{üÈŒ\Ø=C[Lv1÷{d/³¤‘\\Û°\ïİ–«>\ä\è$†\ìZ»y\ÆôOÿ\0\í³\á{rÿ\0»\ãÏŠ\ÙP\r(¹,€Ÿ‰’\á´0‡‹-%\İøüx\Ûj,òÇ“ ^²ö†\æ\ë#Q\ë5\'9ö½ø`\à \él¬˜ˆÀRP÷ñ\0üv9‹¶÷\ç\í\Ê\Ù1h?L –kòÑŸ\Ô:O·•rcx\Å\nLX\ZØ°\Ä?~­§\àN¶“\×\Ç\Ùi72ğ°\Æs\Æf2ıezZ\rXş\Ş\îC\ä>7c\âşá¤°\'\ÊÛ±œ«²‚E±»!\í—#ûù·¦\Ë\"\Ú\ÈØ-G \Æög\Ö?¯ küµcù/R\Ç	^\ïN\Ï Tky\Ëwe†_À\â\Ö\î>Fù3ö_g%2DÓ—7šÇ¿<¥\å–\ç*ß¥\r °Œ,rS\n·…¦Uå¯›(ñ±\Âtø¾,>—1°1\å\ËFuß‚ó´³<P¹½‹\Ä\Ò\ÉPY/w…ò\Í\Ó_²- kò©\âG\Øò\Ò)\åøEOË“\àcÁ4ÕŸ&\ZøC>@±iıXş ~_\ç\Ò\î	?\×\ØªòÀ•øù†ªRÀ,¨Y²Ÿ\ãrYnÀ{€!g¦b\äø\Ù_4CŒüö>;\Ó\âş\Úü›y7ø\ÚğZ„€;g–„¸º‚ù/İ5¹’†TÛ¶ü\â|Lr±&ı¶Ô¾Œ\Ç%X\ì•Z\Æım\ÜYv%À3ö_—õ2>\Û)§ßƒ\ÂXşZü\ZXı~S|”ş?vG\ä•\äó û6ü\Çñø}\Çò6\×ğ\Òk‡Û“\ßõ›¼²ñô\Õ\Ö@\Û9‚\Î^xÈ´»H3\ãğùĞŒ\Z_\ã(f^\ÂvöºY9\çKòcÿ\0¼6¹J·]°\ìË¿\Ã\êo\éóS¥d\ç“jn\Ùû8€¨\î~À\Ö\×YùOöy\íısz\Ïû\áVj1\Ùú|@\í\ä²¡=ø\á\ì\ï\ØGÕ¹W¶@róerP,›ú\ïÍµWúš|\é°\çH^?6/ö\Õ\ËWltû\æ\ã{½¯K\ß\ÇòX6¾C\Ë\Øl\\?‹‡V‹ù\ËIX;o\Ç\ê\Å\Ùõü‘½^›\Ò÷xGUD\ëâ®|\ÇYiÏ¢ñ56XYİ²/ÿ\Ä\0#\0\0\0\0\0\0\0!1A Q0aq‘@\Ñÿ\Ú\0?øeš<³¶Å¡x\ì.\Ë=ö\Èş\î<´Gx\Ù\\¸³ùÿ\0\È	k¥\Ón)®Ø¸t‘o«?s\Éı\Æ\ßÛ‘5\ìö<m\Ë\×ó6–|p€/g\É°JP#Œó,@‡¤ÁqŸ²¦\Ë\è\Ù\á\'ûü\æDpñ–q—q†iOK	goşml\Îl|½\×e\Ö\Â\Ö÷ùv]0—\á\ì\'§m[öM\ÏY8ò\æŸ\Ù+«o\É4-•}\Øg?ğ\èknH\"u€V¸”úl4\ãa\ç±/\Õú¬\Ò\Ññó\í‘ ûeÜ€<»,¢B\ÉÄ\ËY’\Ñp\Â\î›ôşw…·P[^\Ú\à[\éb\í>cûù“—\ì˜K±ú¼ÀN\Ë\Z¤,v\ÔÕˆ<·øƒ`A^Á\ËT\ï\Ü}/y«šò3²vP\\s.8\Ş\Ûiœ(L\Ö	g’oöC\å£ğÙ—I\á;\Æh’gqÅƒ\0\Òw&+\Û(\"#=»~Eø°¡‰-µ\İÛŸm}Ÿ¥xø>\Ã\Z\ê+‰(0\Ø\Ø+\ê†Å½ú[`í¬œj\æXb\ìŸ\Ş5m‰\ÏmV\Òu\É\ŞM]~\Ó%YB\êû›^xg\Ò4	\ízİ´Cu\Ëö“q>ˆ\':—]ø>¿\ÖÙ–L¸–ˆ\Ğ\ØÄ¤ªB`\çfù‚0†\ç	#ô¢\ã\ê?¨3¶\ëe–\âû½\Ó>\r\ëx‰‰¶“­n$|&ÇŸË„Xp¼\ìo¶{Vƒcq§X~¡H»\'©ø‹VÁh¶v£9ŠÉ½\Ø\ç>\Ï<c\Íøò\ïˆyg¯\\2I\ÖO#¦2:r;}A¶ôVÍ¥\È±d\è†\ëwH –yw¨9ò\Â)ö\Ã	€t³\ìòh&\Û!P\'µ˜l¨fN\ÌaüH!0Kd¨\à\íI¬†(n\ç\×\Ã\äô¸m\Ç\à`™0&2n6\ZHÁ\Ğ7¤ 4\Ş\ÇylŒ´E–ÿ\0S§zúKN¯¶/Ü»›4ş\ç&»P(Á<e®\ÌD÷\"=€¸[;z|/KLø_@€kÿ\0i<<W\îÑ„¹`lG\î3\ÍaX\ÑõŸ•¿\Ù\Ä\ÍöúÁ¼Y¨x&\Şóì‡¢ ?¸w÷0KZùI\Ò\éqh\Äı\Şù÷[ù\ß\Ü=•Àô´œ\åœô§°Ô¹…şÅ¶t¯k9\ÛAş\Ë\ZbtKg¹e8_E\Äù)·XD\Éu´g·(d¢úOŸ‹&\àŒ†©\Ş\r‰#ˆ\ï\×mÛ\"\é^>ğ´E¿iÁ\ä‰# ö\â’x\Êp¿¦\á\äŸÕ”#\Â4@>[\Å›¤_¯„t°KCoõ›ÔŸG\Äy}1M•¶wŸA\ë\Õ\å|»\'µ3±/\"]>	\ÖE=„„x\ÇÜ³²Oò\Ü\ëatf\Î<gÔ‘\ä65S±UñÁüƒğ>@\Õl‘—ÀŸt·\îJıHYplûw\ÂY÷5«\Ş\å–‹Œ—\ì±	‘\ØH\ÊùXo>=\Ë\ê\ÉH\äôù\éË¸^ıYıJö\í«\á¥gñytô½/ilœm+`¾x\Èh\ÃÁ†cğ~s\ì\ér\é\Ãğ\rúŠ÷`\Ûñ›dB\Ï\Ø†\áK\\¼‘p&Ïo\È<øw¯‡ûüŒò*\Ç\çK\Õ3‡<¾\Ö\é%?\Ã\ê¸:C²AŸ3§K67».\Ï\àÀ\à½$\Â?|ñ·s\Û\Äñg“\Ñzml\ß>(£\ÖÜ–ûñ\ÓøAÎ—»ñ‡? ú\ÚÓ-O»Wf{†zIlò\ã%]‘A\Õ+\Ïaşqm£¯¿”	uü@¬_›\ìø\èóş\Ëû\ìŸÿ\0T\0\ÂğK­\Ó$}l±A\ëjş\ÙR9\ï\Ôş²\Ùğv\Ë!–>^~\r¹e\ØcŸ9\Şü\Ù\å\ä½1¼ûÁI¥js@\ä\ï©:‘\Ö\Òc&BjM³ù>\î:^|{ù³\Ë\Éz[\îı\\Ğ³M\åõ`%\ÂÀ\È>-a\ÎH7\Û(l~ÿ\Ä\0)\0\0\0\0\0\0\0!1AQaq¡‘±Á\Ñğ 0\á@ñÿ\Ú\0\0?„Oğ\ê5c\rZµqĞ­TV\ê¦ÿ\0$~!«\Å%Z6†KµeM%&¬V/òÑ™0-«Œ¸¾f±F>}\ìö›`\ç\Ì+¦Kÿ\0Z*c\r†‰Ï˜³‘+ñ\"\ÂwP¥Á\Ú-·¬¡Ô·f\çEò™¯¸\äƒM‘;XŸ?HG*É—(\Çc\Ú!Pğ+¯¥­w]`$.N½a¼8c^aø(U@ş¢Ëª+ı•u.Ï˜\Öû!³¬E™cn‰~…w53J;1¸¯¼3xdc+\ÆVã²•+s\Úu¥\Çµˆ³?iI®ò±c‡P¬e*2ü\Ê1F\çõ\ì¤\î]\Îñ7»yµÿ\0µÆ¢O‹5\Ğ}ı -XƒÌ¨\à€±\Ëe\ÛfZ\ç˜^jp<÷Š\ã.Oh¥\Ô_õÁ¸«QFµ12¼\ÑW{6‡‹\é¹l0¼Í”Y+†\Z\Åm=\È\ê}\ã–\ëÿ\0\0y…_\î}¥”]W~\á\rDkb\Ì\ãÿ\0Gf9ºˆ¾½P’>¦lI\Ê\è9—ó•[¢*„K\n\Ø\ë¹Bw®(D\ä\Z\ÕB\á-fpÁÿ\0‚¼U¯üJŒñş+\Ş{\Ùı¦	\ï<¬6\\œj†(ô²q‰}£€A¦|gñ*£e\Û\01µ–\è\'Ñœ¥\Ş	X*\âøğEj\Ú^‡H?ŠŒÂ­²:¥Oòm\è\Ì8`¥¡\è©B\ì¦	.A\Ú0ÀK¦\âıˆ:$Nj€XÌ·\Z\'tûŸ\Ä\×\â	õk§¤ªÀ6aa·\ØVcc›ªŸó;}‘ƒ*\Øu‚…–·³¯³è´€\äÿ\0!uS\ÃeY¾?\ÒW´\ÊV+r\Ê7€|1‹Yu˜¥)}M}b1[ö!	X\ë¨$r\á\èôö¨¾TrQ\Øş£\Æg\á\åAªK\ï\Ä\áYS‰\Ã\Û>„©Q\Ò\ÇÄ®s¢´µU\Ôş\0\á3K@11o?\ë\Å\ÇC¶#“€\ë\"ı\nÁ‡0d \'\n\Æ^¬|ƒh[a3Š-$HS’ˆ@ÃŒZQ\nYÁš½HaŞ•uªXÊ¢`\Úöjy\ï_\Şóù»\"Le\ZÌ­CX\àæ¾²¿\íA\Ú¢Tj\ã˜Óš³\ë\ëÀ±OvwS^¬€/Y¹…^av\ë\Ú>\r°%*\íÁ`ˆ\r1ª¬#\Ze¿ne\ĞQ%\ã7””\î:ğÎ§Wˆ0\ì \é\Ñ\Õ\á†5=\î37\Ü}*e\n\í¤bùbŠ#\r¤´­z0E”ô€©U­Ì²µlµw\Ë\âHº\Íú~!¢t´®\çº\âın–^ Jteñj,BUD Vû\×‰‚m:\Ç\ìQg\Ò:ÀS¢FfBz{‘%…½O\ÜM	\ß!|Eƒb’\ÆÎ›‹\â!)‹t\Ä\'Y¨a4¶ecĞ¯Lÿ\0É™X?\ä~fUğEY>c`.e[\Ş¡\Ã\êfd$¾mı¥‹*ÎŒk\áW/#g\0¯¼N°\nX7z¡\é¬‹%)ó\èù\Ì\ÄI£™ó*§Ye\Â\ÒT3{\ÃjZ{()i,¾±-\Û\Ú\Z÷= ¨Z\È\çù‹“—À{?ˆ\0ÀZnø\Ï\Ö\Å\Ê1][\ã#†üc¨¶\×\Şô”À\ßW’€lD\Æ\ĞÀ\áo˜\ÊY[\"À80Av\égy\Éô@¢:\'\Ş5xô•À\Ù*¯÷%\r\Ë\Ôfp-\îV\Ï3hºeXÛ¤\Z(¬~\ĞmHBt`\Â\Â<J\0Ç•†’%\nŸrm–˜òº€zŸh]mAV=e\Ş`\Ú!\ï\é]e™2´KH¬z\nò€\å~˜»‚b±pf\İ@h\ê\Ì*ñş÷‹\æQ\Ôô\nf\nU<B¿%\'r“J·\Û\×T®\æ,\È{“_b·–»-U°\ípº´²\â\Õ\Ñb\à\Ü\Ù\ê_]%¾Dj\Óóºø˜\\jëš€\nh³?03]\Ø\Ü4l5*#µYú–ÿ\0|\æ\"ªpD+‘\Ìs\árUı\"”\æ†;‹™M\ÅFt.I{\ÃpD\Ù*%¥\ËiøŠ\èc³]6]xƒ^®Á”^‰\Ú\Ñè•¦ƒˆª-\ÑÇ˜v@eŒ\ï¬\é™_¾\"„@3eü\Çc4¤`\Õ¹¥|¯\ŞòkZFö_x\İMJa­‘ı\ÌiŞ^\"Q¸˜v@ûOµÀzm‚\Únb»™µ˜+²mV1+<z\Ô\ë\0\Ça™\ÉÖ¿Sø¼\Çy…Q\Z\Ñ’\ê\æ\ÎP¸JT§Pşe@£GY\ëQIH\n¼¬R.4Í¼­ªT0LQhıˆX\0ú\Âj\ê·\Ù½\Ë}5RÜ‰»e	O’+,\í\âu6b+~=\r“¿¨¥\é.^\àú3šˆS\Ìp\ÌrAÁb’p¨Ú­®3“ªÿ\0xM©R\ÔûÀJQ¨\ÏÀÄ¨\Ëö\"¬\Ğ1\ãÔª2\Ø\Z\ÜWJ¼\Æ­\á¶¯¤‚!I\ÈÍ£s…\\¹†ú\àu\ÃH\Ó\ÌVšK\ë‰\\Xh¬şCñ\0DP4õ+oNJi¨qr\ã™aì²¾b)‘¾)\â&\ä<%O\ïó$;\î÷¢=\î<Bš\ßr^WP•\çFYó¿(OhO\Ìa¿İ°­o“©VWk\Ù\ß\â\\Ñ¢YgD¼„K}{F&O—/ôşÁ\Ó\Ó«\æ!63”ú\Şe›2®ıVD¨\é\ç\Ğ\å0\ÇÏ˜\é«6„Î›˜ş\â\ÍlMG\ì–\È\á\Ç_yò_˜&\Ê`KJÿ\0™Ÿ»(~£\îÀÏ£¿IŒÕŠºn}\Ì\ÙC1\í¾ğ\Ü+\ê.a—±¢CxA® y¼ğYw‹¤\çª÷›¤\Çù|¾•™†Ÿ\ê$Tù›ú\"ˆm¦\Zır~„	\'+Ÿ¤\Î \Î[ 6‰Ô²XË£lG0\às?«\ÌÏŸF\Şõ\í+‡Z|\ÌÇ»ö‡7Zü¾ˆ©F\è{ÿ\0±—[ñÿ\0\Øh–¿•\Åm[\ÖWû¨²¥©§4 \çO\Ô?‹—¹\Ó\Ä\rj`Yı5+j\Ş\Ğc, £µ\ËLAµ\ìw‡Œk:j?õw`\"RK(c¨>ú‰c(z€\ÈM?\äpñÀ¹yÀ\Å\Ù\İ–m»¬\Ê\Ø\Õ\Ş{n ¿¤Ioc¨©™÷J©|¦¢ƒu\â±ğ\Åkˆ\ÏI‚A£tşß´mv«<JJ{\Æu¡ZºMC\Ş	\Ë\\ÿ\0vŠg\æ‚4|Ó¾ú ·0A¶\îcHZ\Úw\\gºZ¨•\Ú<Tt=(»g‹Uø–\Şt\ä~_‰Š\ß:ü;\é\Ğ2œŒS\â\n\Ëmù§\'\ŞZ%s±^œ¢\n_§§05aC\ÄiwB«OrWó÷ƒ*«û\æ_µı÷÷÷\Şw¿\ßx¾\ß÷\Ş0²Ÿ\ßY\Ş}\å\ëMH{6\ÖYï¼¬e˜Šºşù–\æÿ\0\ÏK}YuC%(`8ô@P0jó\ÂY´z¬ZW¨Ö¼E‰].™^W‘Xº,\Éÿ\0\Z#\ì+o\ZŸ.@9a•\é)–¤«\Â7\0¥Wd»~\\z^Ñ£üEÒˆ\çl^r¥¨}\åz34–@•9±cù\Ñ\ËôM5ü1¦K¨/H\ä ÷™\Ëm\×pŸ\nJ\Õ\î¼Cv‡G‰ò`ú\ç¬\ï4\Î^`\Ø\Ê\ß0º]L~\"$M0!¤¢\ë}§ ó-|Êº\à­û³Q\ÆL÷|z1G¬+[„vW»X\Ê\Ø\Zd»\æ¦\\\ÌQ¹\ã<!U‡#(·\Zc@şx\äˆ\Ù$^J±f/\Ì\ËE\Ó;Ÿ*¾_˜p\íA\ì0\éˆk\Ç&’!‘\'÷‰¥5\Ê¬”%da\àhÁú\Ãa{t>ñ\\V³\åú‚‹Õ¹A/£´\ïR½¼5ş\Z),\Ô²\âc•†Ä‚\âÈ°A\Şm\î*a¦,{!gj)†_ Á)x\à\è\ÂZ‰Xÿ\0\È\nGL°º\Ëz»]W\Ñô5\ê(\â\"\Ò\\#\ÄTú\Ú}¥µ\rs\ZıÇ¯FƒBc\ãı\ç\à˜ù½5“¡Ó»,!Cg=\àf\Ó\n\Ó.-z|/\æn	`R<\ÆB«\ë\èöŠ\×Bı_C^‚ÁÕ†±«x•Àm4ø¨+c\Ç$Ï \ÃşN´\Ã9G§kqRvı\æ\Ş\ÉV!3\0r\è;X¬*¶]:& ¢¬pJ¢§`ó2\×ù]\ã9ôR¹#r[‹\ã\Ñõ5\é¦\æ÷L3Sãˆ°òJ¿T£¥zc*j\ØØ©F\×±”Œ\èKÎ§À\"@,\ê09{¼A¶\ßY˜¼kK¨\×tÒ¿\Ğ\é›Yt‡\å\è\ê|\æ<_A\"\âu•\İ~#=Ÿoø\Zô–Û¡•Œp\Ò|A0ÀbFI£˜ş±€4*B¯\Ä\\\Å\Ê[>g\å>\è!­\Ã#.œ\Ë\Ä]\à¸÷…\r‡=\"SÀP¨\ÜK¢ƒ±Z²À¸Q\íÿ\0QŠ\\ñ³Q{±\â\éö¢‰dU·\íõ5\èvö”ƒ\ÎXı\Ö\È\"Y‘õ\Õ\æ#·¢7ùŸ\Ñ\æ|}¸\0;„\Îù:aòò²¸zW\Ú5bˆßQÀŞµJ\éû„\ï„üˆ¦\Çyb\ë‹d*\Öy\Ëe\×\à‚\é&šFu\Ù\èjnT\n‚ƒ\Ôô±vz\ëó\è\ætŸ:küs>=OLşzMJ\âu,µ^\Õ\éx½|-¢±\Ô\Z”\ã\è\\ª0¡\İV¾\'+\Ö\ZR9!y\0×¡8¯¶:CSÿ\Ù','hardbop.jpg');
/*!40000 ALTER TABLE `eventimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventmember`
--

DROP TABLE IF EXISTS `eventmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventmember` (
  `eventid` int(11) NOT NULL,
  `memberid` int(11) NOT NULL AUTO_INCREMENT,
  `confirmcode` varchar(45) NOT NULL,
  `confirmed` int(1) NOT NULL DEFAULT '0',
  `email` varchar(80) NOT NULL,
  `dt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`memberid`),
  UNIQUE KEY `IDX_EVENTMEMBER_EVENT` (`eventid`,`memberid`),
  CONSTRAINT `FK_EVENTMEMBER_EVENT` FOREIGN KEY (`eventid`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventmember`
--

LOCK TABLES `eventmember` WRITE;
/*!40000 ALTER TABLE `eventmember` DISABLE KEYS */;
INSERT INTO `eventmember` VALUES (68,44,'k8wa15m91480931309914',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,45,'wqe4f6uc1480931354250',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,46,'8ruy3vk91480937534394',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,47,'krtrqhfo1480937573019',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,48,'jtiug55s1480937614102',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,49,'jxsfcfyn1480937685120',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,50,'4fmyb9is1481016221216',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,51,'xvxkquld1481016262003',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,52,'cy16y0us1481016469113',0,'eventservice@fbytes.com','2016-12-06 11:29:00'),(68,53,'vjijuojk1481016561276',0,'eventservice@fbytes.com','2016-12-06 11:29:21'),(68,54,'5myqw9be1481016712587',1,'eventservice@fbytes.com','2016-12-06 11:31:52'),(68,55,'j615ffzk1481019824150',1,'eventservice@fbytes.com','2016-12-06 12:23:44'),(68,56,'64b5z0or1481028078400',1,'eventservice@fbytes.com','2016-12-06 14:41:18'),(68,57,'qzzurpwx1481213157227',0,'eventservice@fbytes.com','2016-12-08 18:05:57'),(190,58,'p710ll971481556201336',0,'eventservice@fbytes.com','2016-12-12 17:23:21');
/*!40000 ALTER TABLE `eventmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mandatory` int(1) NOT NULL DEFAULT '0',
  `maxlen` int(4) DEFAULT NULL,
  `mask` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,68,'phone',1,NULL,NULL),(3,68,'lastname',1,NULL,NULL),(4,70,'phone',1,NULL,NULL),(6,70,'lastname',1,NULL,NULL),(7,69,'phone',1,NULL,NULL),(9,69,'lastname',1,NULL,NULL),(10,71,'phone',1,NULL,NULL),(12,71,'lastname',1,NULL,NULL),(33,130,'sdfgsdfg',1,30,''),(34,130,'xcvbxcvbxcvbxcvb',1,30,''),(35,130,'sdfgsdfg',1,30,''),(36,130,'xcvbxcvbxcvbxcvb',1,30,''),(39,132,'sdfgsdfg',1,30,''),(40,132,'xcvbxcvbxcvbxcvb',1,30,''),(41,133,'sdfgsdfg',1,30,''),(42,133,'xcvbxcvbxcvbxcvb',1,30,''),(43,134,'sdfgsdfgsdfg',1,30,''),(44,134,'zxcvzxcvzxcvzxcv',1,30,''),(45,135,'fsdgsdfgsdg',1,30,''),(46,135,'xcvbxcvbxcvbxvcb',1,30,''),(47,136,'ghdghdfghdfh',1,30,''),(48,136,'cvbncvbnvbnvbn',1,30,''),(49,137,'sfdgsdfgsdfg',1,30,''),(50,137,'xcvbxcvbxcvbxcvb',1,30,''),(51,139,'nfncvbncvbn',1,30,''),(52,149,'zzzzzzzzzzzzzzz',1,30,''),(53,155,'phone',1,30,''),(54,155,'lastname',1,30,''),(55,156,'phone',1,30,''),(56,156,'lastname',1,30,''),(57,174,'aaaaaaaaa',1,30,''),(58,174,'vvvvvvvvvvvvvv',1,30,''),(59,175,'name',1,30,''),(60,175,'lastname',1,30,''),(61,175,'phone',1,30,''),(62,175,'tz',1,30,''),(63,175,'facebook link',1,30,''),(64,176,'name',1,30,''),(65,176,'lastname',1,30,''),(66,176,'phone',1,30,''),(67,176,'tz',1,30,''),(68,176,'facebook link',1,30,''),(69,177,'name',1,30,''),(70,177,'lastname',1,30,''),(71,177,'phone',1,30,''),(72,177,'tz',1,30,''),(73,177,'facebook link',1,30,''),(74,178,'name',1,30,''),(75,178,'lastname',1,30,''),(76,178,'phone',1,30,''),(77,178,'tz',1,30,''),(78,178,'facebook link',1,30,''),(79,179,'name',1,30,''),(80,179,'lastname',1,30,''),(81,179,'phone',1,30,''),(82,179,'tz',1,30,''),(83,179,'facebook link',1,30,''),(84,180,'name',1,30,''),(85,180,'lastname',1,30,''),(86,180,'phone',1,30,''),(87,180,'tz',1,30,''),(88,180,'facebook link',1,30,''),(89,181,'name',1,30,''),(90,181,'lastname',1,30,''),(91,181,'phone',1,30,''),(92,181,'tz',1,30,''),(93,181,'facebook link',1,30,''),(94,190,'phone',1,30,''),(95,190,'name',1,30,''),(96,190,'lastname',1,30,''),(97,190,'tz',1,30,''),(98,190,'facebook link',1,30,''),(99,190,'city',1,30,''),(100,190,'address',1,30,''),(101,190,'postal code',1,30,'');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberdata`
--

DROP TABLE IF EXISTS `memberdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `data` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DATAFIELDS_idx` (`fieldid`),
  KEY `FK_DATAMEMBER_idx` (`memberid`),
  CONSTRAINT `FK_DATAMEMBER_EVENT` FOREIGN KEY (`memberid`) REFERENCES `eventmember` (`memberid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_DATAMEMBER_FIELD` FOREIGN KEY (`fieldid`) REFERENCES `fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberdata`
--

LOCK TABLES `memberdata` WRITE;
/*!40000 ALTER TABLE `memberdata` DISABLE KEYS */;
INSERT INTO `memberdata` VALUES (82,44,1,'123-4569987736'),(83,44,3,'Arobum Nipadush'),(84,45,1,'123-4569987736'),(85,45,3,'Arobum Nipadush'),(86,46,1,'123-987459867'),(87,46,3,'Arobum Nipadush'),(88,47,1,'123-4569987736'),(89,47,3,'Arobum Nipadush'),(90,48,1,'123-4569987736'),(91,48,3,'Arobum Nipadush'),(92,49,1,'123-4569987736'),(93,49,3,'Arobum Nipadush'),(94,50,1,'123-4569987736'),(95,50,3,'Arobum Nipadush'),(96,51,1,'123-987459867'),(97,51,3,'Arobum Nipadush'),(98,52,1,'123-987459867'),(99,52,3,'Arobum Nipadush'),(100,53,1,'123-4569987736'),(101,53,3,'Arobum Nipadush'),(102,54,1,'123-4569987736'),(103,54,3,'Arobum Nipadush'),(104,55,1,'123-4569987736'),(105,55,3,'Arobum Nipadush'),(106,56,1,'89264407764'),(107,56,3,'Grigoryan'),(108,57,1,'123-4569987736'),(109,57,3,'Arobum Nipadush'),(110,58,94,'111-045-86923494'),(111,58,95,'Nikolay'),(112,58,96,'Prostokvashenkov'),(113,58,97,'148070468'),(114,58,98,'http://somefblink.com'),(115,58,99,'Ashkelon'),(116,58,100,'Bar Kohba, 209'),(117,58,101,'113994');
/*!40000 ALTER TABLE `memberdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr`
--

DROP TABLE IF EXISTS `usr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `passwd` varchar(60) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_USR_NAME` (`name`),
  UNIQUE KEY `IDX_USR_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr`
--

LOCK TABLES `usr` WRITE;
/*!40000 ALTER TABLE `usr` DISABLE KEYS */;
INSERT INTO `usr` VALUES (1,'Sevick','47bce5c74f589f4867dbd57e9ca9f808','eventservice@fbytes.com');
/*!40000 ALTER TABLE `usr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_eventdata`
--

DROP TABLE IF EXISTS `v_eventdata`;
/*!50001 DROP VIEW IF EXISTS `v_eventdata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_eventdata` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `dt`,
 1 AS `regstart`,
 1 AS `regend`,
 1 AS `info`,
 1 AS `price`,
 1 AS `currency`,
 1 AS `minmembers`,
 1 AS `maxmembers`,
 1 AS `memberscount`,
 1 AS `imgslist`,
 1 AS `fields`,
 1 AS `vacancies`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_eventfields`
--

DROP TABLE IF EXISTS `v_eventfields`;
/*!50001 DROP VIEW IF EXISTS `v_eventfields`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_eventfields` AS SELECT 
 1 AS `fields`,
 1 AS `eventid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_memberdata`
--

DROP TABLE IF EXISTS `v_memberdata`;
/*!50001 DROP VIEW IF EXISTS `v_memberdata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_memberdata` AS SELECT 
 1 AS `eventid`,
 1 AS `memberid`,
 1 AS `email`,
 1 AS `confirmed`,
 1 AS `fieldid`,
 1 AS `fieldname`,
 1 AS `data`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pivotdata`
--

DROP TABLE IF EXISTS `v_pivotdata`;
/*!50001 DROP VIEW IF EXISTS `v_pivotdata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_pivotdata` AS SELECT 
 1 AS `eventid`,
 1 AS `pivotsql`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'register'
--

--
-- Dumping routines for database 'register'
--
/*!50003 DROP PROCEDURE IF EXISTS `Pivot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pivot`(
    IN tbl_name VARCHAR(99),       -- table name (or db.tbl)
    IN base_cols VARCHAR(99),      -- column(s) on the left, separated by commas
    IN pivot_col VARCHAR(64),      -- name of column to put across the top
    IN tally_col VARCHAR(64),      -- name of column to SUM up
    IN where_clause VARCHAR(99),   -- empty string or "WHERE ..."
    IN order_by VARCHAR(99)        -- empty string or "ORDER BY ..."; usually the base_cols
    )
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
    -- Find the distinct values
    -- Build the SUM()s
    SET @subq = CONCAT('SELECT DISTINCT ', pivot_col, ' AS val ',
                    ' FROM ', tbl_name, ' ', where_clause, ' ORDER BY 1');
    -- select @subq;

    SET @cc1 = "CONCAT('SUM(IF(&p = ', &v, ', &t, 0)) AS ', &v)";
    SET @cc2 = REPLACE(@cc1, '&p', pivot_col);
    SET @cc3 = REPLACE(@cc2, '&t', tally_col);
    -- select @cc2, @cc3;
    SET @qval = CONCAT("'\"', val, '\"'");
    -- select @qval;
    SET @cc4 = REPLACE(@cc3, '&v', @qval);
    -- select @cc4;

    SET SESSION group_concat_max_len = 10000;   -- just in case
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', @cc4, ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
     select @stmt;
    PREPARE _sql FROM @stmt;
    EXECUTE _sql;                      -- Intermediate step: build SQL for columns
    DEALLOCATE PREPARE _sql;
    -- Construct the query and perform it
    SET @stmt2 = CONCAT(
            'SELECT ',
                base_cols, ',\n',
                @sums,
                ',\n SUM(', tally_col, ') AS Total'
            '\n FROM ', tbl_name, ' ',
            where_clause,
            ' GROUP BY ', base_cols,
            '\n WITH ROLLUP',
            '\n', order_by
        );
    select @stmt2;                    -- The statement that generates the result
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;                     -- The resulting pivot table ouput
    DEALLOCATE PREPARE _sql;
    -- For debugging / tweaking, SELECT the various @variables after CALLing.
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_eventdata`
--

/*!50001 DROP VIEW IF EXISTS `v_eventdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_eventdata` AS select `eventdata`.`id` AS `id`,`eventdata`.`name` AS `name`,`eventdata`.`dt` AS `dt`,`eventdata`.`regstart` AS `regstart`,`eventdata`.`regend` AS `regend`,`eventdata`.`info` AS `info`,`eventdata`.`price` AS `price`,`eventdata`.`currency` AS `currency`,`eventdata`.`minmembers` AS `minmembers`,`eventdata`.`maxmembers` AS `maxmembers`,ifnull(`memberscount`.`memberscount`,0) AS `memberscount`,`imgs`.`imgslist` AS `imgslist`,`eventfields`.`fields` AS `fields`,(`eventdata`.`maxmembers` - ifnull(`memberscount`.`memberscount`,0)) AS `vacancies` from (((((select `register`.`event`.`id` AS `id`,`register`.`event`.`name` AS `name`,`register`.`event`.`dt` AS `dt`,`register`.`event`.`regstart` AS `regstart`,`register`.`event`.`regend` AS `regend`,`register`.`event`.`info` AS `info`,`register`.`event`.`price` AS `price`,`register`.`event`.`currency` AS `currency`,`register`.`event`.`minmembers` AS `minmembers`,`register`.`event`.`maxmembers` AS `maxmembers` from `register`.`event`)) `eventdata` left join (select `register`.`eventmember`.`eventid` AS `eventid`,count(1) AS `memberscount` from `register`.`eventmember` group by `register`.`eventmember`.`eventid`) `memberscount` on((`memberscount`.`eventid` = `eventdata`.`id`))) left join (select `register`.`eventimg`.`eventid` AS `eventid`,group_concat(`register`.`eventimg`.`name` separator '|') AS `imgslist` from `register`.`eventimg` group by `register`.`eventimg`.`eventid`) `imgs` on((`eventdata`.`id` = `imgs`.`eventid`))) left join (select concat('{"fields":[',group_concat(json_object('id',`register`.`fields`.`id`,'name',`register`.`fields`.`name`,'mandatory',(case when (`register`.`fields`.`mandatory` = 0) then 'false' else 'true' end),'maxlen',`register`.`fields`.`maxlen`,'mask',`register`.`fields`.`mask`) separator ','),']}') AS `fields`,`register`.`fields`.`eventid` AS `eventid` from `register`.`fields` group by `register`.`fields`.`eventid`) `eventfields` on((`eventdata`.`id` = `eventfields`.`eventid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_eventfields`
--

/*!50001 DROP VIEW IF EXISTS `v_eventfields`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_eventfields` AS select group_concat(json_object('id',`fields`.`id`,'name',`fields`.`name`,'mandatory',(case when (`fields`.`mandatory` = 0) then 'false' else 'true' end)) separator '|') AS `fields`,`fields`.`eventid` AS `eventid` from `fields` group by `fields`.`eventid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_memberdata`
--

/*!50001 DROP VIEW IF EXISTS `v_memberdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_memberdata` AS select `flds`.`eventid` AS `eventid`,`members`.`memberid` AS `memberid`,`members`.`email` AS `email`,`members`.`confirmed` AS `confirmed`,`flds`.`id` AS `fieldid`,`flds`.`fieldname` AS `fieldname`,`memberdata`.`data` AS `data` from ((((select `register`.`eventmember`.`memberid` AS `memberid`,`register`.`eventmember`.`eventid` AS `eventid`,`register`.`eventmember`.`email` AS `email`,`register`.`eventmember`.`confirmed` AS `confirmed` from `register`.`eventmember`)) `members` left join (select `register`.`fields`.`id` AS `id`,`register`.`fields`.`name` AS `fieldname`,`register`.`fields`.`eventid` AS `eventid` from `register`.`fields`) `flds` on((`flds`.`eventid` = `members`.`eventid`))) left join (select `register`.`memberdata`.`memberid` AS `memberid`,`register`.`memberdata`.`fieldid` AS `fieldid`,`register`.`memberdata`.`data` AS `data` from `register`.`memberdata`) `memberdata` on(((`flds`.`id` = `memberdata`.`fieldid`) and (`members`.`memberid` = `memberdata`.`memberid`)))) order by `flds`.`eventid`,`members`.`memberid`,`flds`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pivotdata`
--

/*!50001 DROP VIEW IF EXISTS `v_pivotdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pivotdata` AS select `fields`.`eventid` AS `eventid`,concat('select eventid,memberid, email, ',group_concat(concat('max(case when fieldname=\'',`fields`.`name`,'\' then data end) AS \'',`fields`.`name`,'\'') separator ','),',confirmed from v_memberdata group by eventid,memberid,email HAVING eventid=?') AS `pivotsql` from `fields` group by `fields`.`eventid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-12 17:54:49
