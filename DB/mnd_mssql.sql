USE [master]
GO
/****** Object:  Database [mnd]    Script Date: 2022/9/1 上午 10:29:49 ******/
CREATE DATABASE [mnd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mnd', FILENAME = N'D:\xampp\htdocs\www\202205-MND\DB\mnd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mnd_log', FILENAME = N'D:\xampp\htdocs\www\202205-MND\DB\mnd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mnd] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mnd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mnd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mnd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mnd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mnd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mnd] SET ARITHABORT OFF 
GO
ALTER DATABASE [mnd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mnd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mnd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mnd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mnd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mnd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mnd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mnd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mnd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mnd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mnd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mnd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mnd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mnd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mnd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mnd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mnd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mnd] SET RECOVERY FULL 
GO
ALTER DATABASE [mnd] SET  MULTI_USER 
GO
ALTER DATABASE [mnd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mnd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mnd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mnd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mnd] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mnd] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mnd', N'ON'
GO
ALTER DATABASE [mnd] SET QUERY_STORE = OFF
GO
USE [mnd]
GO
/****** Object:  Table [dbo].[document]    Script Date: 2022/9/1 上午 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[document](
	[d_id] [int] IDENTITY(1,1) NOT NULL,
	[d_text] [text] NULL,
 CONSTRAINT [PK_document] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 2022/9/1 上午 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[m_id] [varchar](6) NOT NULL,
	[m_type] [varchar](10) NULL,
	[m_name] [varchar](255) NULL,
	[m_url] [varchar](255) NULL,
	[m_icon_sidebar] [varchar](255) NULL,
	[m_icon_index] [varchar](255) NULL,
	[m_main_purview] [varchar](10) NULL,
	[m_sub_purview] [varchar](10) NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[n_class]    Script Date: 2022/9/1 上午 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[n_class](
	[nc_id] [int] IDENTITY(1,1) NOT NULL,
	[nc_title] [varchar](255) NULL,
	[nc_order] [int] NULL,
 CONSTRAINT [PK_nc_title] PRIMARY KEY CLUSTERED 
(
	[nc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 2022/9/1 上午 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[n_id] [int] IDENTITY(1,1) NOT NULL,
	[n_title] [varchar](255) NULL,
	[n_keyword] [varchar](255) NULL,
	[nc_id] [int] NULL,
	[n_area] [varchar](255) NULL,
	[n_date] [date] NULL,
	[n_stext] [text] NULL,
	[n_source] [text] NULL,
	[n_suggest] [text] NULL,
	[n_unit] [varchar](255) NULL,
	[n_name] [varchar](255) NULL,
	[n_order] [int] NULL,
 CONSTRAINT [PK_news] PRIMARY KEY CLUSTERED 
(
	[n_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[record]    Script Date: 2022/9/1 上午 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[record](
	[r_id] [int] IDENTITY(1,1) NOT NULL,
	[r_date] [datetime] NULL,
	[r_text] [varchar](255) NULL,
	[r_account] [varchar](255) NULL,
	[r_name] [varchar](255) NULL,
	[r_ip] [varchar](255) NULL,
 CONSTRAINT [PK_record] PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2022/9/1 上午 10:29:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_account] [varchar](255) NULL,
	[u_password] [varchar](255) NULL,
	[u_name] [varchar](255) NULL,
	[u_main_purview] [varchar](10) NULL,
	[u_sub_purview] [varchar](10) NULL,
	[u_check] [varchar](10) NULL,
	[u_error] [int] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[document] ON 

INSERT [dbo].[document] ([d_id], [d_text]) VALUES (1, N'資安通報')
INSERT [dbo].[document] ([d_id], [d_text]) VALUES (2, N'')
INSERT [dbo].[document] ([d_id], [d_text]) VALUES (3, N'')
INSERT [dbo].[document] ([d_id], [d_text]) VALUES (4, N'資安通報')
INSERT [dbo].[document] ([d_id], [d_text]) VALUES (5, N'資安通報')
INSERT [dbo].[document] ([d_id], [d_text]) VALUES (6, N'資安通報')
INSERT [dbo].[document] ([d_id], [d_text]) VALUES (7, N'　')
INSERT [dbo].[document] ([d_id], [d_text]) VALUES (8, N'')
SET IDENTITY_INSERT [dbo].[document] OFF
GO
INSERT [dbo].[menu] ([m_id], [m_type], [m_name], [m_url], [m_icon_sidebar], [m_icon_index], [m_main_purview], [m_sub_purview]) VALUES (N'011', N'root', N'最新消息管理', N'n_class.php', N'fa fa-newspaper-o', N'fa fa-newspaper-o', N'2', N'0')
GO
SET IDENTITY_INSERT [dbo].[n_class] ON 

INSERT [dbo].[n_class] ([nc_id], [nc_title], [nc_order]) VALUES (1, N'每日資安新聞', 6)
INSERT [dbo].[n_class] ([nc_id], [nc_title], [nc_order]) VALUES (2, N'停機公告', 5)
INSERT [dbo].[n_class] ([nc_id], [nc_title], [nc_order]) VALUES (3, N'作業規定', 4)
INSERT [dbo].[n_class] ([nc_id], [nc_title], [nc_order]) VALUES (4, N'資安檢測', 3)
INSERT [dbo].[n_class] ([nc_id], [nc_title], [nc_order]) VALUES (5, N'國際資安', 2)
INSERT [dbo].[n_class] ([nc_id], [nc_title], [nc_order]) VALUES (7, N'一級督(輔)導', 1)
SET IDENTITY_INSERT [dbo].[n_class] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([n_id], [n_title], [n_keyword], [nc_id], [n_area], [n_date], [n_stext], [n_source], [n_suggest], [n_unit], [n_name], [n_order]) VALUES (1, N'全球約六分之一組織成為SpringShell攻擊目標', N'#漏洞 #駭客攻 #Spring框架 #惡意檔案', 5, N'台中市', CAST(N'2022-04-06' AS Date), N'&lt;p&gt;近期全球約六分之一組織受Spring4Shell零時差漏洞影響成為駭客攻擊目標，根據Check Point之說法，3月31日至4月2日期間即偵測出高達37,000次Spring4Shell攻擊。&lt;/p&gt;

&lt;p&gt;受影響最大之行業為軟體供應商，占總數28%，至於受影響地區，20%位於歐洲，北美地區亦占11%。同時VMware與Microsoft之產品亦受影響，因而發布安全性更新與提供建議措施。&lt;/p&gt;

&lt;p&gt;在Spring公司公告漏洞不到1天後，殭屍網路程式Mirai即藉由Spring4Shell漏洞感染IoT裝置。趨勢科技於4月初觀測到SpringShell漏洞之開採活動，駭客將Mirai下載到IoT裝置之/tmp資料夾，利用chmod指令變更權限後執行，另亦於網路上發現惡意檔案伺服器，內含針對不同CPU架構設計之其他Mirai變種程式。&lt;/p&gt;

&lt;p&gt;目前，Spring開發組織已針對SpringShell與另2個發生於Spring框架之漏洞釋出修補程式。&lt;/p&gt;
', N'&lt;p&gt;一、&lt;a href=&quot;https://www.bleepingcomputer.com/news/security/springshell-attacks-target-about-one-in-six-vulnerable-orgs/&quot;&gt;https://www.bleepingcomputer.com/news/security/springshell-attacks-target-about-one-in-six-vulnerable-orgs/&lt;/a&gt;&lt;br /&gt;
二、&lt;a href=&quot;https://www.trendmicro.com/en_us/research/22/d/cve-2022-22965-analyzing-the-exploitation-of-spring4shell-vulner.html&quot;&gt;https://www.trendmicro.com/en_us/research/22/d/cve-2022-22965-analyzing-the-exploitation-of-spring4shell-vulner.html&lt;/a&gt;&lt;/p&gt;
', N'', N'技術服務中心', N'洪子揚輔導長', 1)
INSERT [dbo].[news] ([n_id], [n_title], [n_keyword], [nc_id], [n_area], [n_date], [n_stext], [n_source], [n_suggest], [n_unit], [n_name], [n_order]) VALUES (2, N'Mars Stealer惡意軟體潛藏於Google上之OpenOffice廣告', N'#Google #資料竊取 #惡意軟體 #暗網', 5, N'新北市', CAST(N'2022-05-09' AS Date), N'&lt;p&gt;Mars Stealer資料竊取惡意軟體近期於駭客論壇越來越受歡迎，起因為Raccoon Stealer惡意軟體受俄烏戰爭影響而停止維運，Mars Stealer運作方式與Raccoon相似，成為駭客之替代方案。&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Morphisec研究人員發現Mars Stealer利用Google Ads，於加拿大之搜尋結果放置假冒OpenOffice網頁之惡意網址，因其位於Google搜尋結果之第一位，將誘導使用者點選並下載惡意軟體。該惡意軟體實際上為Mars Stealer之執行檔加上Babadeda加密程式或Autoit載入程式，使用者將不自覺被感染，且個人資料遭竊取，包括瀏覽器自動填入資料、瀏覽器擴充資料、信用卡資料、IP位置、國家代碼及時區等資料。此外，Morphisec表示被盜最多之瀏覽器擴充程式為MetaMask，其次為Coinbase Wallet、Binance Wallet及Math錢包，都是用於管理加密貨幣之錢包。&lt;/p&gt;
', N'&lt;p&gt;一、&lt;a href=&quot;https://www.bleepingcomputer.com/news/security/&quot;&gt;https://www.bleepingcomputer.com/news/security/&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;二、&lt;a href=&quot;https://www.irs.gov/newsroom/security/&quot;&gt;https://www.irs.gov/newsroom/security/&lt;/a&gt;&lt;/p&gt;
', N'&lt;p&gt;Mars Stealer資料竊取惡意軟體近期於駭客論壇越來越受歡迎，起因為Raccoon Stealer惡意軟體受俄烏戰爭影響而停止維運，Mars Stealer運作方式與Raccoon相似，成為駭客之替代方案。&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Morphisec研究人員發現Mars Stealer利用Google Ads，於加拿大之搜尋結果放置假冒OpenOffice網頁之惡意網址，因其位於Google搜尋結果之第一位，將誘導使用者點選並下載惡意軟體。該惡意軟體實際上為Mars Stealer之執行檔加上Babadeda加密程式或Autoit載入程式，使用者將不自覺被感染，且個人資料遭竊取，包括瀏覽器自動填入資料、瀏覽器擴充資料、信用卡資料、IP位置、國家代碼及時區等資料。此外，Morphisec表示被盜最多之瀏覽器擴充程式為MetaMask，其次為Coinbase Wallet、Binance Wallet及Math錢包，都是用於管理加密貨幣之錢包。&lt;/p&gt;
', N'技術服務中心', N'陳玉佩士官長', 2)
INSERT [dbo].[news] ([n_id], [n_title], [n_keyword], [nc_id], [n_area], [n_date], [n_stext], [n_source], [n_suggest], [n_unit], [n_name], [n_order]) VALUES (3, N'資安等級說明', N'#資通安全 #分級辦法 #公務機密', 4, N'台北市', CAST(N'2021-02-24' AS Date), N'&lt;p&gt;一、通過本會106年3月3日公告「智慧型手機系統內建軟體資通安全檢測技術規範」（111年2月23日已公告停止適用）取得舊版本ESS認證標章者&lt;/p&gt;

&lt;p&gt;　　為因應不同使用者購買智慧型手機之價位考量及資安防護需求，智慧型手機系統內建軟體資安認證依上揭本會公告之技術規範分為初、中、高三個等級。取得初級認證之智慧型手機，表示已具備防護個人隱私等敏感性資料之能力；取得中級認證者，除敏感性資料外，對於其他資料之使用、儲存及傳輸，也提供了安全防護機制；取得高級認證者，則表示提供核心底層資訊不被竄改或被不正當擷取之能力。手機製造商等申請者可依手機的市場定位及資安防護強度等需求，自行規劃提出申請之智慧型手機系統內建軟體資安檢測及認證等級。&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;　　消費者則可由ESS認證標章上的星星數量，確認該款智慧型手機通過之資安認證等級。例如：3顆星表示該手機之資安防護等級已達高級。&lt;/p&gt;

&lt;p&gt;　　惟各個廠牌不同智慧型手機之系統內建軟體數量均不同，且有版本更新情形，消費者除了檢視ESS認證標章外，尚須至「&lt;a href=&quot;https://ess.org.tw/ess_cert_list.html&quot; title=&quot;ESS認證合格手機列表&quot;&gt;智慧型手機系統內建軟體資通安全檢測&lt;/a&gt;」網站審視該款手機取得ESS認證標章之證書內容，並下載軟體摘要表比對手機內顯示各個系統內建軟體之版本均相符，以確認其ESS認證標章有效性。&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;二、通過台灣資通產業標準協會公告之智慧型手機系統內建軟體資安測試規範取得新版本ESS認證標章者&lt;/p&gt;

&lt;p&gt;　　本會考量手機功能日新月異，為確保消費者智慧型手機出廠之安全性，因應不同使用者購買智慧型手機之價位考量及資安防護需求，已請台灣資通產業標準協會制定產業標準，於110年1月公告「TAICS TS-0030 v1.0-智慧型手機系統內建軟體資安測試規範」。該規範之智慧型手機系統內建軟體資安認證，其安全等級依敏感性資料相關保護、惡意攻擊與核心底層不被竄改或不正當擷取資訊等要求，分成1級、2級、3級三個等級，安全等級越高代表安全性越佳。&lt;/p&gt;

&lt;p&gt;　　取得1級認證之智慧型手機，表示已具備防護個人隱私等敏感性資料之保護儲存方式、通訊傳輸加密機制、手機系統功能與內建軟體權限檢查，確保使用者在安全環境下防止資料洩漏；取得2級認證者，除敏感性資料之保護外，亦防止內建軟體私下傳送資料，或被惡意攻擊導致無法使用或資料外洩；取得3級認證者，為確保智慧型手機之核心底層不被竄改或不正當地擷取資訊，除須符合1級與2級所有安全要求外，並增加手機設計相關安全文件審查之安全要求、檢測信任執行環境、應用程式具備手機完整性判斷機制與付費功能多因子或強驗證。手機製造商等申請者可依手機的市場定位及資安防護強度等需求，自行規劃提出申請之系統內建軟體資安檢測及認證等級。&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;　　消費者並可由ESS認證標章上的星星數量，確認該款智慧型手機通過之資安認證等級。例如：3顆星表示該手機之資安防護等級已達3級。&lt;/p&gt;

&lt;p&gt;　　惟亦同上所述，消費者除了檢視ESS認證標章外，尚須至「&lt;a href=&quot;https://ess.org.tw/ess_cert_list.html&quot; target=&quot;_blank&quot; title=&quot;ESS認證合格手機列表 開新視窗&quot;&gt;智慧型手機系統內建軟體資通安全檢測&lt;/a&gt;」網站審視該款手機取得ESS認證標章之證書內容，並下載軟體摘要表比對手機內顯示各個系統內建軟體之版本均相符，以確認其ESS認證標章有效性。&lt;/p&gt;
', N'&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/upload/images/DSC-284.jpg&quot; style=&quot;height:1067px; width:1600px&quot; /&gt;&lt;/p&gt;
', N'', N'技術服務中心', N'洪子揚輔導長', 0)
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[record] ON 

INSERT [dbo].[record] ([r_id], [r_date], [r_text], [r_account], [r_name], [r_ip]) VALUES (1, CAST(N'2022-09-01T10:28:46.127' AS DateTime), N'登入', N'MAK_supervisor', N'源做總管理者', N'::1')
INSERT [dbo].[record] ([r_id], [r_date], [r_text], [r_account], [r_name], [r_ip]) VALUES (2, CAST(N'2022-09-01T10:28:59.057' AS DateTime), N'user 資料修改：2', N'MAK_supervisor', N'源做總管理者', N'::1')
SET IDENTITY_INSERT [dbo].[record] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([u_id], [u_account], [u_password], [u_name], [u_main_purview], [u_sub_purview], [u_check], [u_error]) VALUES (1, N'MAK_supervisor', N'16d7a4fca7442dda3ad93c9a726597e4', N'源做總管理者', N'0', N'0', N'Y', 0)
INSERT [dbo].[user] ([u_id], [u_account], [u_password], [u_name], [u_main_purview], [u_sub_purview], [u_check], [u_error]) VALUES (2, N'mnd_admin', N'c93ccd78b2076528346216b3b2f701e6', N'【資安通報】管理者', N'1', N'0', N'Y', 0)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD FOREIGN KEY([nc_id])
REFERENCES [dbo].[n_class] ([nc_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [mnd] SET  READ_WRITE 
GO
