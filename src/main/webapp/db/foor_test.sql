/*
Navicat MySQL Data Transfer

Source Server         : 215
Source Server Version : 50723
Source Host           : 39.104.170.215:3306
Source Database       : foor_test

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-03-24 15:02:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food_info
-- ----------------------------
DROP TABLE IF EXISTS `food_info`;
CREATE TABLE `food_info` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(50) DEFAULT NULL COMMENT '菜品名',
  `food_desc` text COMMENT '菜品描述',
  `recommended_price` double(10,2) DEFAULT '0.00' COMMENT '推荐价格',
  `flag` char(1) DEFAULT NULL COMMENT '状态 0 删除  1 正常  2 下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user_id` varchar(30) DEFAULT NULL COMMENT '创建人id',
  `update_user_id` varchar(30) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_info
-- ----------------------------
INSERT INTO `food_info` VALUES ('1', '宫保鸡丁', '宫保鸡丁（Kung Pao Chicken） [1]  ，是一道闻名中外的特色传统名菜。鲁菜、川菜、贵州菜中都有收录，原料、做法有差别。 [2]  该菜式的起源与鲁菜中的酱爆鸡丁，和贵州菜的胡辣子鸡丁有关，后被清朝山东巡抚、四川总督丁宝桢改良发扬，形成了一道新菜式——宫保鸡丁，并流传至今，此道菜也被归纳为北京宫廷菜 [3]  。之后宫保鸡丁也流传到国外。', '22.00', '1', '2019-03-20 22:51:06', '2019-03-20 22:51:28', '43', '43');
INSERT INTO `food_info` VALUES ('2', '红烧豆腐', '家常红烧豆腐是我国传统的、大众化的一种豆制食品，在一些古籍中都有记载。其中含有铁、钙、磷、镁等人体必需的多种微量元素，还含有糖类、植物油和丰富的优质蛋白   做法一\r\n材料： 　豆腐300克，胡萝卜30克，木耳30克，甜豆荚30克，蒜苗10克，红辣椒1个，生姜1小块，大蒜1瓣，淀粉适量， 　调料： 　食用油30克，香油1小匙，蚝油1小匙，高汤2大匙，精盐1小匙，白糖1小匙，味精小匙，\r\n做法： 　1、豆腐切片后，用平底锅煎至双面呈金黄色， 　2、胡萝卜、木耳切片，蒜苗切斜段，红辣椒切段，大蒜、生姜切片备用， 　3、锅内放入油烧热，先爆香大蒜片、生姜片、红辣椒段，再加入高汤、蚝油、白糖，煮开后加入豆腐片、木耳片、胡萝卜片、甜豆荚、蒜苗段、精盐、味精一起煮3分钟，再用水淀粉勾芡，淋上香油即可。 　特点： 　脆嫩爽口，营养丰富。 　厨师一点通： 　用卤水豆腐制作此菜，效果会更好。', '18.00', '1', '2019-03-20 22:55:51', '2019-03-20 22:55:53', '43', '43');
INSERT INTO `food_info` VALUES ('3', '酸菜鱼', '酸菜鱼也称为酸汤鱼，是一道源自重庆的经典菜品，以其特有的调味和独特的烹调技法而著称。流行于上世纪90年代，是重庆江湖菜的开路先锋之一。\r\n酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养；酸菜中的乳酸可以促进人体对铁元素的吸收，还可以增加人的食欲。', '32.00', '1', '2019-03-20 22:58:18', null, '43', '43');
INSERT INTO `food_info` VALUES ('4', '油焖大虾', '鲁菜油焖大虾主要食材为清明前渤海湾的大对虾，使用鲁菜特有的油焖技法。这是一道历史悠久的名菜，鲜香甜咸四种味道相辅相成，回味无穷。近些年流行的油焖大虾是起源于湖北潜江的鄂菜，使用的是淡水的鳌虾（俗称小龙虾）制作，与鲁菜的油焖大虾不同。', '42.00', '1', '2019-03-20 22:59:06', null, '43', '43');
INSERT INTO `food_info` VALUES ('5', '小炒肉', '小炒肉是湖南省一道常见的特色传统名菜，属于湘菜系。麻辣鲜香，口味滑嫩。制作原料主要是五花肉和青椒、红椒等。  食材准备\r\n五花肉300g，青红椒适量，豆瓣酱适量，蒜适量，姜适量，料酒适量，老抽适量，蚝油适量，盐适量，洋葱半个。\r\n制作步骤\r\n准备的材料有：五花肉250g 洋葱，姜，蒜头，青红尖椒\r\n把五花肉切片，其他配菜切段备用\r\n锅中倒入适量油，放入姜蒜末和少许洋葱炒香\r\n倒入五花肉煸炒出油\r\n.煸炒到肉变色，卷起来的时候就可以放入一勺豆瓣酱，适量生抽，蚝油，盐\r\n翻炒均匀\r\n下入青红尖椒和剩下的洋葱，加适量盐调味\r\n翻炒至熟后，即可出锅\r\n完成\r\n小贴士\r\n1.炒五花肉的时候不用放太多的油，因为五花肉本身就会出油\r\n2.可以把五花肉先焯水定型了再切', '26.00', '1', '2019-03-20 23:00:52', null, '1', '1');
INSERT INTO `food_info` VALUES ('6', '宫保鸡丁2', '宫保鸡丁（Kung Pao Chicken） [1]  ，是一道闻名中外的特色传统名菜。鲁菜、川菜、贵州菜中都有收录，原料、做法有差别。 [2]  该菜式的起源与鲁菜中的酱爆鸡丁，和贵州菜的胡辣子鸡丁有关，后被清朝山东巡抚、四川总督丁宝桢改良发扬，形成了一道新菜式——宫保鸡丁，并流传至今，此道菜也被归纳为北京宫廷菜 [3]  。之后宫保鸡丁也流传到国外。', '22.00', '1', '2019-03-20 22:51:06', '2019-03-20 22:51:28', '43', '43');
INSERT INTO `food_info` VALUES ('7', '红烧豆2', '家常红烧豆腐是我国传统的、大众化的一种豆制食品，在一些古籍中都有记载。其中含有铁、钙、磷、镁等人体必需的多种微量元素，还含有糖类、植物油和丰富的优质蛋白   做法一\r\n材料： 　豆腐300克，胡萝卜30克，木耳30克，甜豆荚30克，蒜苗10克，红辣椒1个，生姜1小块，大蒜1瓣，淀粉适量， 　调料： 　食用油30克，香油1小匙，蚝油1小匙，高汤2大匙，精盐1小匙，白糖1小匙，味精小匙，\r\n做法： 　1、豆腐切片后，用平底锅煎至双面呈金黄色， 　2、胡萝卜、木耳切片，蒜苗切斜段，红辣椒切段，大蒜、生姜切片备用， 　3、锅内放入油烧热，先爆香大蒜片、生姜片、红辣椒段，再加入高汤、蚝油、白糖，煮开后加入豆腐片、木耳片、胡萝卜片、甜豆荚、蒜苗段、精盐、味精一起煮3分钟，再用水淀粉勾芡，淋上香油即可。 　特点： 　脆嫩爽口，营养丰富。 　厨师一点通： 　用卤水豆腐制作此菜，效果会更好。', '18.00', '1', '2019-03-20 22:55:51', '2019-03-20 22:55:53', '43', '43');
INSERT INTO `food_info` VALUES ('8', '酸菜鱼2', '酸菜鱼也称为酸汤鱼，是一道源自重庆的经典菜品，以其特有的调味和独特的烹调技法而著称。流行于上世纪90年代，是重庆江湖菜的开路先锋之一。\r\n酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养；酸菜中的乳酸可以促进人体对铁元素的吸收，还可以增加人的食欲。', '32.00', '1', '2019-03-20 22:58:18', '2019-03-29 22:18:13', '43', '43');
INSERT INTO `food_info` VALUES ('9', '油焖大虾2', '鲁菜油焖大虾主要食材为清明前渤海湾的大对虾，使用鲁菜特有的油焖技法。这是一道历史悠久的名菜，鲜香甜咸四种味道相辅相成，回味无穷。近些年流行的油焖大虾是起源于湖北潜江的鄂菜，使用的是淡水的鳌虾（俗称小龙虾）制作，与鲁菜的油焖大虾不同。', '42.00', '1', '2019-03-20 22:59:06', '2019-03-21 22:18:17', '43', '43');
INSERT INTO `food_info` VALUES ('10', '小炒肉2', '小炒肉是湖南省一道常见的特色传统名菜，属于湘菜系。麻辣鲜香，口味滑嫩。制作原料主要是五花肉和青椒、红椒等。  食材准备\r\n五花肉300g，青红椒适量，豆瓣酱适量，蒜适量，姜适量，料酒适量，老抽适量，蚝油适量，盐适量，洋葱半个。\r\n制作步骤\r\n准备的材料有：五花肉250g 洋葱，姜，蒜头，青红尖椒\r\n把五花肉切片，其他配菜切段备用\r\n锅中倒入适量油，放入姜蒜末和少许洋葱炒香\r\n倒入五花肉煸炒出油\r\n.煸炒到肉变色，卷起来的时候就可以放入一勺豆瓣酱，适量生抽，蚝油，盐\r\n翻炒均匀\r\n下入青红尖椒和剩下的洋葱，加适量盐调味\r\n翻炒至熟后，即可出锅\r\n完成\r\n小贴士\r\n1.炒五花肉的时候不用放太多的油，因为五花肉本身就会出油\r\n2.可以把五花肉先焯水定型了再切', '26.00', '1', '2019-03-20 23:00:52', '2019-03-21 22:18:24', '1', '1');
INSERT INTO `food_info` VALUES ('11', '宫保鸡丁1', '宫保鸡丁（Kung Pao Chicken） [1]  ，是一道闻名中外的特色传统名菜。鲁菜、川菜、贵州菜中都有收录，原料、做法有差别。 [2]  该菜式的起源与鲁菜中的酱爆鸡丁，和贵州菜的胡辣子鸡丁有关，后被清朝山东巡抚、四川总督丁宝桢改良发扬，形成了一道新菜式——宫保鸡丁，并流传至今，此道菜也被归纳为北京宫廷菜 [3]  。之后宫保鸡丁也流传到国外。', '22.00', '1', '2019-03-20 22:51:06', '2019-03-20 22:51:28', '43', '43');
INSERT INTO `food_info` VALUES ('12', '红烧豆腐1', '家常红烧豆腐是我国传统的、大众化的一种豆制食品，在一些古籍中都有记载。其中含有铁、钙、磷、镁等人体必需的多种微量元素，还含有糖类、植物油和丰富的优质蛋白   做法一\r\n材料： 　豆腐300克，胡萝卜30克，木耳30克，甜豆荚30克，蒜苗10克，红辣椒1个，生姜1小块，大蒜1瓣，淀粉适量， 　调料： 　食用油30克，香油1小匙，蚝油1小匙，高汤2大匙，精盐1小匙，白糖1小匙，味精小匙，\r\n做法： 　1、豆腐切片后，用平底锅煎至双面呈金黄色， 　2、胡萝卜、木耳切片，蒜苗切斜段，红辣椒切段，大蒜、生姜切片备用， 　3、锅内放入油烧热，先爆香大蒜片、生姜片、红辣椒段，再加入高汤、蚝油、白糖，煮开后加入豆腐片、木耳片、胡萝卜片、甜豆荚、蒜苗段、精盐、味精一起煮3分钟，再用水淀粉勾芡，淋上香油即可。 　特点： 　脆嫩爽口，营养丰富。 　厨师一点通： 　用卤水豆腐制作此菜，效果会更好。', '18.00', '1', '2019-03-20 22:55:51', '2019-03-20 22:55:53', '43', '43');
INSERT INTO `food_info` VALUES ('13', '酸菜鱼12', '酸菜鱼也称为酸汤鱼，是一道源自重庆的经典菜品，以其特有的调味和独特的烹调技法而著称。流行于上世纪90年代，是重庆江湖菜的开路先锋之一。\r\n酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养；酸菜中的乳酸可以促进人体对铁元素的吸收，还可以增加人的食欲。', '32.00', '1', '2019-03-20 22:58:18', '2019-03-29 22:18:13', '43', '43');
INSERT INTO `food_info` VALUES ('14', '油焖大虾1', '鲁菜油焖大虾主要食材为清明前渤海湾的大对虾，使用鲁菜特有的油焖技法。这是一道历史悠久的名菜，鲜香甜咸四种味道相辅相成，回味无穷。近些年流行的油焖大虾是起源于湖北潜江的鄂菜，使用的是淡水的鳌虾（俗称小龙虾）制作，与鲁菜的油焖大虾不同。', '42.00', '1', '2019-03-20 22:59:06', '2019-03-21 22:18:17', '43', '43');
INSERT INTO `food_info` VALUES ('15', '小炒肉1', '小炒肉是湖南省一道常见的特色传统名菜，属于湘菜系。麻辣鲜香，口味滑嫩。制作原料主要是五花肉和青椒、红椒等。  食材准备\r\n五花肉300g，青红椒适量，豆瓣酱适量，蒜适量，姜适量，料酒适量，老抽适量，蚝油适量，盐适量，洋葱半个。\r\n制作步骤\r\n准备的材料有：五花肉250g 洋葱，姜，蒜头，青红尖椒\r\n把五花肉切片，其他配菜切段备用\r\n锅中倒入适量油，放入姜蒜末和少许洋葱炒香\r\n倒入五花肉煸炒出油\r\n.煸炒到肉变色，卷起来的时候就可以放入一勺豆瓣酱，适量生抽，蚝油，盐\r\n翻炒均匀\r\n下入青红尖椒和剩下的洋葱，加适量盐调味\r\n翻炒至熟后，即可出锅\r\n完成\r\n小贴士\r\n1.炒五花肉的时候不用放太多的油，因为五花肉本身就会出油\r\n2.可以把五花肉先焯水定型了再切', '26.00', '0', '2019-03-20 23:00:52', '2019-03-22 00:28:07', '1', '1');
INSERT INTO `food_info` VALUES ('16', '小炒肉5', '小炒肉是湖南省一道常见的特色传统名菜，属于湘菜系。麻辣鲜香，口味滑嫩。制作原料主要是五花肉和青椒、红椒等。  食材准备\r\n五花肉300g，青红椒适量，豆瓣酱适量，蒜适量，姜适量，料酒适量，老抽适量，蚝油适量，盐适量，洋葱半个。\r\n制作步骤\r\n准备的材料有：五花肉250g 洋葱，姜，蒜头，青红尖椒\r\n把五花肉切片，其他配菜切段备用\r\n锅中倒入适量油，放入姜蒜末和少许洋葱炒香\r\n倒入五花肉煸炒出油\r\n.煸炒到肉变色，卷起来的时候就可以放入一勺豆瓣酱，适量生抽，蚝油，盐\r\n翻炒均匀\r\n下入青红尖椒和剩下的洋葱，加适量盐调味\r\n翻炒至熟后，即可出锅\r\n完成\r\n小贴士\r\n1.炒五花肉的时候不用放太多的油，因为五花肉本身就会出油\r\n2.可以把五花肉先焯水定型了再切', '26.00', '2', '2019-03-20 23:00:52', '2019-03-22 00:28:07', '1', '1');
INSERT INTO `food_info` VALUES ('17', '酸菜鱼22', '酸菜鱼也称为酸汤鱼，是一道源自重庆的经典菜品，以其特有的调味和独特的烹调技法而著称。流行于上世纪90年代，是重庆江湖菜的开路先锋之一。\r\n酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养；酸菜中的乳酸可以促进人体对铁元素的吸收，还可以增加人的食欲。', '32.00', '2', '2019-03-20 22:58:18', '2019-03-29 22:18:13', '43', '43');
INSERT INTO `food_info` VALUES ('18', 'sff', 'asgggg', '0.00', null, '2019-03-24 13:40:35', null, '1', null);
INSERT INTO `food_info` VALUES ('19', 'sff', 'asgggg', '0.00', null, '2019-03-24 13:40:35', null, '1', null);
INSERT INTO `food_info` VALUES ('20', '345', 'sasaf', '333.00', '0', '2019-03-24 13:42:54', '2019-03-24 14:17:55', '1', '1');
INSERT INTO `food_info` VALUES ('21', '345', 'sasaf', '333.00', '0', '2019-03-24 13:42:54', '2019-03-24 14:17:53', '1', '1');
INSERT INTO `food_info` VALUES ('22', '34', 'herhe', '12.00', '0', '2019-03-24 13:46:09', '2019-03-24 14:17:51', '1', '1');
INSERT INTO `food_info` VALUES ('23', '1234', null, '33.00', '0', '2019-03-24 14:17:36', '2019-03-24 14:17:47', '1', '1');
INSERT INTO `food_info` VALUES ('24', 'hhhh', 'hhhhhhhhhhhhhhhhhhh', '44.00', '0', '2019-03-24 14:49:50', '2019-03-24 14:49:59', '1', '1');

-- ----------------------------
-- Table structure for food_notice
-- ----------------------------
DROP TABLE IF EXISTS `food_notice`;
CREATE TABLE `food_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `notice_info` text COMMENT '内容',
  `status` int(2) DEFAULT '1' COMMENT '状态  1 可用  2 不可用 0 删除',
  `action_user` bigint(20) DEFAULT '0' COMMENT '操作人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_notice
-- ----------------------------
INSERT INTO `food_notice` VALUES ('972', '公告是什么', '发文权力的限制性\r\n由于公告宣布的是重大事项和法定事项，发文的权力被限制在高层行政机关及其职能部门的范围之内。具体说，国家最高权力机关（人大及其常委会），国家最高行政机关（国务院）及其所属部门，各省市、自治区、直辖市行政领导机关，某些法定机关，如税务局、海关、铁路局、人民银行、检察院、法院等，有制发公告的权力。其他地方行政机关，一般不能发布公告。党团组织、社会团体、企事业单位，不能发布公告。\r\n发布范围的广泛性\r\n公告是向“国内外”发布重要事项和法定事项的公文，其信息传达范围有时是全国，有时是全世界。譬如，中国曾以公告的形式公布中国科学院院士名单，一方面确立他们在我国科学界学术带头人地位，一方面尽力为他们争取在国际科学界的地位。这样的公告肯定会在世界科学界产生一定的影响。中国有关部门还曾在《人民日报》上刊登公告，公布中国名酒和中国优质酒的品牌、商标和生产企业，已便消费者能认清名牌。\r\n题材的重大性\r\n公告的题材，必须是能在国际国内产生一定影响的重要事项，或者依法必须向社会公布的法定事项。公告的内容庄重严肃，体现着国家权力部门的威严，既要能够将有关信息和政策公诸于众，又要考虑在国内国际可能产生的政治影响。一般性的决定、指示、通知的内容，都不能用公告的形式发布，因为它们很难具有全国和国际性的意义。\r\n内容和传播方式的新闻性\r\n公告还有一定的新闻性特点。所谓新闻，就是对新近发生的、群众关心的、应知而未知的事实的报道。公告的内容，都是新近的、群众应知而未知的事项，在一定程度上具有新闻的特点。公告的发布形式也有新闻性特征，它一般不用红头文件的方式传播，而是在报刊上公开刊登。', '1', '1', '2019-03-23 15:05:51', null);
INSERT INTO `food_notice` VALUES ('973', '平台运营1', '过程流程图通过图示的方法展现了整个过程的每一任务块。例如，客户订单的流程可以\n运营\n运营\n为，由下单开始，经过订单录入、订单处理、完成订单，最后发货。如果客户可以通过多种途径下单，如电话、订货单或网络，那么可将上述流程制成图表从而确定哪种方式效率最高。流程中的每一步骤通常用方框表示，并带有指向下一步骤的箭头。另有一些符号用来表示开始、结束、输入、输出及其他流程步骤。还可以使用软件程序帮您制作流程图。相关内容我们会在本文稍后部分详细说明。\n标绘图流程\n通过用标绘图描述流程，您可以对其中每一步骤标明价值等级，进而据此区别所做的工作是否对整个流程具有增值作用。据此您可以重新组织流程，去掉那些不增值的工作。如果不能完全删减某个步骤，或许可以对其进行简化。这类分析可应用于公司的所有流程，能帮助您增加整个业务的价值。\n运营\n运营\n标绘图流程使用的符号与流程图很类似，指出整个过程中某一特定环节的运作情况。标绘图流程的符号包括：\n只有通过运营或决策才实现价值提升。要确定过程中有多少步骤没有增加价值，可将它们一一列出，并为每一行为符号插入一列。对每个步骤标明其涉及的行为类型（如运营、移动、延迟等）。对各列的标记进行合计，由运营列和决策列相加得到能增加价值的步骤总数，随后将其余列相加得出不增加价值的步骤总数。\n您可以由此开始流程的改善工作。\n模型化和模拟“假设”情况\n您所创建的流程图和标绘图流程也可以作为模型参考。尽管这些模型能很好的解释“结果”，但是它们无法回答更细的问题，诸如“如何做”、“何时”以及“何地”。某典型业务所用流程若具有一定复杂度，则单纯依靠流程图很难判断变革所产生的效果。而这时模拟模型就有了用武之地。模拟方式允许您对模型加以更改，有助于更清楚地了解流程变化带来的影响。通过对流程的模拟，您可以优化流程，进而节省财力。\n通过模拟您还可以做一些“假设”情况的试验。您可以判断：\n员工缺勤可能对流程的影响\n取消初步看上去无设置必要的岗位后可能导致的额外开支\n通过对工作区域的简单调整，使存放部件和原料占用更少的仓储空间而可能节省的时间和资金。\n由技术人员自己撰写报告，不经行政人员而可能节省的财力。\n这种模拟需要一些创造性的思维和相关人员的投入。不要忽视实际执行人员对流程优化的意见。他们或许是对所从事的任务了解最为全面的人，很可能对改善系统有相当多的想法。', '2', '43', '2019-03-23 15:06:44', '2019-03-23 18:05:43');
INSERT INTO `food_notice` VALUES ('974', '公告是什么1', '过程流程图通过图示的方法展现了整个过程的每一任务块。例如，客户订单的流程可以\n运营\n运营\n为，由下单开始，经过订单录入、订单处理、完成订单，最后发货。如果客户可以通过多种途径下单，如电话、订货单或网络，那么可将上述流程制成图表从而确定哪种方式效率最高。流程中的每一步骤通常用方框表示，并带有指向下一步骤的箭头。另有一些符号用来表示开始、结束、输入、输出及其他流程步骤。还可以使用软件程序帮您制作流程图。相关内容我们会在本文稍后部分详细说明。\n标绘图流程\n通过用标绘图描述流程，您可以对其中每一步骤标明价值等级，进而据此区别所做的工作是否对整个流程具有增值作用。据此您可以重新组织流程，去掉那些不增值的工作。如果不能完全删减某个步骤，或许可以对其进行简化。这类分析可应用于公司的所有流程，能帮助您增加整个业务的价值。\n运营\n运营\n标绘图流程使用的符号与流程图很类似，指出整个过程中某一特定环节的运作情况。标绘图流程的符号包括：\n只有通过运营或决策才实现价值提升。要确定过程中有多少步骤没有增加价值，可将它们一一列出，并为每一行为符号插入一列。对每个步骤标明其涉及的行为类型（如运营、移动、延迟等）。对各列的标记进行合计，由运营列和决策列相加得到能增加价值的步骤总数，随后将其余列相加得出不增加价值的步骤总数。\n您可以由此开始流程的改善工作。\n模型化和模拟“假设”情况\n您所创建的流程图和标绘图流程也可以作为模型参考。尽管这些模型能很好的解释“结果”，但是它们无法回答更细的问题，诸如“如何做”、“何时”以及“何地”。某典型业务所用流程若具有一定复杂度，则单纯依靠流程图很难判断变革所产生的效果。而这时模拟模型就有了用武之地。模拟方式允许您对模型加以更改，有助于更清楚地了解流程变化带来的影响。通过对流程的模拟，您可以优化流程，进而节省财力。\n通过模拟您还可以做一些“假设”情况的试验。您可以判断：\n员工缺勤可能对流程的影响\n取消初步看上去无设置必要的岗位后可能导致的额外开支\n通过对工作区域的简单调整，使存放部件和原料占用更少的仓储空间而可能节省的时间和资金。\n由技术人员自己撰写报告，不经行政人员而可能节省的财力。\n这种模拟需要一些创造性的思维和相关人员的投入。不要忽视实际执行人员对流程优化的意见。他们或许是对所从事的任务了解最为全面的人，很可能对改善系统有相当多的想法。', '1', '43', '2019-03-22 16:44:42', '2019-03-23 16:42:44');
INSERT INTO `food_notice` VALUES ('975', '公告是什么', '发文权力的限制性\r\n由于公告宣布的是重大事项和法定事项，发文的权力被限制在高层行政机关及其职能部门的范围之内。具体说，国家最高权力机关（人大及其常委会），国家最高行政机关（国务院）及其所属部门，各省市、自治区、直辖市行政领导机关，某些法定机关，如税务局、海关、铁路局、人民银行、检察院、法院等，有制发公告的权力。其他地方行政机关，一般不能发布公告。党团组织、社会团体、企事业单位，不能发布公告。\r\n发布范围的广泛性\r\n公告是向“国内外”发布重要事项和法定事项的公文，其信息传达范围有时是全国，有时是全世界。譬如，中国曾以公告的形式公布中国科学院院士名单，一方面确立他们在我国科学界学术带头人地位，一方面尽力为他们争取在国际科学界的地位。这样的公告肯定会在世界科学界产生一定的影响。中国有关部门还曾在《人民日报》上刊登公告，公布中国名酒和中国优质酒的品牌、商标和生产企业，已便消费者能认清名牌。\r\n题材的重大性\r\n公告的题材，必须是能在国际国内产生一定影响的重要事项，或者依法必须向社会公布的法定事项。公告的内容庄重严肃，体现着国家权力部门的威严，既要能够将有关信息和政策公诸于众，又要考虑在国内国际可能产生的政治影响。一般性的决定、指示、通知的内容，都不能用公告的形式发布，因为它们很难具有全国和国际性的意义。\r\n内容和传播方式的新闻性\r\n公告还有一定的新闻性特点。所谓新闻，就是对新近发生的、群众关心的、应知而未知的事实的报道。公告的内容，都是新近的、群众应知而未知的事项，在一定程度上具有新闻的特点。公告的发布形式也有新闻性特征，它一般不用红头文件的方式传播，而是在报刊上公开刊登。', '0', '1', '2019-03-23 15:05:51', '2019-03-23 18:05:31');
INSERT INTO `food_notice` VALUES ('976', '平台运营', '过程流程图通过图示的方法展现了整个过程的每一任务块。例如，客户订单的流程可以\r\n运营\r\n运营\r\n为，由下单开始，经过订单录入、订单处理、完成订单，最后发货。如果客户可以通过多种途径下单，如电话、订货单或网络，那么可将上述流程制成图表从而确定哪种方式效率最高。流程中的每一步骤通常用方框表示，并带有指向下一步骤的箭头。另有一些符号用来表示开始、结束、输入、输出及其他流程步骤。还可以使用软件程序帮您制作流程图。相关内容我们会在本文稍后部分详细说明。\r\n标绘图流程\r\n通过用标绘图描述流程，您可以对其中每一步骤标明价值等级，进而据此区别所做的工作是否对整个流程具有增值作用。据此您可以重新组织流程，去掉那些不增值的工作。如果不能完全删减某个步骤，或许可以对其进行简化。这类分析可应用于公司的所有流程，能帮助您增加整个业务的价值。\r\n运营\r\n运营\r\n标绘图流程使用的符号与流程图很类似，指出整个过程中某一特定环节的运作情况。标绘图流程的符号包括：\r\n只有通过运营或决策才实现价值提升。要确定过程中有多少步骤没有增加价值，可将它们一一列出，并为每一行为符号插入一列。对每个步骤标明其涉及的行为类型（如运营、移动、延迟等）。对各列的标记进行合计，由运营列和决策列相加得到能增加价值的步骤总数，随后将其余列相加得出不增加价值的步骤总数。\r\n您可以由此开始流程的改善工作。\r\n模型化和模拟“假设”情况\r\n您所创建的流程图和标绘图流程也可以作为模型参考。尽管这些模型能很好的解释“结果”，但是它们无法回答更细的问题，诸如“如何做”、“何时”以及“何地”。某典型业务所用流程若具有一定复杂度，则单纯依靠流程图很难判断变革所产生的效果。而这时模拟模型就有了用武之地。模拟方式允许您对模型加以更改，有助于更清楚地了解流程变化带来的影响。通过对流程的模拟，您可以优化流程，进而节省财力。\r\n通过模拟您还可以做一些“假设”情况的试验。您可以判断：\r\n员工缺勤可能对流程的影响\r\n取消初步看上去无设置必要的岗位后可能导致的额外开支\r\n通过对工作区域的简单调整，使存放部件和原料占用更少的仓储空间而可能节省的时间和资金。\r\n由技术人员自己撰写报告，不经行政人员而可能节省的财力。\r\n这种模拟需要一些创造性的思维和相关人员的投入。不要忽视实际执行人员对流程优化的意见。他们或许是对所从事的任务了解最为全面的人，很可能对改善系统有相当多的想法。', '1', '43', '2019-03-23 15:06:44', '2019-03-24 15:10:26');
INSERT INTO `food_notice` VALUES ('977', '平台公告', '过程流程图通过图示的方法展现了整个过程的每一任务块。例如，客户订单的流程可以\r\n运营\r\n运营\r\n为，由下单开始，经过订单录入、订单处理、完成订单，最后发货。如果客户可以通过多种途径下单，如电话、订货单或网络，那么可将上述流程制成图表从而确定哪种方式效率最高。流程中的每一步骤通常用方框表示，并带有指向下一步骤的箭头。另有一些符号用来表示开始、结束、输入、输出及其他流程步骤。还可以使用软件程序帮您制作流程图。相关内容我们会在本文稍后部分详细说明。\r\n标绘图流程\r\n通过用标绘图描述流程，您可以对其中每一步骤标明价值等级，进而据此区别所做的工作是否对整个流程具有增值作用。据此您可以重新组织流程，去掉那些不增值的工作。如果不能完全删减某个步骤，或许可以对其进行简化。这类分析可应用于公司的所有流程，能帮助您增加整个业务的价值。\r\n运营\r\n运营\r\n标绘图流程使用的符号与流程图很类似，指出整个过程中某一特定环节的运作情况。标绘图流程的符号包括：\r\n只有通过运营或决策才实现价值提升。要确定过程中有多少步骤没有增加价值，可将它们一一列出，并为每一行为符号插入一列。对每个步骤标明其涉及的行为类型（如运营、移动、延迟等）。对各列的标记进行合计，由运营列和决策列相加得到能增加价值的步骤总数，随后将其余列相加得出不增加价值的步骤总数。\r\n您可以由此开始流程的改善工作。\r\n模型化和模拟“假设”情况\r\n您所创建的流程图和标绘图流程也可以作为模型参考。尽管这些模型能很好的解释“结果”，但是它们无法回答更细的问题，诸如“如何做”、“何时”以及“何地”。某典型业务所用流程若具有一定复杂度，则单纯依靠流程图很难判断变革所产生的效果。而这时模拟模型就有了用武之地。模拟方式允许您对模型加以更改，有助于更清楚地了解流程变化带来的影响。通过对流程的模拟，您可以优化流程，进而节省财力。\r\n通过模拟您还可以做一些“假设”情况的试验。您可以判断：\r\n员工缺勤可能对流程的影响\r\n取消初步看上去无设置必要的岗位后可能导致的额外开支\r\n通过对工作区域的简单调整，使存放部件和原料占用更少的仓储空间而可能节省的时间和资金。\r\n由技术人员自己撰写报告，不经行政人员而可能节省的财力。\r\n这种模拟需要一些创造性的思维和相关人员的投入。不要忽视实际执行人员对流程优化的意见。他们或许是对所从事的任务了解最为全面的人，很可能对改善系统有相当多的想法。', '1', '1', '2019-03-23 15:07:47', '2019-03-24 15:10:29');
INSERT INTO `food_notice` VALUES ('978', '沙发上', '撒啊啊啊啊啊啊啊啊啊啊啊啊啊打撒撒是阿凡达所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 sasa', '1', '1', '2019-03-23 18:11:48', null);
INSERT INTO `food_notice` VALUES ('979', '阿萨斯所所所所所', '啊擦擦nnn', '0', '1', '2019-03-23 18:19:05', '2019-03-24 14:51:03');
INSERT INTO `food_notice` VALUES ('980', null, null, '0', '1', '2019-03-24 13:34:55', '2019-03-24 13:38:53');
INSERT INTO `food_notice` VALUES ('981', null, null, '0', '1', '2019-03-24 13:38:17', '2019-03-24 13:38:51');
INSERT INTO `food_notice` VALUES ('982', 'hhhh', 'hhhhhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', '0', '1', '2019-03-24 14:51:14', '2019-03-24 14:51:19');

-- ----------------------------
-- Table structure for food_pic
-- ----------------------------
DROP TABLE IF EXISTS `food_pic`;
CREATE TABLE `food_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `food_id` bigint(20) DEFAULT '0' COMMENT '菜品id',
  `type` int(2) DEFAULT '1' COMMENT '类型  1 图片  2 视频',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `status` int(2) DEFAULT '1' COMMENT '状态  0 删除 1正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_pic
-- ----------------------------
INSERT INTO `food_pic` VALUES ('1', '1', '1', '/upload/img/jiding1.jpg', '1');
INSERT INTO `food_pic` VALUES ('2', '1', '1', '/upload/img/jiding2.jpg', '1');
INSERT INTO `food_pic` VALUES ('3', '1', '1', '/upload/img/jiding3.jpg', '1');
INSERT INTO `food_pic` VALUES ('4', '2', '1', '/upload/img/doufu1.jpg', '1');
INSERT INTO `food_pic` VALUES ('5', '3', '1', '/upload/img/suancaiyu1.jpg', '1');
INSERT INTO `food_pic` VALUES ('6', '4', '1', '/upload/img/daxia.jpg', '1');
INSERT INTO `food_pic` VALUES ('7', '5', '1', '/upload/img/xiaochaorou1.jpg', '1');
INSERT INTO `food_pic` VALUES ('8', '5', '1', '/upload/img/xiaochaorou2.jpg', '1');
INSERT INTO `food_pic` VALUES ('9', '2', '1', '/upload/img/doufu2.jpg', '1');
INSERT INTO `food_pic` VALUES ('10', '3', '1', '/upload/img/suancaiyu2.jpg', '1');
INSERT INTO `food_pic` VALUES ('11', '3', '1', '/upload/img/suancaiyu3.jpg', '1');
INSERT INTO `food_pic` VALUES ('12', '6', '1', '/upload/img/jiding1.jpg', '1');
INSERT INTO `food_pic` VALUES ('13', '7', '1', '/upload/img/jiding2.jpg', '1');
INSERT INTO `food_pic` VALUES ('14', '8', '1', '/upload/img/jiding3.jpg', '1');
INSERT INTO `food_pic` VALUES ('15', '9', '1', '/upload/img/doufu1.jpg', '1');
INSERT INTO `food_pic` VALUES ('16', '10', '1', '/upload/img/suancaiyu1.jpg', '1');
INSERT INTO `food_pic` VALUES ('17', '11', '1', '/upload/img/daxia.jpg', '1');
INSERT INTO `food_pic` VALUES ('18', '12', '1', '/upload/img/xiaochaorou1.jpg', '1');
INSERT INTO `food_pic` VALUES ('19', '13', '1', '/upload/img/xiaochaorou2.jpg', '1');
INSERT INTO `food_pic` VALUES ('20', '14', '1', '/upload/img/doufu2.jpg', '1');
INSERT INTO `food_pic` VALUES ('21', '15', '1', '/upload/img/suancaiyu2.jpg', '1');
INSERT INTO `food_pic` VALUES ('22', '16', '1', '/upload/img/suancaiyu3.jpg', '1');
INSERT INTO `food_pic` VALUES ('23', '10', '1', '/upload/img/suancaiyu1.jpg', '1');
INSERT INTO `food_pic` VALUES ('24', '13', '1', '/upload/img/xiaochaorou1.jpg', '1');
INSERT INTO `food_pic` VALUES ('25', '14', '1', '/upload/img/doufu.jpg', '1');
INSERT INTO `food_pic` VALUES ('26', '15', '1', '/upload/img/suancaiyu2.jpg', '1');
INSERT INTO `food_pic` VALUES ('27', '16', '1', '/upload/img/suancaiyu3.jpg', '1');
INSERT INTO `food_pic` VALUES ('28', '10', '1', '/upload/img/daxia.jpg', '1');
INSERT INTO `food_pic` VALUES ('29', '16', '1', '/upload/img/xiaochaorou1.jpg', '1');
INSERT INTO `food_pic` VALUES ('30', '18', '1', '/upload/img/227917d5.jpg', '1');
INSERT INTO `food_pic` VALUES ('31', '18', '1', '/upload/img/3bc6a475.jpg', '1');
INSERT INTO `food_pic` VALUES ('32', '20', '1', '/upload/img/f51a772e.jpg', '1');
INSERT INTO `food_pic` VALUES ('33', '20', '1', '/upload/img/fb6745c.jpg', '1');
INSERT INTO `food_pic` VALUES ('34', '22', '1', '/upload/img/9422024f.jpg', '1');
INSERT INTO `food_pic` VALUES ('35', '22', '1', '/upload/img/99a45c03.jpg', '1');
INSERT INTO `food_pic` VALUES ('36', '23', '1', '/upload/img/badd0b21.jpg', '1');
INSERT INTO `food_pic` VALUES ('37', '24', '1', '/upload/img/851afa01.jpg', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '666666', '超级管理员', '2019-03-18 21:44:37', '1');
INSERT INTO `user` VALUES ('43', 'test', '123123', '超级管理员', '2019-01-02 09:14:12', '1');

-- ----------------------------
-- Table structure for video_info
-- ----------------------------
DROP TABLE IF EXISTS `video_info`;
CREATE TABLE `video_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `video_url` varchar(100) DEFAULT NULL COMMENT '视频地址',
  `video_name` varchar(50) DEFAULT NULL COMMENT '视频名',
  `video_pic` varchar(70) DEFAULT NULL COMMENT '视频封面图',
  `video_desc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `status` int(2) DEFAULT '1' COMMENT '状态  0 删除  1 正常  2 下架',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_info
-- ----------------------------
INSERT INTO `video_info` VALUES ('1', '/upload/video/toufu.mp4', '酸菜鱼', '/upload/img/jiding2.jpg', '这是酸菜鱼', '43', '1', '2019-03-21 00:40:33', '2019-03-23 18:50:41');
INSERT INTO `video_info` VALUES ('2', '/upload/video/fash.mp4', '豆腐', '/upload/img/suancaiyu1.jpg', '这是豆腐', '1', '1', '2019-03-21 22:25:46', '2019-03-23 18:50:36');
INSERT INTO `video_info` VALUES ('3', '/upload/video/toufu.mp4', '宫保鸡丁', '/upload/img/jiding2.jpg', '这是宫保鸡丁', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:27:57');
INSERT INTO `video_info` VALUES ('4', '/upload/video/fash.mp4', '油焖大虾', '/upload/img/suancaiyu1.jpg', '这是油焖大虾', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:00');
INSERT INTO `video_info` VALUES ('5', '/upload/video/toufu.mp4', '酸菜鱼', '/upload/img/jiding2.jpg', '这是酸菜鱼', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:28:41');
INSERT INTO `video_info` VALUES ('6', '/upload/video/fash.mp4', '豆腐', '/upload/img/suancaiyu1.jpg', '这是豆腐', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:44');
INSERT INTO `video_info` VALUES ('7', '/upload/video/toufu.mp4', '宫保鸡丁', '/upload/img/suancaiyu3.jpg', '这是宫保鸡丁', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:27:57');
INSERT INTO `video_info` VALUES ('8', '/upload/video/fash.mp4', '油焖大虾', '/upload/img/jiding2.jpg', '这是油焖大虾', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:00');
INSERT INTO `video_info` VALUES ('9', '/upload/video/toufu.mp4', '宫保鸡丁', '/upload/img/suancaiyu3.jpg', '这是宫保鸡丁', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:27:57');
INSERT INTO `video_info` VALUES ('10', '/upload/video/fash.mp4', '油焖大虾', '/upload/img/jiding2.jpg', '这是油焖大虾', '1', '0', '2019-03-21 22:25:46', '2019-03-21 22:28:00');
INSERT INTO `video_info` VALUES ('11', '/upload/video/toufu.mp4', '酸菜鱼', '/upload/img/jiding2.jpg', '这是酸菜鱼', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:28:41');
INSERT INTO `video_info` VALUES ('12', '/upload/video/fash.mp4', '豆腐', '/upload/img/suancaiyu3.jpg', '这是豆腐', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:44');
INSERT INTO `video_info` VALUES ('13', '/upload/video/toufu.mp4', '宫保鸡丁', '/upload/img/jiding2.jpg', '这是宫保鸡丁', '43', '0', '2019-03-21 00:40:33', '2019-03-21 22:27:57');
INSERT INTO `video_info` VALUES ('14', '/upload/video/fash.mp4', '油焖大虾', '/upload/img/suancaiyu3.jpg', '这是油焖大虾', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:00');
INSERT INTO `video_info` VALUES ('15', '/upload/video/fash.mp4', '豆腐', '/upload/img/doufu2.jpg', '这是豆腐', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:44');
INSERT INTO `video_info` VALUES ('16', '/upload/video/toufu.mp4', '宫保鸡丁', '/upload/img/suancaiyu3.jpg', '这是宫保鸡丁', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:27:57');
INSERT INTO `video_info` VALUES ('17', '/upload/video/fash.mp4', '油焖大虾', '/upload/img/jiding2.jpg', '这是油焖大虾', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:00');
INSERT INTO `video_info` VALUES ('18', '/upload/video/toufu.mp4', '宫保鸡丁', '/upload/img/suancaiyu3.jpg', '这是宫保鸡丁', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:27:57');
INSERT INTO `video_info` VALUES ('19', '/upload/video/fash.mp4', '油焖大虾', '/upload/img/doufu2.jpg', '这是油焖大虾', '1', '0', '2019-03-21 22:25:46', '2019-03-21 22:28:00');
INSERT INTO `video_info` VALUES ('20', '/upload/video/toufu.mp4', '酸菜鱼', '/upload/img/suancaiyu3.jpg', '这是酸菜鱼', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:28:41');
INSERT INTO `video_info` VALUES ('21', '/upload/video/fash.mp4', '豆腐', '/upload/img/jiding2.jpg', '这是豆腐', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:44');
INSERT INTO `video_info` VALUES ('22', '/upload/video/toufu.mp4', '宫保鸡丁', '/upload/img/suancaiyu3.jpg', '这是宫保鸡丁', '43', '1', '2019-03-21 00:40:33', '2019-03-21 22:27:57');
INSERT INTO `video_info` VALUES ('23', '/upload/video/fash.mp4', '油焖大虾', '/upload/img/doufu2.jpg', '这是油焖大虾', '1', '1', '2019-03-21 22:25:46', '2019-03-21 22:28:00');
INSERT INTO `video_info` VALUES ('24', '', '444', '/upload/img/451b2713.jpg', '/upload/img/451b2713.jpg', '1', '0', '2019-03-24 14:03:07', '2019-03-24 14:26:07');
INSERT INTO `video_info` VALUES ('25', '', '444', '/upload/img/9ce74b32.jpg', '/upload/img/9ce74b32.jpg', '1', '0', '2019-03-24 14:05:44', '2019-03-24 14:22:43');
INSERT INTO `video_info` VALUES ('26', '/upload/video/a876da07.mp4', '22222', '/upload/img/69d21444.jpg', 'sgdsgsdg', '1', '0', '2019-03-24 14:13:06', '2019-03-24 14:50:21');
INSERT INTO `video_info` VALUES ('27', '/upload/video/48c51d38.mp4', 'sss1', '/upload/img/6882bc8b.jpg', 'dddddddddddddd', '1', '1', '2019-03-24 14:24:59', null);
INSERT INTO `video_info` VALUES ('28', '/upload/video/3a87dbe9.mp4', 'dddddd', '/upload/img/833f497a.jpg', 'dffffffffffffffffffffffffffffffff', '1', '1', '2019-03-24 14:28:56', null);
INSERT INTO `video_info` VALUES ('29', '/upload/video/d07fc424.mp4', 'sss', '/upload/img/3256d5f1.jpg', 'ssss', '1', '0', '2019-03-24 14:33:48', '2019-03-24 14:50:14');
INSERT INTO `video_info` VALUES ('30', '/upload/video/6ecdc490.mp4', '55', '/upload/img/924274b1.jpg', 'hhhhhhhhhhhhhhhh', '1', '1', '2019-03-24 14:50:41', null);
