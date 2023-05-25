--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL COMMENT 'auto assigned',
  `item` varchar(50) NOT NULL DEFAULT 'Item Name' COMMENT 'item db name',
  `label` varchar(255) DEFAULT NULL COMMENT 'label used in inventory systems',
  `category` varchar(255) NOT NULL DEFAULT 'category',
  `max_carry` int(11) NOT NULL DEFAULT 10 COMMENT 'max number a player can hold',
  `can_remove` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'can the player drop the item 1 = yes 0 = no',
  `typeofitem` varchar(50) DEFAULT NULL COMMENT 'item_money, item_gold, item_standard, item_weapon',
  `usable` tinyint(1) DEFAULT NULL COMMENT 'can the item be registered as usable in inventory 1=yes 0 =no',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'future use wear and tear',
  `desc_short` varchar(255) NOT NULL DEFAULT 'short description' COMMENT 'write a short description for inventory to display',
  `desc_long` varchar(5550) NOT NULL DEFAULT ' long description' COMMENT 'write a long description for the store to display.',
  `gatherable` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'flag for gather scripts can be found in stash or bushes 1 = yes  0 = no',
  `collectable` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Can item be found lying around like cards. 1= yes 0 =no',
  `craftsupply` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is the item used to craft new items 1 = yes 0 = no',
  `consumable` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Can the item be eaten or used as part of metabolism. 1= yes 0 = no',
  `metabolismrank` int(3) NOT NULL DEFAULT 1 COMMENT 'If automated metabolism this number 1 to 99 determines how much metabolism the item has.',
  `solidorliquid` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = liquid 1= solid used to determine animations',
  `medical` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is this an item with medical properies 1= yes 0 = no',
  `alcohol` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Does it have alcohol determines animations and effects. 1 = yes 0 = no',
  `valuerank` int(3) NOT NULL DEFAULT 1 COMMENT 'value multiplier for stores 1 to 99',
  `generalstore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `pharmacy` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `saloon` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `seeds` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `trapper` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `blackmarket` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `blacksmith` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `gunstore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `fletcher` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `herbologist` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no',
  `farmersmarket` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `baitstore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `butcher` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `jewelrystore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `shamanstore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `petstore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `diner` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `carpentar` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `lumberyard` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `taxidermy` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `journalist` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `specialist` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `festival` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `minestore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `clothingstore` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold in the store 1 = yes 0 = no ',
  `glassblower` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 	can item be sold in the store 1 = yes 0 = no ',
  `distillery` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 	can item be sold in the store 1 = yes 0 = no ',
  `weaver` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 	can item be sold in the store 1 = yes 0 = no ',
  `can_sell` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold 1 = yes 0 = no',
  `can_buy` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'can item be sold 1 = yes 0 = no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item`, `label`, `category`, `max_carry`, `can_remove`, `typeofitem`, `usable`, `metadata`, `desc_short`, `desc_long`, `gatherable`, `collectable`, `craftsupply`, `consumable`, `ingredient`, `metabolismrank`, `solidorliquid`, `medical`, `alcohol`, `valuerank`, `generalstore`, `pharmacy`, `saloon`, `seeds`, `trapper`, `blackmarket`, `blacksmith`, `gunstore`, `fletcher`, `herbologist`, `farmersmarket`, `baitstore`, `butcher`, `jewelrystore`, `shamanstore`, `petstore`, `diner`, `carpentar`, `lumberyard`, `taxidermy`, `journalist`, `specialist`, `festival`, `minestore`, `clothingstore`, `glassblower`, `distillery`, `weaver`, `can_sell`, `can_buy`) VALUES
(1, 'acid', 'Acid', 'category', 10, 1, 'item_standard', 1, '{}', 'Acid is used to make medicines.', 'Acid is used to make medicines.', 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(6, 'alcohol', 'Alcohol', 'category', 10, 1, 'item_standard', 1, '{}', 'Alcohol', 'Alcohol', 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
