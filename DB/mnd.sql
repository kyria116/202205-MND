-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.4.6-MariaDB
-- PHP 版本： 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mnd`
--

-- --------------------------------------------------------

--
-- 資料表結構 `document`
--

CREATE TABLE `document` (
  `d_id` int(11) NOT NULL DEFAULT 0,
  `d_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `document`
--

INSERT INTO `document` (`d_id`, `d_text`) VALUES
(1, '資安通報'),
(2, NULL),
(3, NULL),
(4, '府中商圈'),
(5, '府中商圈'),
(6, 'Copyright &copy; 2021 建業法律事務所 All Rights Reserved.'),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, 'chienyeh@mak66design2.com'),
(12, 'CFhr.AMQ7Zs2'),
(13, 'ur17.cx901.com'),
(14, '465'),
(15, '2'),
(16, '1'),
(17, NULL),
(18, NULL),
(19, NULL),
(20, NULL),
(21, NULL),
(22, NULL),
(23, NULL),
(24, NULL),
(25, NULL),
(26, NULL),
(27, NULL),
(28, NULL),
(29, NULL),
(30, NULL),
(31, NULL),
(32, NULL),
(33, NULL),
(34, NULL),
(35, NULL),
(36, NULL),
(37, NULL),
(38, NULL),
(39, NULL),
(40, NULL),
(41, NULL),
(42, NULL),
(43, NULL),
(44, NULL),
(45, NULL),
(46, NULL),
(47, NULL),
(48, NULL),
(49, NULL),
(50, NULL),
(51, NULL),
(52, NULL),
(53, NULL),
(54, NULL),
(55, NULL),
(56, NULL),
(57, NULL),
(58, NULL),
(59, NULL),
(60, NULL),
(61, NULL),
(62, NULL),
(63, NULL),
(64, NULL),
(65, NULL),
(66, NULL),
(67, NULL),
(68, NULL),
(69, NULL),
(70, NULL),
(71, NULL),
(72, NULL),
(73, NULL),
(74, NULL),
(75, NULL),
(76, NULL),
(77, NULL),
(78, NULL),
(79, NULL),
(80, NULL),
(81, NULL),
(82, NULL),
(83, NULL),
(84, NULL),
(85, NULL),
(86, NULL),
(87, NULL),
(88, NULL),
(89, NULL),
(90, NULL),
(91, NULL),
(92, NULL),
(93, NULL),
(94, NULL),
(95, NULL),
(96, NULL),
(97, NULL),
(98, NULL),
(99, NULL),
(100, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `menu`
--

CREATE TABLE `menu` (
  `m_id` varchar(6) NOT NULL DEFAULT '',
  `m_type` varchar(10) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `m_url` varchar(255) DEFAULT NULL,
  `m_icon_sidebar` varchar(255) DEFAULT NULL,
  `m_icon_index` varchar(255) DEFAULT NULL,
  `m_main_purview` varchar(10) DEFAULT '2',
  `m_sub_purview` varchar(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `menu`
--

INSERT INTO `menu` (`m_id`, `m_type`, `m_name`, `m_url`, `m_icon_sidebar`, `m_icon_index`, `m_main_purview`, `m_sub_purview`) VALUES
('006', 'root', '功能權限', 'menu.php', 'fa fa-users', 'fa fa-users', '0', '0'),
('011', 'root', '最新消息管理', 'n_class.php', 'fa fa-newspaper-o', 'fa fa-newspaper-o', '2', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `n_id` int(11) NOT NULL,
  `n_title` varchar(255) DEFAULT NULL,
  `n_keyword` varchar(255) DEFAULT NULL,
  `nc_id` int(11) DEFAULT NULL,
  `n_area` varchar(255) DEFAULT NULL,
  `n_date` date DEFAULT NULL,
  `n_stext` longtext DEFAULT NULL,
  `n_source` longtext DEFAULT NULL,
  `n_suggest` longtext DEFAULT NULL,
  `n_unit` varchar(255) DEFAULT NULL,
  `n_name` varchar(255) DEFAULT NULL,
  `n_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `news`
--

INSERT INTO `news` (`n_id`, `n_title`, `n_keyword`, `nc_id`, `n_area`, `n_date`, `n_stext`, `n_source`, `n_suggest`, `n_unit`, `n_name`, `n_order`) VALUES
(1, '錢準備好卻搶不到新竹房！內行人曝關鍵時點：一開賣就掃光', '#財經 #股票 #錢', 2, '台北區', '2022-06-17', '&lt;p&gt;&lt;img alt=&quot;錢準備好卻搶不到新竹房！內行人曝關鍵時點：一開賣就掃光&quot; data-original=&quot;https://img-fnc.ebc.net.tw/EbcFnc/news/2022/06/14/1655231415_36489.jpeg&quot; onclick=&quot;WebOpenImage(this);&quot; src=&quot;https://img-fnc.ebc.net.tw/EbcFnc/news/2022/06/14/1655231415_36489.jpeg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;自從竹科發展以來，新竹市的房價就節節上升，成為全台數一數二的高房價地帶。儘管新竹房產的飆漲幅度驚人，但仍一房難求。一名網友就發文訴苦，表示自己有意在新竹置產，卻發現即使是新竹外圍地區，好一點的房子也很快就賣掉，顯然即使新竹房價越來越貴，但民眾買房的需求仍高，這令他感到「滿滿的窒息感」。 對此，有內行網友指出，新竹的房市往往和竹科工程師的生活型態息息相關，尤其是分紅時間點一到，好的物件經常就被搶購一空。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;https://news.ebc.net.tw/news/house/322346&quot; target=&quot;_blank&quot;&gt;★沒有眼花！新竹蛋白區房價6字頭 專家曝瘋狂飆價背後原因&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;該名網友是在論壇PTT上發文，表示自己曾認真研究新竹香山、北區及周邊地區芎林、竹東、新豐、湖口、竹南、金雅等地區的房價，驚訝的發現只要條件稍微好一點的房子幾乎都已都賣光，但顯然市場上的買房需求還是很大，大家還是很想買，只是這些需求都被壓抑住，「進入遞延需求，開始存錢」，而不買房的人，原因大部分是不爽市場漲太快。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;https://youtu.be/pRJ3nGv7610&quot; target=&quot;_blank&quot;&gt;★【理財達人秀】&lt;/a&gt;&lt;a href=&quot;https://youtu.be/pdwBIXo1XBc&quot; target=&quot;_blank&quot;&gt;美三碼.台半碼 Q3盈餘修正潮來了？水手該棄船嗎？海運改革法詳解★&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;原PO表示，這種種狀況都令他感到窒息，主要原因有二，第一，新竹不只是市區，就連外圍也難找到好房子，只要樓高高一點，坪數大一點的物件，幾乎賣光了。其次則是市區的中古屋價格也越來越高，已抬高到接近新屋價，許多屋齡十幾年的物件每坪要價也要40、50萬。他說，現在即使準備好買房資金，也難找到喜歡的房子，面臨「無房可買」的困境。&lt;/p&gt;\r\n\r\n&lt;p&gt;▼原PO表示觀察新竹的房市後，覺得「滿滿的窒息感」，因為即使準備好購屋基金，也難找到理想的好房子。（示意圖／取自Pixabay）&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;https://img-fnc.ebc.net.tw/EbcFnc/news/images/151748/2022/06/15/1655301073_97862.PNG&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;貼文一出，不少網友都感到心有戚戚焉，認為現在在新竹想買到心儀的好房子確實很難：「 搶不到好一點的房子，這個現象從2021開始尤為明顯，我貸款都問好了，沒物件可以看，鎖定區域的物件少到想哭，好不容易有就是又爛又貴」、「實際上新竹市2X年甚至3X年房很多空間也不大，甚至格局很差或有奇形怪狀的房間」。&lt;/p&gt;\r\n\r\n&lt;p&gt;▼內行網友透露，每逢過年時，竹科工程師都能領到數字可觀的分紅，甚至領一次分紅就足以支付頭期款，因此新竹的好房子通常在竹科發放分紅後就被一掃而空。（示意圖／取自pixabay）&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;img src=&quot;https://img-fnc.ebc.net.tw/EbcFnc/news/images/151748/2022/06/15/1655300135_84975.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;而對於這種現象，有網友進一步分析，這很可能和竹科工程師的生態息息相關。有內行網友表示，新竹科技業的分紅都給超大包，甚至領一次就能支付頭期款，且能拿到這個數字的竹科工程師還不少，所以每到過年發分紅的時候，新竹的好房子就會在這時被一掃而空：「別的地方無法體會領一包頭期款就有了的感覺，而且有一堆人辦得到」、「過完年差異非常大，可能分紅真的太大包吧，我猜靠園區這邊1500內三房平車應該會被清掃」、領了那一包，車子早就已經是雙B了，沒有要升級保時捷的話，當然是去看房啊。」&lt;/p&gt;\r\n', '&lt;p&gt;而對於這種現象，有網友進一步分析，這很可能和竹科工程師的生態息息相關。有內行網友表示，新竹科技業的分紅都給超大包，甚至領一次就能支付頭期款，且能拿到這個數字的竹科工程師還不少，所以每到過年發分紅的時候，新竹的好房子就會在這時被一掃而空：「別的地方無法體會領一包頭期款就有了的感覺，而且有一堆人辦得到」、「過完年差異非常大，可能分紅真的太大包吧，我猜靠園區這邊1500內三房平車應該會被清掃」、領了那一包，車子早就已經是雙B了，沒有要升級保時捷的話，當然是去看房啊。」&lt;/p&gt;\r\n', '&lt;p&gt;貼文一出，不少網友都感到心有戚戚焉，認為現在在新竹想買到心儀的好房子確實很難：「 搶不到好一點的房子，這個現象從2021開始尤為明顯，我貸款都問好了，沒物件可以看，鎖定區域的物件少到想哭，好不容易有就是又爛又貴」、「實際上新竹市2X年甚至3X年房很多空間也不大，甚至格局很差或有奇形怪狀的房間」。&lt;/p&gt;\r\n\r\n&lt;p&gt;▼內行網友透露，每逢過年時，竹科工程師都能領到數字可觀的分紅，甚至領一次分紅就足以支付頭期款，因此新竹的好房子通常在竹科發放分紅後就被一掃而空。（示意圖／取自pixabay）&lt;/p&gt;\r\n', '東森財經', '郭山泥', 2),
(2, '她錄取台積電1職缺「想待到退休」 卻憂1原因被取代', '#職場 #正能量', 2, '桃園區', '2022-06-17', '&lt;p&gt;近年台積電獲利繳出好表現，讓不少人都嚮往到能到台積電工作，但台積電開出的職缺並非只有工程師。有位好不容易應徵上作業員的網友，就很擔心未來會被AI取代，也因此在Dcard詢問這份工作是否有可能做到退休，文章也引起網友熱烈討論。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;https://www.facebook.com/ebcmoney/&quot; target=&quot;_blank&quot;&gt;★【東森財經粉絲團】最新資訊一把抓！&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;原PO在文章中指出，她找工作已經找了一段時間，好不容易終於應徵上台積電作業員，原本應該要開心慶祝，但她卻頗為猶豫要不要前往就職。原PO表示，自己個性上追求穩定，可以的話會希望能夠在同一份工作做到退休，儘管台積電是規模非常大的公司不太可能倒閉，但她仍非常擔心隨著AI越來越發達，作業員的工作會很容易被淘汰。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;https://youtu.be/pRJ3nGv7610&quot; target=&quot;_blank&quot;&gt;★【理財達人秀】&lt;/a&gt;&lt;a href=&quot;https://youtu.be/pdwBIXo1XBc&quot; target=&quot;_blank&quot;&gt;美三碼.台半碼 Q3盈餘修正潮來了？水手該棄船嗎？海運改革法詳解★&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;▼一名網友錄取台積電作業員，卻憂未來恐被AI取代。 （示意圖／pixabay）&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;https://img-fnc.ebc.net.tw/EbcFnc/news/images/151718/2022/06/14/1655228981_22170.jpg&quot; /&gt;&lt;/p&gt;\r\n', '&lt;p&gt;而文章貼出後，引起熱烈討論。不少網友都勸原PO先進去工作再說，畢竟很多人都搶著進去，台積電福利也普遍比一般小公司要好，就算只做一段時間也能累積一定資產，紛紛建議「先賺錢吧，想那麼多沒用，在裡面工作一年，外面可能要好幾年」、「前5年薪水大概70、80、90、95、100萬，每年調薪，待20年大概就能領150萬了吧」。&lt;/p&gt;\r\n', '&lt;p&gt;更有許多過來人認為，進去能不能待滿一年都是問題，新人不一定待得住，因此真正應該擔心的是能撐多久，需不需要看醫生，且就算選了一個最有未來性的產業，也不一定做的久，並直指「你該擔心的是有沒有辦法稱到那時候」、「先擔心身體健康能輪班顧機台多久」。&lt;/p&gt;\r\n\r\n&lt;p&gt;也有網友深度解析目前AI的發展狀況，他指出目前AI主要用來處理需要花費大量時間，且內容複雜的工作，例如預警系統、物件偵測。一般來說，工廠內上、下貨、製程物料運輸等工作，未來是會被自動化取代，但會讓作業員處理機況與突發事故，所以更明確的說，未來自動化普及後，會減少的是作業員使用量。&lt;/p&gt;\r\n\r\n&lt;p&gt;其餘網友則留言，「現在工人智慧便宜，人工智慧太貴而已」、「你若能當10年作業員，錢也已經夠花了，不用擔心被自動化取代」、「外面拚命想進，裡面拚命想逃」、「還是要有危機意識持續提升自己價值，讓自己一輩子停留在底層的風險很高」。&lt;/p&gt;\r\n\r\n&lt;p&gt;▼（圖／翻攝自Dcard）&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;https://img-fnc.ebc.net.tw/EbcFnc/news/images/151718/2022/06/14/1655214263_87043.jpg&quot; /&gt;&lt;/p&gt;\r\n', '東森職場', 'ABCDEF', 4),
(3, '「天堂M」機率不實！遊戲橘子遭罰200萬 丁特：正義必得伸張', '#3C #天堂M #遊戲', 2, '彰化區', '2022-06-03', '&lt;p&gt;知名電競選手、遊戲實況主「丁特」去年砸了超過百萬元在手遊《天堂M》，希望獲得遊戲中的稀有道具紫布，但實測471次後只有11次成功，機率為2.3%，與官方公告的10%機率有落差，怒控代理商「遊戲橘子」調降機率、欺騙台灣玩家，遊戲橘子也為此反告丁特詆毀商譽。不過公平交易委員會介入調查後，昨（13日）認定遊戲橘子提供的服務內容有虛偽不實、引人錯誤之表示，對其開出200萬元之罰鍰。&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;https://www.facebook.com/ebcmoney/&quot; target=&quot;_blank&quot;&gt;★【東森財經粉絲團】最新資訊一把抓！&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;丁特是多年的《天堂M》玩家，這幾年玩下來投入的金額可能已破千萬。去年9月他開直播，豪砸170萬元要合成遊戲中的傳說製作祕笈「紫布」，但他嘗試了471次後，成功的機率僅2.3%，遠低於官方公布的10%，讓他質疑事有蹊蹺。台灣地區的代理商遊戲橘子起初表示，台灣遊戲伺服器的機率和韓國伺服器的機率是一樣，但後來又改口說紫布不是機率型產品，因此不適用韓服相同機率的規定，讓丁特多次砲轟，質疑遊戲橘子欺騙台灣玩家，沒想到反而被遊戲橘子提告稱其未經查證散布不實資訊、詆毀商譽。&lt;/p&gt;\r\n', '', '&lt;p&gt;然而公平會去年接獲檢舉後介入調查，昨針對遊戲橘子作出處分。公平會指出，遊戲橘子曾在2019年12月的《天堂M》玩家座談會中表明，活動製作、抽卡、合成的機率「台版機率都是跟韓國一模一樣的」；但在調查後發現，實際上韓版在2019年10月時設定機率為10%，而台版設定機率為5%，兩者顯為不同。遊戲橘子工作人員在座談會中還&lt;/p&gt;\r\n\r\n&lt;p&gt;公平會認為，遊戲橘子的作法可能使消費者誤認兩者機率相同並誘發做成交易決定，經過委員會議通過，認定遊戲橘子公司就足以影響交易決定之服務內容為虛偽不實及引人錯誤之表示，違反《公平交易法》第21條第4項準用第1項規定，處200萬元罰鍰。&lt;/p&gt;\r\n\r\n&lt;p&gt;公平會表示，這是國內首宗因遊戲業者機率宣稱不實而遭公平會開罰的案例，他們也呼籲業者，遊戲機率對玩家而言屬於重要交易資訊，優質的機率宣稱及透明機制，才是吸引玩家投入並讓遊戲產業更上一層樓的最佳策略。&lt;/p&gt;\r\n\r\n&lt;p&gt;丁特獲知此一處分後，在&lt;a href=&quot;https://www.facebook.com/DinTerlol/posts/571827654301662&quot; target=&quot;_blank&quot;&gt;臉書&lt;/a&gt;上有感而發直說「正義必得伸張」。他也驚訝表示，原來當時遊戲橘子在聲稱機率和韓國一樣的時候，紫布的機率早就不一樣了，可是遊戲橘子在官網還一直用機率一致宣傳了1、2年，「這樣說遊戲橘子欺騙消費者不為過吧？還要被你們告&amp;hellip;」。&lt;/p&gt;\r\n\r\n&lt;p&gt;說「基本上台版官網就是比照韓版&amp;hellip;&amp;hellip;不用擔心我們去竄改機率」，可是卻沒有說明設定不同的部分。&lt;/p&gt;\r\n', '東森財經', '郭山泥', 1),
(4, '活動快訊', '', 2, '', '2022-06-17', '', '', '', '', '', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `n_class`
--

CREATE TABLE `n_class` (
  `nc_id` int(11) NOT NULL,
  `nc_title` varchar(255) DEFAULT NULL,
  `nc_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `n_class`
--

INSERT INTO `n_class` (`nc_id`, `nc_title`, `nc_order`) VALUES
(1, '一級督(輔)導', 1),
(2, '作業規定', 5),
(3, '資安檢測', 4),
(4, '資安通報', 3),
(5, '資安月報', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `record`
--

CREATE TABLE `record` (
  `r_id` int(11) NOT NULL,
  `r_date` datetime DEFAULT NULL,
  `r_text` varchar(255) DEFAULT NULL,
  `r_account` varchar(255) DEFAULT NULL,
  `r_name` varchar(255) DEFAULT NULL,
  `r_ip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `record`
--

INSERT INTO `record` (`r_id`, `r_date`, `r_text`, `r_account`, `r_name`, `r_ip`) VALUES
(1, '2022-06-17 10:17:28', '登入', 'MAK_supervisor', '源做總管理者', '::1'),
(2, '2022-06-17 10:18:35', 'n_class 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(3, '2022-06-17 10:18:43', 'n_class 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(4, '2022-06-17 10:18:52', 'n_class 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(5, '2022-06-17 10:18:59', 'n_class 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(6, '2022-06-17 10:19:07', 'n_class 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(7, '2022-06-17 10:19:11', 'n_class 資料修改：1', 'MAK_supervisor', '源做總管理者', '::1'),
(8, '2022-06-17 10:22:56', 'news 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(9, '2022-06-17 10:23:10', 'news 資料修改：1', 'MAK_supervisor', '源做總管理者', '::1'),
(10, '2022-06-17 10:25:05', 'news 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(11, '2022-06-17 11:31:10', 'document 資料修改：1', 'MAK_supervisor', '源做總管理者', '::1'),
(12, '2022-06-17 11:45:31', 'news 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(13, '2022-06-17 11:45:40', 'news 資料修改：2', 'MAK_supervisor', '源做總管理者', '::1'),
(14, '2022-06-17 11:46:36', 'news 資料修改：2', 'MAK_supervisor', '源做總管理者', '::1'),
(15, '2022-06-17 12:55:08', 'news 資料修改：3', 'MAK_supervisor', '源做總管理者', '::1'),
(16, '2022-06-17 13:10:41', 'news 資料修改：2', 'MAK_supervisor', '源做總管理者', '::1'),
(17, '2022-06-17 15:11:09', 'news 資料修改：2', 'MAK_supervisor', '源做總管理者', '::1'),
(18, '2022-06-17 15:11:27', 'news 資料修改：3', 'MAK_supervisor', '源做總管理者', '::1'),
(19, '2022-06-17 15:11:57', 'news 資料修改：1', 'MAK_supervisor', '源做總管理者', '::1'),
(20, '2022-06-17 15:13:07', 'news 資料新增', 'MAK_supervisor', '源做總管理者', '::1'),
(21, '2022-06-17 15:16:56', 'news 資料修改：4', 'MAK_supervisor', '源做總管理者', '::1'),
(22, '2022-06-17 15:22:57', 'news 資料修改：4', 'MAK_supervisor', '源做總管理者', '::1'),
(23, '2022-06-17 15:23:14', 'news 資料修改：4', 'MAK_supervisor', '源做總管理者', '::1'),
(24, '2022-06-17 15:23:35', 'news 資料修改：3', 'MAK_supervisor', '源做總管理者', '::1');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_account` varchar(255) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL,
  `u_name` varchar(255) DEFAULT NULL,
  `u_main_purview` varchar(10) DEFAULT NULL,
  `u_sub_purview` varchar(10) DEFAULT NULL,
  `u_check` varchar(5) DEFAULT NULL,
  `u_error` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`u_id`, `u_account`, `u_password`, `u_name`, `u_main_purview`, `u_sub_purview`, `u_check`, `u_error`) VALUES
(1, 'MAK_supervisor', 'e05d5374b073bea0ab020448a23f66ea', '源做總管理者', '0', '0', 'Y', 0),
(2, 'mnd_admin', '202cb962ac59075b964b07152d234b70', '【資安通報】管理者', '1', '0', 'Y', 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`d_id`);

--
-- 資料表索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`m_id`);

--
-- 資料表索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`n_id`);

--
-- 資料表索引 `n_class`
--
ALTER TABLE `n_class`
  ADD PRIMARY KEY (`nc_id`);

--
-- 資料表索引 `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`r_id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `n_class`
--
ALTER TABLE `n_class`
  MODIFY `nc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `record`
--
ALTER TABLE `record`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
