-- MySQL dump 10.13  Distrib 5.7.25, for osx10.14 (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (49,'rick','rick','rick@gmail.com','rick@gmail.com',1,NULL,'$2y$13$wjwkHH8pFM0Dht6Pq5Kxue9SDXVLHv8NSqsQl7iK4a2TPknQlNnx2',NULL,NULL,NULL,'a:0:{}'),(50,'morty','morty','morty@gmail.com','morty@gmail.com',1,NULL,'$2y$13$xaG74yUqq/EeZdI6gv7EbuVp82n8ldzSm.Yj1EtJYL5IN6km4osty',NULL,NULL,NULL,'a:0:{}'),(51,'beth','beth','beth@gmail.com','beth@gmail.com',1,NULL,'$2y$13$tfLUAK6HueTKlgwKLUHpJOWOjxNa9i5m8Bd9apfIFiLxPMFO/sFTq',NULL,NULL,NULL,'a:0:{}'),(52,'nurbek','nurbek','abd.nurbek@gmail.com','abd.nurbek@gmail.com',1,NULL,'$2y$13$GMpkegwPCxzV24c5pCgAwevijtwu1ADtuiJc2XtIBmmOeLwiMq.gG','2019-05-28 09:43:39',NULL,NULL,'a:0:{}');
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DA76ED395` (`user_id`),
  CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (150,50,'2019-05-27 22:55:46','Amet elit agas ille mark et sed inquit video inponebat','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat enim Polemonis. Summum a vobis bonum voluptas dicitur. Quid iudicant sensus? Duo Reges: constructio interrete. Quis istud possit, inquit, negare? <i>Quippe: habes enim a rhetoribus;</i> </p>\n\n'),(151,50,'2019-05-26 22:39:19','Constructio elit reges haec physicis consectetur et in nomine duo','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Invidiosum nomen est, infame, suspectum. Summum a vobis bonum voluptas dicitur. Quis est tam dissimile homini. Ille incendat? Duo Reges: constructio interrete. Comprehensum, quod cognitum non habet? </p>\n\n'),(152,49,'2019-05-27 00:05:50','Hac dolor duo elit intellegis inquit constructio epicurus est nostrane','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quae tandem ista ratio est? <b>Sint ista Graecorum;</b> Memini vero, inquam; Quis enim redargueret? Duo Reges: constructio interrete. <b>Itaque ab his ordiamur.</b> </p>\n\n'),(153,50,'2019-05-27 16:38:01','Haec retexueris potes p elit sit positum amet in ipsum','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quae duo sunt, unum facit. Poterat autem inpune; Duo Reges: constructio interrete. Quo modo autem philosophus loquitur? </p>\n\n'),(154,50,'2019-05-27 08:34:23','Absolutam dicit hilaretur p interrete iucundum omnes quicquam habeatur si','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Stoicos roga. Pollicetur certe. <b>Iam in altera philosophiae parte.</b> Eadem fortitudinis ratio reperietur. <i>Urgent tamen et nihil remittunt.</i> </p>\n\n'),(155,50,'2019-05-27 17:14:41','Explicari sit quaeritur ergo lorem enim aliter piso b quod','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praeclarae mortes sunt imperatoriae; <b>Primum Theophrasti, Strato, physicum se voluit;</b> Duo Reges: constructio interrete. Qui est in parvis malis. <i>At, illa, ut vobis placet, partem quandam tuetur, reliquam deserit.</i> Suo genere perveniant ad extremum; </p>\n\n'),(156,49,'2019-05-27 20:04:58','Adipiscing mihi recusant sit id beatiorem inquam consectetur ipsum esse','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nos vero, inquit ille; <i>Bonum incolumis acies: misera caecitas.</i> </p>\n\n'),(157,49,'2019-05-27 21:45:13','Sit p mark ergo utilitatis loquitur p respondeat mark intellegit','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dempta enim aeternitate nihilo beatior Iuppiter quam Epicurus; <i>Aliter enim nosmet ipsos nosse non possumus.</i> Huius ego nunc auctoritatem sequens idem faciam. At enim hic etiam dolore. Duo Reges: constructio interrete. Istam voluptatem, inquit, Epicurus ignorat? </p>\n\n'),(158,50,'2019-05-27 01:29:39','Schola i quidem inquit minime constructio adipiscing quae in i','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Immo alio genere; Prave, nequiter, turpiter cenabat; Quis Aristidem non mortuum diligit? Haeret in salebra. </p>\n\n'),(159,51,'2019-05-26 20:41:31','Esse p cave differt posthac p media verius ipsum potest','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tum Torquatus: Prorsus, inquit, assentior; Scrupulum, inquam, abeunti; Sed quid sentiat, non videtis. Duo Reges: constructio interrete. </p>\n\n'),(160,52,'2019-05-28 09:43:56','Привет мир','Hello World');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_post`
--

DROP TABLE IF EXISTS `sub_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D1CF34CA76ED395` (`user_id`),
  KEY `IDX_7D1CF34C4B89032C` (`post_id`),
  CONSTRAINT `FK_7D1CF34C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FK_7D1CF34CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_post`
--

LOCK TABLES `sub_post` WRITE;
/*!40000 ALTER TABLE `sub_post` DISABLE KEYS */;
INSERT INTO `sub_post` VALUES (613,49,150,'2019-05-26 21:51:20','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis Aristidem non mortuum diligit? <b>Quae contraria sunt his, malane?</b> Si quae forte-possumus. At certe gravius. Iam contemni non poteris. <b>Duo Reges: constructio interrete.</b> </p>\n\n'),(614,49,150,'2019-05-27 05:34:44','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facillimum id quidem est, inquam. Quaerimus enim finem bonorum. Memini vero, inquam; Quae cum dixisset, finem ille. Quae similitudo in genere etiam humano apparet. </p>\n\n'),(615,51,150,'2019-05-27 11:43:52','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quid attinet de rebus tam apertis plura requirere? Ut aliquid scire se gaudeant? Unum est sine dolore esse, alterum cum voluptate. Falli igitur possumus. <b>Quis negat?</b> </p>\n\n'),(616,51,150,'2019-05-27 18:13:45','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <b>Itaque contra est, ac dicitis;</b> Quid Zeno? Huius ego nunc auctoritatem sequens idem faciam. Nihil enim hoc differt. </p>\n\n'),(617,50,150,'2019-05-27 03:21:04','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Audeo dicere, inquit. Philosophi autem in suis lectulis plerumque moriuntur. Negat enim summo bono afferre incrementum diem. Quibusnam praeteritis? </p>\n\n'),(618,51,150,'2019-05-27 14:01:42','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Restatis igitur vos; Id est enim, de quo quaerimus. Non est igitur summum malum dolor. Duo Reges: constructio interrete. Frater et T. <b>De vacuitate doloris eadem sententia erit.</b> </p>\n\n'),(619,51,150,'2019-05-27 03:41:59','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quae cum dixisset, finem ille. At multis se probavit. Duarum enim vitarum nobis erunt instituta capienda. Quod iam a me expectare noli. </p>\n\n'),(620,50,151,'2019-05-27 19:39:09','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <mark>Praeclare hoc quidem.</mark> Eam stabilem appellas. Non est ista, inquam, Piso, magna dissensio. Duo Reges: constructio interrete. <mark>Itaque contra est, ac dicitis;</mark> Videsne quam sit magna dissensio? </p>\n\n'),(621,51,151,'2019-05-27 14:15:18','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Si longus, levis. Eaedem res maneant alio modo. Esse enim quam vellet iniquus iustus poterat inpune. Duo Reges: constructio interrete. Istam voluptatem, inquit, Epicurus ignorat? </p>\n\n'),(622,50,151,'2019-05-26 23:42:16','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quid ait Aristoteles reliquique Platonis alumni? Illa tamen simplicia, vestra versuta. Esse enim, nisi eris, non potes. Duo Reges: constructio interrete. Vide, quantum, inquam, fallare, Torquate. Nemo nostrum istius generis asotos iucunde putat vivere. </p>\n\n'),(623,49,151,'2019-05-27 14:39:03','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qua tu etiam inprudens utebare non numquam. Quid de Platone aut de Democrito loquar? Confecta res esset. Sed quae tandem ista ratio est? Qui ita affectus, beatum esse numquam probabis; Invidiosum nomen est, infame, suspectum. Duo Reges: constructio interrete. <i>Bonum patria: miserum exilium.</i> </p>\n\n'),(624,50,151,'2019-05-27 12:23:04','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suo enim quisque studio maxime ducitur. Sed nimis multa. <mark>Si quae forte-possumus.</mark> Certe, nisi voluptatem tanti aestimaretis. Etiam beatissimum? </p>\n\n'),(625,49,151,'2019-05-26 20:33:25','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dat enim intervalla et relaxat. De vacuitate doloris eadem sententia erit. Quis est tam dissimile homini. Non laboro, inquit, de nomine. </p>\n\n'),(626,50,151,'2019-05-26 22:09:24','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quid de Platone aut de Democrito loquar? Quorum altera prosunt, nocent altera. Hic ambiguo ludimur. Ita graviter et severe voluptatem secrevit a bono. </p>\n\n'),(627,50,152,'2019-05-27 22:15:16','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et nemo nimium beatus est; Gerendus est mos, modo recte sentiat. <i>Recte dicis;</i> Que Manilium, ab iisque M. </p>\n\n'),(628,51,152,'2019-05-27 16:58:13','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Equidem, sed audistine modo de Carneade? Si enim ad populum me vocas, eum. Quid de Pythagora? Laboro autem non sine causa; </p>\n\n'),(629,50,152,'2019-05-27 12:09:53','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <i>Quae contraria sunt his, malane?</i> <mark>Itaque his sapiens semper vacabit.</mark> Quis est, qui non oderit libidinosam, protervam adolescentiam? Duo Reges: constructio interrete. <i>Quo modo autem philosophus loquitur?</i> Cur id non ita fit? </p>\n\n'),(630,51,152,'2019-05-27 04:40:08','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qui ita affectus, beatum esse numquam probabis; Poterat autem inpune; Primum quid tu dicis breve? Sedulo, inquam, faciam. Ratio quidem vestra sic cogit. Negat enim summo bono afferre incrementum diem. </p>\n\n'),(631,50,152,'2019-05-27 04:52:28','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non laboro, inquit, de nomine. Illi enim inter se dissentiunt. Duo Reges: constructio interrete. Disserendi artem nullam habuit. </p>\n\n'),(632,50,152,'2019-05-27 17:03:45','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Prioris generis est docilitas, memoria; Tum ille: Ain tandem? Quid enim? Quae cum dixisset, finem ille. Non risu potius quam oratione eiciendum? Negat esse eam, inquit, propter se expetendam. </p>\n\n'),(633,50,152,'2019-05-27 17:36:38','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quid de Pythagora? Sine ea igitur iucunde negat posse se vivere? <b>Ut pulsi recurrant?</b> Haec quo modo conveniant, non sane intellego. Duo Reges: constructio interrete. Occultum facinus esse potuerit, gaudebit; Non enim iam stirpis bonum quaeret, sed animalis. Profectus in exilium Tubulus statim nec respondere ausus; </p>\n\n'),(634,49,152,'2019-05-26 23:50:47','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Conferam avum tuum Drusum cum C. Neutrum vero, inquit ille. <mark>Urgent tamen et nihil remittunt.</mark> Duo Reges: constructio interrete. Bonum liberi: misera orbitas. Non laboro, inquit, de nomine. </p>\n\n'),(635,49,153,'2019-05-27 12:26:27','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ad illum redeo. Nunc de hominis summo bono quaeritur; Audeo dicere, inquit. <i>Cur id non ita fit?</i> </p>\n\n'),(636,49,153,'2019-05-27 00:20:43','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Hoc loco tenere se Triarius non potuit. Suo genere perveniant ad extremum; <i>Et quod est munus, quod opus sapientiae?</i> Faceres tu quidem, Torquate, haec omnia; Duo Reges: constructio interrete. Hic ambiguo ludimur. Ne discipulum abducam, times. Quae similitudo in genere etiam humano apparet. </p>\n\n'),(637,50,153,'2019-05-27 19:47:15','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Occultum facinus esse potuerit, gaudebit; Duo Reges: constructio interrete. Si quae forte-possumus. Hoc mihi cum tuo fratre convenit. Occultum facinus esse potuerit, gaudebit; </p>\n\n'),(638,51,153,'2019-05-27 23:25:17','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Honesta oratio, Socratica, Platonis etiam. Et nemo nimium beatus est; Quis hoc dicit? Comprehensum, quod cognitum non habet? </p>\n\n'),(639,49,153,'2019-05-27 09:17:03','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Respondeat totidem verbis. Si longus, levis dictata sunt. Omnes enim iucundum motum, quo sensus hilaretur. Duo Reges: constructio interrete. </p>\n\n'),(640,49,153,'2019-05-27 12:47:05','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <i>Audeo dicere, inquit.</i> Ut pulsi recurrant? Nulla erit controversia. Haeret in salebra. Quae cum dixisset, finem ille. </p>\n\n'),(641,49,153,'2019-05-27 03:37:48','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Collige omnia, quae soletis: Praesidium amicorum. <mark>Nonne igitur tibi videntur, inquit, mala?</mark> Ecce aliud simile dissimile. Ita prorsus, inquam; Sed ea mala virtuti magnitudine obruebantur. </p>\n\n'),(642,51,153,'2019-05-27 12:19:24','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dici enim nihil potest verius. At coluit ipse amicitias. </p>\n\n'),(643,51,153,'2019-05-27 03:07:09','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Teneo, inquit, finem illi videri nihil dolere. <mark>Sed fac ista esse non inportuna;</mark> Iubet igitur nos Pythius Apollo noscere nosmet ipsos. Memini me adesse P. Que Manilium, ab iisque M. <b>Bonum liberi: misera orbitas.</b> </p>\n\n'),(644,49,154,'2019-05-27 01:05:47','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <b>Re mihi non aeque satisfacit, et quidem locis pluribus.</b> Ea possunt paria non esse. <b>Praeteritis, inquit, gaudeo.</b> Quamquam te quidem video minime esse deterritum. Summum a vobis bonum voluptas dicitur. <mark>Idemne, quod iucunde?</mark> Duo Reges: constructio interrete. Dicimus aliquem hilare vivere; </p>\n\n'),(645,50,154,'2019-05-27 23:18:57','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Verba tu fingas et ea dicas, quae non sentias? Quae duo sunt, unum facit. Dici enim nihil potest verius. Nam ante Aristippus, et ille melius. Quamquam te quidem video minime esse deterritum. <i>Quid dubitas igitur mutare principia naturae?</i> Primum in nostrane potestate est, quid meminerimus? </p>\n\n'),(646,51,155,'2019-05-27 12:53:46','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <i>Neutrum vero, inquit ille.</i> Ut id aliis narrare gestiant? Duo Reges: constructio interrete. At eum nihili facit; Prioris generis est docilitas, memoria; Dici enim nihil potest verius. </p>\n\n'),(647,49,155,'2019-05-27 06:32:02','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Idem adhuc; Est, ut dicis, inquam. Cur iustitia laudatur? Non laboro, inquit, de nomine. Duo Reges: constructio interrete. Tibi hoc incredibile, quod beatissimum. </p>\n\n'),(648,50,155,'2019-05-27 15:54:28','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <b>Quid censes in Latino fore?</b> Sic enim censent, oportunitatis esse beate vivere. Ille enim occurrentia nescio quae comminiscebatur; Ne discipulum abducam, times. </p>\n\n'),(649,50,155,'2019-05-27 00:50:26','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qui-vere falsone, quaerere mittimus-dicitur oculis se privasse; <b>Hunc vos beatum;</b> Inquit, dasne adolescenti veniam? Nunc vides, quid faciat. </p>\n\n'),(650,51,156,'2019-05-27 19:29:22','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Istam voluptatem perpetuam quis potest praestare sapienti? Deprehensus omnem poenam contemnet. Paria sunt igitur. Cur iustitia laudatur? Sed quae tandem ista ratio est? </p>\n\n'),(651,50,156,'2019-05-27 10:01:31','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sic consequentibus vestris sublatis prima tolluntur. Vitae autem degendae ratio maxime quidem illis placuit quieta. Duo Reges: constructio interrete. Itaque hic ipse iam pridem est reiectus; </p>\n\n'),(652,50,156,'2019-05-27 03:04:44','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <b>Quod iam a me expectare noli.</b> <b>Nunc de hominis summo bono quaeritur;</b> Occultum facinus esse potuerit, gaudebit; Conferam avum tuum Drusum cum C. </p>\n\n'),(653,49,156,'2019-05-27 14:30:12','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Recte, inquit, intellegis. Quod quidem iam fit etiam in Academia. <i>Restinguet citius, si ardentem acceperit.</i> Contemnit enim disserendi elegantiam, confuse loquitur. Duo Reges: constructio interrete. Quod vestri non item. </p>\n\n'),(654,49,156,'2019-05-27 22:08:33','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <i>Sed fac ista esse non inportuna;</i> Reguli reiciendam; <i>Iam in altera philosophiae parte.</i> Duo Reges: constructio interrete. Dicimus aliquem hilare vivere; </p>\n\n'),(655,50,156,'2019-05-27 06:30:53','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laboro autem non sine causa; Omnes enim iucundum motum, quo sensus hilaretur. Qui ita affectus, beatum esse numquam probabis; <b>Duo Reges: constructio interrete.</b> </p>\n\n'),(656,51,157,'2019-05-27 05:38:04','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mehercule pergrata mihi oratio tua. Non laboro, inquit, de nomine. Quaerimus enim finem bonorum. Duo Reges: constructio interrete. Efficiens dici potest. <b>Equidem, sed audistine modo de Carneade?</b> </p>\n\n'),(657,50,157,'2019-05-27 21:06:31','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duo Reges: constructio interrete. Idemne, quod iucunde? Certe, nisi voluptatem tanti aestimaretis. Beatus sibi videtur esse moriens. Si longus, levis dictata sunt. <i>Audeo dicere, inquit.</i> </p>\n\n'),(658,51,157,'2019-05-27 10:00:55','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Teneo, inquit, finem illi videri nihil dolere. Hic ambiguo ludimur. <i>Ita graviter et severe voluptatem secrevit a bono.</i> Expectoque quid ad id, quod quaerebam, respondeas. Ita prorsus, inquam; </p>\n\n'),(659,50,157,'2019-05-26 23:36:48','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bestiarum vero nullum iudicium puto. Si mala non sunt, iacet omnis ratio Peripateticorum. Falli igitur possumus. Ut id aliis narrare gestiant? Scrupulum, inquam, abeunti; Duo Reges: constructio interrete. </p>\n\n'),(660,50,157,'2019-05-27 07:45:44','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. At enim hic etiam dolore. Si longus, levis dictata sunt. Quid est enim aliud esse versutum? Sed plane dicit quod intellegit. Cur iustitia laudatur? Quo modo? </p>\n\n'),(661,51,157,'2019-05-27 01:17:20','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Moriatur, inquit. <i>Nemo igitur esse beatus potest.</i> Sedulo, inquam, faciam. Eam stabilem appellas. </p>\n\n'),(662,49,157,'2019-05-27 05:39:33','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Idemne, quod iucunde? Haec quo modo conveniant, non sane intellego. Omnes enim iucundum motum, quo sensus hilaretur. Iubet igitur nos Pythius Apollo noscere nosmet ipsos. Duo Reges: constructio interrete. Sed in rebus apertissimis nimium longi sumus. Tum ille timide vel potius verecunde: Facio, inquit. </p>\n\n'),(663,49,158,'2019-05-27 00:13:12','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam enim adesse poterit. Duo Reges: constructio interrete. Quod quidem nobis non saepe contingit. Sed haec omittamus; Satis est ad hoc responsum. Quonam modo? Obsecro, inquit, Torquate, haec dicit Epicurus? <b>Haec para/doca illi, nos admirabilia dicamus.</b> </p>\n\n'),(664,49,158,'2019-05-27 13:36:39','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quod cum dixissent, ille contra. De hominibus dici non necesse est. Tollenda est atque extrahenda radicitus. Traditur, inquit, ab Epicuro ratio neglegendi doloris. </p>\n\n'),(665,50,158,'2019-05-27 23:34:27','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis enim redargueret? Cur iustitia laudatur? Quae diligentissime contra Aristonem dicuntur a Chryippo. <i>Quoniam, si dis placet, ab Epicuro loqui discimus.</i> Itaque contra est, ac dicitis; Verba tu fingas et ea dicas, quae non sentias? Duo Reges: constructio interrete. Non potes, nisi retexueris illa. </p>\n\n'),(666,51,159,'2019-05-27 06:11:02','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qua igitur re ab deo vincitur, si aeternitate non vincitur? Id mihi magnum videtur. Quid iudicant sensus? At certe gravius. Idemne, quod iucunde? </p>\n\n'),(667,51,159,'2019-05-26 21:05:21','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Recte, inquit, intellegis. Facile est hoc cernere in primis puerorum aetatulis. <i>Nihil enim hoc differt.</i> Sic consequentibus vestris sublatis prima tolluntur. </p>\n\n'),(668,50,159,'2019-05-27 01:21:44','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <b>Nam quid possumus facere melius?</b> Ita ne hoc quidem modo paria peccata sunt. Haeret in salebra. Duo Reges: constructio interrete. </p>\n\n'),(669,50,159,'2019-05-27 04:40:06','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <i>Expectoque quid ad id, quod quaerebam, respondeas.</i> <i>Ad eas enim res ab Epicuro praecepta dantur.</i> Sequitur disserendi ratio cognitioque naturae; Duo Reges: constructio interrete. Videsne, ut haec concinant? <b>Quid enim est a Chrysippo praetermissum in Stoicis?</b> Audeo dicere, inquit. </p>\n\n'),(670,52,160,'2019-05-28 09:44:08','Тестим комментарий'),(671,52,160,'2019-05-28 09:44:16','Как дела');
/*!40000 ALTER TABLE `sub_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-29 14:39:11