-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shop_online
--

CREATE DATABASE IF NOT EXISTS shop_online;
USE shop_online;

--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `cat_name` varchar(45) NOT NULL,
  `cat_desc` varchar(200) NOT NULL,
  PRIMARY KEY  (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`cat_id`,`cat_name`,`cat_desc`) VALUES 
 (4,'Desktop','3 type desktop product are available.'),
 (5,'Laptop','Various brand laptop are available.'),
 (6,'Mobile','Lenovo & Itel mobile, tablet are available.'),
 (7,'Accessories','All kind of computer accessories available.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `delivery_cost`
--

DROP TABLE IF EXISTS `delivery_cost`;
CREATE TABLE `delivery_cost` (
  `delivery_id` int(10) unsigned NOT NULL auto_increment,
  `zone_name` varchar(45) NOT NULL,
  `delivery_cost` double NOT NULL,
  PRIMARY KEY  USING BTREE (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_cost`
--

/*!40000 ALTER TABLE `delivery_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_cost` ENABLE KEYS */;


--
-- Definition of table `pro_order`
--

DROP TABLE IF EXISTS `pro_order`;
CREATE TABLE `pro_order` (
  `order_id` int(10) unsigned NOT NULL auto_increment,
  `pro_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `order_date` date NOT NULL,
  `order_qty` int(10) unsigned NOT NULL,
  `total_price` double NOT NULL,
  `order_status` varchar(45) NOT NULL default '"N"',
  `delivery_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`order_id`),
  KEY `FK_pro_order_pro_id` (`pro_id`),
  KEY `FK_pro_order_user_id` (`user_id`),
  KEY `FK_pro_order_delivery_id` (`delivery_id`),
  CONSTRAINT `FK_pro_order_delivery_id` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_cost` (`delivery_id`),
  CONSTRAINT `FK_pro_order_pro_id` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
  CONSTRAINT `FK_pro_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_order`
--

/*!40000 ALTER TABLE `pro_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_order` ENABLE KEYS */;


--
-- Definition of table `pro_order_details`
--

DROP TABLE IF EXISTS `pro_order_details`;
CREATE TABLE `pro_order_details` (
  `order_details_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` int(10) unsigned NOT NULL,
  `pro_id` int(10) unsigned NOT NULL,
  `pro_qty` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`order_details_id`),
  KEY `FK_pro_order_details_order_id` (`order_id`),
  KEY `FK_pro_order_details_pro_id` (`pro_id`),
  CONSTRAINT `FK_pro_order_details_order_id` FOREIGN KEY (`order_id`) REFERENCES `pro_order` (`order_id`),
  CONSTRAINT `FK_pro_order_details_pro_id` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_order_details`
--

/*!40000 ALTER TABLE `pro_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_order_details` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id` int(10) unsigned NOT NULL auto_increment,
  `sub_cat_id` int(10) unsigned NOT NULL,
  `pro_name` varchar(45) NOT NULL,
  `pro_qty` int(10) unsigned NOT NULL,
  `pro_price` double NOT NULL,
  `pro_url` varchar(45) NOT NULL,
  `pro_desc` varchar(500) NOT NULL,
  PRIMARY KEY  (`pro_id`),
  KEY `FK_product_sub_cat_id` (`sub_cat_id`),
  CONSTRAINT `FK_product_sub_cat_id` FOREIGN KEY (`sub_cat_id`) REFERENCES `sub_category` (`sub_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`pro_id`,`sub_cat_id`,`pro_name`,`pro_qty`,`pro_price`,`pro_url`,`pro_desc`) VALUES 
 (1,4,'HP Pavilion X4600',15,29500,'propic2.jpg','Processor - 6th Gen. Intel Core i3 6100, Chipset - Intel H110, Monitor - 19.5\'\' Monitor, RAM - 4GB, RAM Type - DDR3 1600MHz, HDD - 1TB HDD, HDD Type - SATA 7200RPM, Graphics Chipset - Intel HD 530, Optical Device - DVD-RW, Warranty - 3 year'),
 (2,5,'Mac Pro Plus',15,55000,'pic1.jpg','Processor - 6th Gen. Core i3 6100, Chipset - Intel H110, Monitor - 19.5\'\' Monitor, RAM - 4GB, RAM Type - DDR3 1600MHz, HDD - 256GB SSD,  Graphics Chipset - Intel HD 530, Optical Device - DVD-RW, Warranty - 3 year'),
 (3,6,'Lenovo Touchsmart',15,65000,'propic3.jpg','Processor - 6th Gen. Core i3 6100, Chipset - Intel H110, Monitor - 19.5\'\' TouchMonitor, RAM - 4GB, RAM Type - DDR3 1600MHz, HDD - 1TB HDD,  Graphics Chipset - Intel HD 530, Optical Device - DVD-RW, Warranty - 3 year'),
 (4,4,'HP Prodesk 400 G3 MT',20,25000,'hp-v0c45ut.jpg','Processor - 6th Gen. Intel Core i3 6100, Chipset - Intel H110, Monitor - 19.5\'\' Monitor, RAM - 4GB, RAM Type - DDR3 1600MHz, HDD - 1TB HDD, HDD Type - SATA 7200RPM, Graphics Chipset - Intel HD 530, Optical Device - DVD-RW, Warranty - 3 year'),
 (5,4,'DELL OPTIPLEX Micro 3040',20,35000,'dell optiplex.gif','Processor - 6th Gen. Intel Core i5 6500T, Chipset - INTEL H110, Monitor - 18.5\'\' Wide angle view, RAM - 4GB, RAM Type - DDR3 1600MHz, HDD - 500GB, Graphics Chipset - Intel HD,  Speaker - Yes, Keyboard - Dell KB216 USB Keyboard, Mouse - Dell USB MS116 Mouse, Ubuntu Linux 12.04, Warranty - 3 year'),
 (6,5,'Lenovo M700Tiny',20,40000,'lenovo-desktop.jpg','Processor - 6th Gen. Intel Core i5 6400T, Chipset - Intel H110, Monitor - 19.5\'\' Wide, RAM - 4GB, HDD - 500GB HDD, Graphics Chipset - Intel HD 510, Optical Device - DVD RW, Speaker - Built-in speakers, Keyboard - USB Keyboard, Mouse - USB Mouse,  Operating System - Free Dos, Warranty - 3 year.'),
 (7,8,'Dell Vostro 3468',25,38000,'3458.JPG','Processor: 7th Gen Intel Core i3-7100U Processor (3M Cache, 2.40 GHz)\r\nRAM:4GB DDR4,HDD: 1TB 5400 rpm Hard Drive\r\n14.0-inch HD (1366 x 768) Anti-Glare LED-Backlit Display'),
 (8,7,'Apple Macbook Pro Core i5 MLUQ2ZA/A',10,95000,'apple_macbook_pro_2_1_1.jpg','Processor - Intel Core i5, CPU Cache - 3MB, Display Size - 13.3\", RAM - 8GB, RAM Type - LPDDR3 1866MHz, HDD - 256GB SSD, Graphics Chipset - Intel Iris 540, Networking - WiFi, Bluetooth, HD Webcam, Audio Port - Combo, Keyboard Back-Light - Yes, Battery - lithium-polymer, Backup Time - Up to 5 Hrs., Operating System - MacOS Sierra, Country of Origin - USA, Warranty - 1 year'),
 (9,10,'Asus X556UQ',25,45000,'asus_x556uq.jpg','Processor - 7th Gen Intel Core i5 7200U, Display Size - 15.6\", Display Type - FHD LED Display, RAM - 8GB, RAM Type - DDR4, HDD - 1TB HDD, Graphics Chipset - Nvidia GT 940MX, Graphics Memory - 2GB, Optical Device - DVD RW, Battery - 2 Cell Polymer, Backup Time - Up to 4 Hrs., Operating System - FreeDos, Warranty - 2 year (Battery, Adapter 1 year)'),
 (10,8,'Dell INSPIRON 15-5567',25,35000,'dell_inspiron_15-5567_3.jpg','Processor - 7th Gen. Intel Core I3 7100U, Display Size - 15.6\" LED, RAM - 4GB, RAM Type - DDR4, HDD - 1TB HDD, Graphics Chipset - Intel HD 620, Optical Device - DVD RW, Battery - 3 Cell Prismatic, Backup Time - Up to 4 Hrs., Operating System - Windows 10, Weight - 2.30kg, Color - FOG-GRAY, Warranty - 2 year (Battery, Adapter 1 year)'),
 (11,11,'Lenovo Ideapad 100',25,32000,'IdeaPad100.png','5th Gen Intel® Core™ i3-5005U (3M Cache, 2.00 GHz)\r\nRAM 4GB DDR3, HDD 1TB\r\nGraphics: NVIDIA GeForce 920M 2GB\r\nDVD WR,14\" HD LED, DOS\r\n1 Year Warranty'),
 (12,13,'Itel It1508 plus Phone',25,4550,'IT1508 PLUS.JPG','2.0GHz QuadcorE\r\n5.0\" FWVGA\r\n2GB Ram\r\nCamera- 8, 3 Mega pixel\r\nAndroid 5.0'),
 (13,11,'Lenovo YOGA Tablet 2 Windows',25,22000,'lenovo-yoga-tablet.png','Intel® Atom™ Processor Z3745 (2M Cache, 4 cores, up to 1.86 GHz)\r\nRAM: 2GB LPDDR3, ROM: 32GB up to 64GB\r\n10.1” Full HD (1920 x 1200) IPS display'),
 (15,13,'ASUS ZenFone 2 Laser (ZE550KL)',25,13500,'ZE550KL.jpg','Qualcomm Snapdragon 615 (MSM8939) Octa Core, 1.5GHz\r\n3GB LPDDR3 RAM\r\n16GB ROM (Micro SD card up to 128 GB)ASUS WebStorage 5GB lifetime\r\n5.5-inch, 1280x720 (HD) IPS Corning® Gorilla® Glass 4'),
 (16,13,'ASUS Zenfone2 Laser (ZE601KL)',25,15500,'ZE601KL.jpg','Qualcomm Snapdragon 615 (MSM8939) Octa Core, 1.7GHz\r\n3GB LPDDR3 RAM,32GB ROM (Micro SD card up to 128 GB)\r\nBlack/Silver Color'),
 (17,13,'ASUS ZENFONE 2 DELUXE (ZE551ML)',25,21500,'Zenfone2(Deluxe)-600x600.jpeg','Intel Atom Z3580 (2.3GHz) Quad-Core Processor\r\n4GB LPDDR3 RAM\r\nSilver Color\r\n'),
 (18,14,'Corsair Corsair SSD Force LX Series 256GB',25,12500,'corsair-corsair.jpg','Interface Type: SATA 6.0 Gb/s (SATA 3)\r\nForm Factor: 7mm high, 2.5 inch\r\nMax Sequential Read (ATTO): Up to 560MB/s\r\nMax Sequential Write (ATTO): Up to 300MB/s'),
 (19,14,'Corsair Corsair SSD FORCE LX SERIES 512GB',25,22500,'corsair-corsair-ssd.jpg','Interface Type: SATA 6.0 Gb/s (SATA 3)\r\nForm Factor: 7mm high, 2.5 inch\r\nMax Sequential Read (ATTO): Up to 560MB/s\r\nMax Sequential Write (ATTO): Up to 450MB/s'),
 (20,14,'TOSHIBA 2 TB 7200 RPM SATA HARD DISK DRIVE',25,5500,'TOSHIBA 500 GB.jpg','Capacity: 2 TB\r\nFeatures: Halogen Free, Advanced Format technology , S.M.A.R.T.'),
 (22,14,'Western Digital WD 30EZRZ',25,6200,'western-digital-wd-30ezrz.jpg','Capacity: 2 TB\r\nFeatures: Halogen Free, Advanced Format technology , S.M.A.R.T.'),
 (23,14,'Western Digital WD 40EFRX',25,12500,'western-digital-wd-40efrx.jpg','Capacity	:	4 TB\r\nDrive Configuration	:	SATA 6 Gb/s	3.5 Inch	IntelliPower 4 TB 64 MB'),
 (24,15,'Rapoo EP20 Wired In-Ear Phone',25,1050,'EP20.jpg','Lightweight Aluminum body\r\nBlue Color'),
 (26,15,'Bloody G501 Surround 7.1 Gaming Headset',50,2200,'G300.jpg','Frequency Response:20-20000Hz\r\nUSB Cable: Braided Cable/ 2.2M in Length\r\nWindows XP/Vista/7/8\r\nUSB Connector'),
 (28,15,'A4 Tech HS-28 Headset',50,750,'HS-28.JPG','Frequency Response: 20Hz~20KHz\r\nImpedance: 32 Ohm\r\nSensitivity: 105dB±3dB (at 1000Hz ) '),
 (29,15,'A4 Tech HS-100 Headset',50,900,'HS-100.JPG','Frequency Response:20Hz-20kHz\r\nSensitivity: 111dB±3 dB\r\nWindows®98SE,ME,2000,XP,MCE2005,XP(x64),2003(x64),VISTA x86'),
 (30,11,'Lenovo MIIX 310 INTEL® ATOM™ X5-Z8350',28,18000,'Miix 310.png','INTEL® ATOM™ X5-Z8350 2MB cache and (1.44GHZ 1600MHZ 2MB)\r\nRAM: 2GB, HDD: 32 GB Internal\r\nWarranty 1 Year'),
 (31,16,'Gigabyte GAMING DDR4 7th Gen.LGA1151',55,8500,'37796.jpg','Supported CPU - 7th and 6th generation Intel Core i7/ Intel Core i5/Intel Core i3/ Intel Pentium/Intel Celeron processors, Chipset - Intel B250 Express, RAM Type - DDR4, RAM Bus (MHz) - 2400(O.C.) / 2133 MHz, RAM Max. (GB) - 64GB, RAM Slot - 4, SATA Port - 6 x SATA 6Gb/s, Audio Chipset - Realtek ALC1220 codec, LAN Chipset - Intel GbE LAN chip, LAN Speed (Mbps) - 10/100/1000 Mbit, USB Interface - USB3.1 / USB2.0/1.1 / USB Type-C, HDMI Port - 1 x HDMI, Warranty - 3 Year'),
 (32,16,'ASRock Intel H110M-HDV',50,4800,'a_1.gif','Supported CPU - 6th generation Intel Core i7/ Intel Core i5/Intel Core i3/ Intel Pentium/Intel Celeron processors, Chipset - Intel B250 Express, RAM Type - DDR4, RAM Bus (MHz) - 2400(O.C.) / 2133 MHz, RAM Max. (GB) - 64GB, RAM Slot - 4, SATA Port - 6 x SATA 6Gb/s, Audio Chipset - Realtek ALC1220 codec, LAN Chipset - Intel GbE LAN chip, LAN Speed (Mbps) - 10/100/1000 Mbit, USB Interface - USB3.1 / USB2.0/1.1 / USB Type-C, HDMI Port - 1 x HDMI, Warranty - 3 Year'),
 (33,16,'Asus H110M-A DDR4 6th Gen.LGA1151',50,5500,'asus-h110m-a-ddr4.jpg','Supported CPU - 6th generation Intel Core i7/ Intel Core i5/Intel Core i3/ Intel Pentium/Intel Celeron processors, Chipset - Intel B250 Express, RAM Type - DDR4, RAM Bus (MHz) - 2400(O.C.) / 2133 MHz, RAM Max. (GB) - 64GB, RAM Slot - 4, SATA Port - 6 x SATA 6Gb/s, Audio Chipset - Realtek ALC1220 codec, LAN Chipset - Intel GbE LAN chip, LAN Speed (Mbps) - 10/100/1000 Mbit, USB Interface - USB3.1 / USB2.0/1.1 / USB Type-C, HDMI Port - 1 x HDMI, Warranty - 3 Year'),
 (34,16,'MSI B250M PRO-VD DDR4 7th Gen.LGA1151',50,6800,'msi_b250m_pro-vd_ddr4_7th_gen.jpg','Supported CPU - 6th generation Intel Core i7/ Intel Core i5/Intel Core i3/ Intel Pentium/Intel Celeron processors, Chipset - Intel B250 Express, RAM Type - DDR4, RAM Bus (MHz) - 2400(O.C.) / 2133 MHz, RAM Max. (GB) - 64GB, RAM Slot - 4, SATA Port - 6 x SATA 6Gb/s, Audio Chipset - Realtek ALC1220 codec, LAN Chipset - Intel GbE LAN chip, LAN Speed (Mbps) - 10/100/1000 Mbit, USB Interface - USB3.1 / USB2.0/1.1 / USB Type-C, HDMI Port - 1 x HDMI, Warranty - 3 Year'),
 (35,17,'Asus PB287Q 28 Inch 4K UHD',50,28000,'asus_pb287q_28_inch1.jpg','Display Size (Inch) - 28\", Shape - Wide Screen, Display Type - UHD LED Display, Display Resolution - 4K (3840 x 2160 at 60Hz), Brightness (cd/m2) - 300 cd/?, Contrast Ratio (TCR/DCR) - 100000000:1, Response Time (ms) - 1ms, HDMI Port - 1 x HDMI 4.1, 1 x HDMI4.1/MHL, Speaker (Built-in) - 2W x 2 Stereo RMS, Others - 1 x DisplayPort, Specialty - Height Adjustment : Yes, VESA Wall Mounting : 100 x 100mm, Warranty - 3 year'),
 (36,17,'HP Elite E222 21.5 Inch LED Monitor',50,11000,'hp-elite-e222.jpg','Display Size (Inch) - 21.5\", Shape - Wide Screen, Display Type - LED Monitor, Display Resolution - 1920 x 1080 60Hz, Brightness (cd/m2) - 250cd/m2, Contrast Ratio (TCR/DCR) - 1000:1 static, Response Time (ms) - 7ms, VGA Port - 1, HDMI Port - 1, Others - Ports: 3 x USB2.0, Part No - M1N96AA, Warranty - 3 year'),
 (38,19,'Epson L-805 Six Color Photo Printer',50,16000,'epson-l-805-six-color.jpg','Functions - Only Print, Photo (six color), Printer Type - Single Function Color INK, Tank System - Yes, Speed PPM (Black) - 37PPM, Speed PPM (Color) - 38PPM, Print Resolution (Pixel) - 5760 x 1440dpi, Duplex - Manual, Paper Size - A4, A5, A6, B5, 10 x 15cm (4 x 6\"), Interface - Hi-Speed USB 2.0, WiFi,  Consumable - Ink bottle: Black T6731 (3,000 pages), Cyan T6732, Magenta T6733, Yellow T6734, Light Cyan T6735, Light Magenta T6736 (5,400 pages), (1,800 photos), Warranty - 1 year'),
 (39,19,'HP P1102 Laser Printer(L, BW)',50,7500,'hp-p1102.jpg','Functions - Only Print, Photo (six color), Printer Type - Single Function Color INK, Tank System - Yes, Speed PPM (Black) - 37PPM, Speed PPM (Color) - 38PPM, Print Resolution (Pixel) - 5760 x 1440dpi, Duplex - Manual, Paper Size - A4, A5, A6, B5, 10 x 15cm (4 x 6\"), Interface - Hi-Speed USB 2.0, WiFi,  Consumable - Ink bottle: Black T6731 (3,000 pages), Cyan T6732, Magenta T6733, Yellow T6734, Light Cyan T6735, Light Magenta T6736 (5,400 pages), (1,800 photos), Warranty - 1 year'),
 (40,19,'Samsung SL-M2820ND Laser Printer',50,8500,'samsung_m2820nd.jpg','Functions - Only Print, Photo (six color), Printer Type - Single Function Color INK, Tank System - Yes, Speed PPM (Black) - 37PPM, Speed PPM (Color) - 38PPM, Print Resolution (Pixel) - 5760 x 1440dpi, Duplex - Manual, Paper Size - A4, A5, A6, B5, 10 x 15cm (4 x 6\"), Interface - Hi-Speed USB 2.0, WiFi,  Consumable - Ink bottle: Black T6731 (3,000 pages), Cyan T6732, Magenta T6733, Yellow T6734, Light Cyan T6735, Light Magenta T6736 (5,400 pages), (1,800 photos), Warranty - 1 year'),
 (41,17,'Samsung 28 Inch 4K UHD LU28E590DS',50,32000,'samsung_28_inch_4k_uhd_lu28e590ds_1.jpg','Display Size (Inch) - 28\", Shape - Wide Screen, Display Type - LED Display, Display Resolution - 3840 x 2160, Brightness (cd/m2) - 370cd/m2, Contrast Ratio (TCR/DCR) - 1,000:1 (Typ), Response Time (ms) - 1ms, TV Card (Built-in) - No, HDMI Port - 2, Remote - No, Speaker (Built-in) - No, Others - Power Supply Type : AC 100-240V, Specialty - WALL-MOUNT (SIZE MM): 75 x 75mm, Display Port: 1, Warranty - 3 year'),
 (42,20,'AMD Bulldozer FX-4350 4.2GHz Processor',50,8500,'amd-bulldozer-fx4350.jpg','Model - AMD Bulldozer FX4350, Clock Speed (GHz) - 4.20GHz, Core - 4, Thread - 4, L3 Cache (MB) - 8MB, L2 Cache (MB) - 4MB, Sockets Supported - AM3+, Others - Thermal Design Power: 125W, 64-Bit Support, Warranty - 3 year'),
 (44,20,'Intel Core i3 6100 3.70GHz 6th Gen. Processor',50,7800,'core_i3.jpg','Model - Intel Core i3 6100, Clock Speed (GHz) - 3.70GHz, Core - 2, Thread - 4, Smart Cache (MB) - 3MB, Sockets Supported - FCLGA1151, Lithography (nm) - 14nm, Integ. Graphics - Intel HD 530, Warranty - 3 year'),
 (45,20,'Intel Kaby Lake Core i5 7500 3.40-3.80GHz',50,13500,'corei5-7500-16-9-4d6ca846ae88b4fb.jpg','Model - Intel Kaby Lake Core i5 7500, Clock Speed (GHz) - 3.40-3.80GHz, Core - 4, Thread - 4, Smart Cache (MB) - 6MB, Sockets Supported - LGA1151, Lithography (nm) - 14nm, Integ. Graphics - Intel HD 630, Others - Max Memory Size: 64 GB,, Warranty - 3 Year'),
 (46,20,'Intel PDC G4400 3.30GHz 6th Gen. Processor',50,4200,'intel_pdc_4400.jpg','Model - Intel PDC C4400 6th Gen., Clock Speed (GHz) - 3.30GHz, Core - 2, Thread - 2, L2 Cache (MB) - 3MB, Sockets Supported - FCLGA1151, Lithography (nm) - 14nm, Integ. Graphics - Intel HD 510, Others - DDR4-1866/2133, DDR3L-1333/1600 1.35V, Warranty - 3 year'),
 (47,21,'AVEXIR Core (AVD4UZ124001608G-4COB)',50,4200,'AVEXIR Core.png','Capacity: 8GB\r\nSpeed: 2400Mhz\r\nLED (Color): Blue, Red,White\r\nType: 8GB DDR4'),
 (48,21,'AVEXIR Core (AVD3U16001104G-2CIR)',50,2200,'avexir red.png','Capacity: 4GB\r\nSpeed: 1600Mhz\r\nLED (Color): Red,White,Green\r\nType: 4GB DDR3'),
 (49,21,'AVEXIR Core (AVD4UZ124001608G-4CWW) SABRANCO',50,4500,'Avexir SABRANCO.jpg','Capacity: 8GB\r\nSpeed: 2400Mhz\r\nLED (Color): White\r\nType: 8GB DDR4'),
 (50,21,'Corsair XMS3- 4GB DDR3',50,2300,'corsair-xms3-4gb-ddr3.jpg','Capacity: 4GB\r\nSpeed: 1600Mhz\r\nLED (Color): White\r\nType: 4GB DDR3'),
 (51,21,'8 GB DDR4 2133 BUS',50,4000,'DDR 4 2133 BUS.jpg','Brand : AData\r\nSuitable for : Desktop\r\nModule Specification : 288Pin Unbuffered-DIMM\r\n8 GB DDR 4\r\nType: DDR4'),
 (52,22,'650VA Offline UPS (POWER GUARD)',50,2800,'650va.jpg','Battery Number : 1Pcs\r\nBattery Type 8.2ah\r\nInput Voltage : 220-230VAC / 110VAC Option'),
 (53,22,'1500VA Offilne UPS (POWER GUARD)',50,6000,'1200va-offline-ups.jpg','Battery Number : 2Pcs\r\nPower (VA) : 1500VA\r\nInput Voltage : 120 VAC or 220/230/240VAC 25%(145-290V5V Option)'),
 (54,22,'2000VA Offilne UPS (POWER GUARD)',50,9200,'2000va-offilne-ups.jpg','Battery Number : 2Pcs\r\nBattery Type : Lead-Acid miantenance-free\r\nInput Voltage : 220-230VAC / 110VAC Option'),
 (55,18,'Bloody B1500 Gaming Combo Set',50,3200,'B1500.jpg','Transmission:Wired\r\nLetter LED:5 Levels of Brightness\r\nBloody Logo: Illumiated in Red\r\nConnector :USB (2.0/3.0)'),
 (56,18,'COOLER MASTER DEVASTATOR II',50,2200,'Devastator ii.png','CM exclusive Mem-chanical\r\nGaming Optical'),
 (57,18,'COOLER MASTER MASTERKEYS',50,4200,'MasterKeys Lite L.png','COOLER MASTER MASTERKEYS LITE L SGB-3040-KKMF1-US\r\nCooler Master Mem-chanical\r\nOptical AVAGO 3050'),
 (58,18,'Rapoo VPRO V210 Gaming Mouse',50,1250,'rapoo-v210-optical-gaming-mouse.jpg','VPRO RGB Optical entry level gaming mouse,\r\n2000 DPI\r\nWarranty 1 Years'),
 (59,18,'Steel Series Sensei',50,8500,'steel-series-sensei.jpg','Frames per sec:12000 Inches per sec: 150 Buttons: 8 DCPI:11400 CPI: 5700 Lift distance:1mm / .04in Cable: 2m / 6.5ft, braided Requirement:Any PC with a USB'),
 (60,18,'BLOODY V3 GAMING MOUSE 3200 DPI',50,1500,'v3  1.jpg','Main Core: Intelligent 3 Cores\r\nEncoder:High precision optical engine\r\nCable Length:1.8 m\r\nConnector :USB (2.0 / 3.0)\r\nMaximum Resolution:3200dpi adjustable');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `reg_date` date NOT NULL,
  `contact_no` varchar(11) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`user_id`),
  KEY `FK_shop_use_role_id` (`role_id`),
  CONSTRAINT `FK_shop_use_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_user`
--

/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
INSERT INTO `shop_user` (`user_id`,`user_name`,`password`,`email`,`reg_date`,`contact_no`,`role_id`) VALUES 
 (1,'araf','1234','aa@aa.com','2016-05-08','1234567890',1),
 (2,'araf','1234','aa@aa.com','2017-02-08','254666',1),
 (3,'Mehedi Hasan','1234','aa@bb.ccc','2017-02-08','0123645887',1);
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;


--
-- Definition of table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
CREATE TABLE `sub_category` (
  `sub_cat_id` int(10) unsigned NOT NULL auto_increment,
  `cat_id` int(10) unsigned NOT NULL,
  `sub_cat_name` varchar(45) NOT NULL,
  `sub_cat_desc` varchar(200) NOT NULL,
  PRIMARY KEY  (`sub_cat_id`),
  KEY `FK_sub_category_cat_id` (`cat_id`),
  CONSTRAINT `FK_sub_category_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` (`sub_cat_id`,`cat_id`,`sub_cat_name`,`sub_cat_desc`) VALUES 
 (4,4,'Home PC','For home use.'),
 (5,4,'Corporate PC','For corporate use.'),
 (6,4,'Entertainment PC','For entertainment use.'),
 (7,5,'Apple Mac','For entertainment use.'),
 (8,5,'Dell','For entertainment use.'),
 (9,5,'HP','For entertainment use.'),
 (10,5,'Asus','For entertainment use.'),
 (11,5,'Lenovo','For entertainment use.'),
 (12,6,'Lenovo','For entertainment use.'),
 (13,6,'ITEL','For entertainment use.'),
 (14,7,'HDD','For entertainment use.'),
 (15,7,'Headphone','For entertainment use.'),
 (16,7,'Mainboard','For entertainment use.'),
 (17,7,'Monitor','For entertainment use.'),
 (18,7,'Mouse & Keyboard','For entertainment use.'),
 (19,7,'Printer','For entertainment use.'),
 (20,7,'Processor','For entertainment use.'),
 (21,7,'RAM','For entertainment use.'),
 (22,7,'UPS','For entertainment use.');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`role_id`,`role_name`) VALUES 
 (1,'Customer');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
