USE [master]
GO
/****** Object:  Database [Igora]    Script Date: 26.05.2025 22:05:22 ******/
CREATE DATABASE [Igora]
GO
ALTER DATABASE [Igora] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Igora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Igora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Igora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Igora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Igora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Igora] SET ARITHABORT OFF 
GO
ALTER DATABASE [Igora] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Igora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Igora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Igora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Igora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Igora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Igora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Igora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Igora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Igora] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Igora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Igora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Igora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Igora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Igora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Igora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Igora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Igora] SET RECOVERY FULL 
GO
ALTER DATABASE [Igora] SET  MULTI_USER 
GO
ALTER DATABASE [Igora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Igora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Igora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Igora] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Igora] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Igora] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Igora] SET QUERY_STORE = ON
GO
ALTER DATABASE [Igora] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Igora]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[PassportDataId] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[OrderCode] [char](16) NOT NULL,
	[DataCreate] [date] NOT NULL,
	[ClientCode] [varchar](10) NOT NULL,
	[StatusId] [int] NOT NULL,
	[DateClose] [date] NULL,
	[RentalPeriod] [time](0) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Services]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Services](
	[OrderId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_Order_Services] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassportData]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassportData](
	[Id] [int] NOT NULL,
	[Number] [char](4) NOT NULL,
	[Serial] [char](6) NOT NULL,
 CONSTRAINT [PK_PassportData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](11) NOT NULL,
	[PricePerHour] [money] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeLogin]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeLogin](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.05.2025 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[TypeLogin] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Фролов Андрей Иванович', N'45462526', 1, CAST(N'2001-07-14' AS Date), N'344288, г. Санкт-Петербург, ул. Чехова, 1, кв. 34', N'gohufreilagrau-3818@yopmail.com', N'cl12345')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Николаев Даниил Всеволодович', N'45462527', 2, CAST(N'2001-02-10' AS Date), N'614164, г. Санкт-Петербург, ул. Степная, 30, кв. 75', N'xawugosune-1385@yopmail.com', N'cl12346')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Снегирев Макар Иванович', N'45462528', 3, CAST(N'1998-05-21' AS Date), N'394242, г. Санкт-Петербург, ул. Коммунистическая, 43, кв. 57', N'satrahuddusei-4458@yopmail.com', N'cl12347')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Иванов Иван Ильич', N'45462529', 4, CAST(N'1998-10-01' AS Date), N'660540, г. Санкт-Петербург, ул. Солнечная, 25, кв. 78', N'boippaxeufrepra-7093@yopmail.com', N'cl12348')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Филиппова Анна Глебовна', N'45462530', 5, CAST(N'1976-05-31' AS Date), N'125837, г. Санкт-Петербург, ул. Шоссейная, 40, кв. 92', N'zapramaxesu-7741@yopmail.com', N'cl12349')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Иванов Михаил Владимирович', N'45462531', 6, CAST(N'1985-11-04' AS Date), N'125703, г. Санкт-Петербург, ул. Партизанская, 49, кв. 84', N'rouzecroummegre-3899@yopmail.com', N'cl12350')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Власов Дмитрий Александрович', N'45462532', 7, CAST(N'1998-08-17' AS Date), N'625283, г. Санкт-Петербург, ул. Победы, 46, кв. 7', N'ziyeuddocrabri-4748@yopmail.com', N'cl12351')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Серова Екатерина Львовна', N'45462533', 8, CAST(N'1984-10-24' AS Date), N'614611, г. Санкт-Петербург, ул. Молодежная, 50, кв. 78', N'ketameissoinnei-1951@yopmail.com', N'cl12352')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Борисова Ирина Ивановна', N'45462534', 9, CAST(N'1976-10-14' AS Date), N'454311, г. Санкт-Петербург, ул. Новая, 19, кв. 78', N'yipraubaponou-5849@yopmail.com', N'cl12353')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Зайцев Никита Артёмович', N'45462535', 10, CAST(N'1999-10-14' AS Date), N'660007, г. Санкт-Петербург, ул. Октябрьская, 19, кв. 42', N'crapedocouca-3572@yopmail.com', N'cl12354')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Медведев Святослав Евгеньевич', N'45462536', 11, CAST(N'1985-07-13' AS Date), N'603036, г. Санкт-Петербург, ул. Садовая, 4, кв. 13', N'ceigoixakaunni-9227@yopmail.com', N'cl12355')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Коротков Кирилл Алексеевич', N'45462537', 12, CAST(N'1976-05-26' AS Date), N'450983, г. Санкт-Петербург, ул. Комсомольская, 26, кв. 60', N'yeimmeiwauzomo-7054@yopmail.com', N'cl12356')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Калашникова Арина Максимовна', N'45462538', 13, CAST(N'1999-08-13' AS Date), N'394782, г. Санкт-Петербург, ул. Чехова, 3, кв. 14', N'poleifenevi-1560@yopmail.com', N'cl12357')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Минина Таисия Кирилловна', N'45462539', 14, CAST(N'1985-10-13' AS Date), N'603002, г. Санкт-Петербург, ул. Дзержинского, 28, кв. 56', N'kauprezofautei-6607@yopmail.com', N'cl12358')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Наумов Серафим Романович', N'45462540', 15, CAST(N'1999-04-15' AS Date), N'450558, г. Санкт-Петербург, ул. Набережная, 30, кв. 71', N'quaffaullelourei-1667@yopmail.com', N'cl12359')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Воробьева Василиса Евгеньевна', N'45462541', 16, CAST(N'1999-01-13' AS Date), N'394060, г. Санкт-Петербург, ул. Фрунзе, 43, кв. 79', N'jsteele@rojas-robinson.net', N'cl12360')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Калинин Александр Андреевич', N'45462542', 17, CAST(N'1999-01-07' AS Date), N'410661, г. Санкт-Петербург, ул. Школьная, 50, кв. 53', N'vhopkins@lewis-mullen.com', N'cl12361')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Кузнецова Милана Владиславовна', N'45462543', 18, CAST(N'1999-01-24' AS Date), N'625590, г. Санкт-Петербург, ул. Коммунистическая, 20, кв. 34', N'nlewis@yahoo.com', N'cl12362')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Фирсов Егор Романович', N'45462544', 19, CAST(N'1993-09-02' AS Date), N'625683, г. Санкт-Петербург, ул. 8 Марта, 20, кв. 21', N'garciadavid@mckinney-mcbride.com', N'cl12363')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Зимина Агния Александровна', N'45462545', 20, CAST(N'1998-09-03' AS Date), N'400562, г. Санкт-Петербург, ул. Зеленая, 32, кв. 67', N'cbradley@castro.com', N'cl12364')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Титов Андрей Глебович', N'45462546', 21, CAST(N'1985-10-23' AS Date), N'614510, г. Санкт-Петербург, ул. Маяковского, 47, кв. 72', N'cuevascatherine@carlson.biz', N'cl12365')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Орлов Николай Егорович', N'45462547', 22, CAST(N'1985-07-27' AS Date), N'410542, г. Санкт-Петербург, ул. Светлая, 46, кв. 82', N'thomasmoore@wilson-singh.net', N'cl12366')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Кузнецова Аиша Михайловна', N'45462548', 23, CAST(N'1998-10-04' AS Date), N'620839, г. Санкт-Петербург, ул. Цветочная, 8, кв. 100', N'jessica84@hotmail.com', N'cl12367')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Куликов Никита Георгиевич', N'45462549', 24, CAST(N'1999-04-23' AS Date), N'443890, г. Санкт-Петербург, ул. Коммунистическая, 1, кв. 10', N'jessicapark@hotmail.com', N'cl12368')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Карпова София Егоровна', N'45462550', 25, CAST(N'1993-10-01' AS Date), N'603379, г. Санкт-Петербург, ул. Спортивная, 46, кв. 95', N'ginaritter@schneider-buchanan.com', N'cl12369')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Смирнова Дарья Макаровна', N'45462551', 26, CAST(N'1976-03-22' AS Date), N'603721, г. Санкт-Петербург, ул. Гоголя, 41, кв. 57', N'stephen99@yahoo.com', N'cl12370')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Абрамова Александра Мироновна', N'45462552', 27, CAST(N'1999-03-26' AS Date), N'410172, г. Санкт-Петербург, ул. Северная, 13, кв. 86', N'lopezlisa@hotmail.com', N'cl12371')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Наумов Руслан Михайлович', N'45462553', 28, CAST(N'1999-10-11' AS Date), N'420151, г. Санкт-Петербург, ул. Вишневая, 32, кв. 81', N'lori17@hotmail.com', N'cl12372')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Бочаров Никита Матвеевич', N'45462554', 29, CAST(N'1997-06-29' AS Date), N'125061, г. Санкт-Петербург, ул. Подгорная, 8, кв. 74', N'campbellkevin@gardner.com', N'cl12373')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Соловьев Давид Ильич', N'45462555', 30, CAST(N'1984-03-06' AS Date), N'630370, г. Санкт-Петербург, ул. Шоссейная, 24, кв. 81', N'morganhoward@clark.com', N'cl12374')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Васильева Валерия Дмитриевна', N'45462556', 31, CAST(N'1999-09-30' AS Date), N'614753, г. Санкт-Петербург, ул. Полевая, 35, кв. 39', N'carsontamara@gmail.com', N'cl12375')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Макарова Василиса Андреевна', N'45462557', 32, CAST(N'1999-04-08' AS Date), N'426030, г. Санкт-Петербург, ул. Маяковского, 44, кв. 93', N'kevinpatel@gmail.com', N'cl12376')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Алексеев Матвей Викторович', N'45462558', 33, CAST(N'1998-08-02' AS Date), N'450375, г. Санкт-Петербург, ул. Клубная, 44, кв. 80', N'sethbishop@yahoo.com', N'cl12377')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Никитина Полина Александровна', N'45462559', 34, CAST(N'1976-09-19' AS Date), N'625560, г. Санкт-Петербург, ул. Некрасова, 12, кв. 66', N'drollins@schultz-soto.net', N'cl12378')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Окулова Олеся Алексеевна', N'45462560', 35, CAST(N'1999-04-03' AS Date), N'630201, г. Санкт-Петербург, ул. Комсомольская, 17, кв. 25', N'pblack@copeland-winters.org', N'cl12379')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Захарова Полина Яновна', N'45462561', 36, CAST(N'1976-04-21' AS Date), N'190949, г. Санкт-Петербург, ул. Мичурина, 26, кв. 93', N'johnathon.oberbrunner@yahoo.com', N'cl12380')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Зайцев Владимир Давидович', N'45462562', 37, CAST(N'1998-01-26' AS Date), N'350501, г. Санкт-Петербург, ул. Парковая, 2, кв. 7', N'bradly29@gmail.com', N'cl12381')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Иванов Виталий Даниилович', N'45462563', 38, CAST(N'1976-08-11' AS Date), N'450048, г. Санкт-Петербург, ул. Коммунистическая, 21, кв. 3', N'stark.cristina@hilpert.biz', N'cl12382')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Захаров Матвей Романович', N'45462564', 39, CAST(N'1993-07-12' AS Date), N'644921, г. Санкт-Петербург, ул. Школьная, 46, кв. 37', N'bruen.eleanore@yahoo.com', N'cl12383')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Иванов Степан Степанович', N'45462565', 40, CAST(N'1998-09-19' AS Date), N'614228, г. Санкт-Петербург, ул. Дорожная, 36, кв. 54', N'percival.halvorson@yahoo.com', N'cl12384')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Ткачева Милана Тимуровна', N'45462566', 41, CAST(N'1998-05-24' AS Date), N'350940, г. Санкт-Петербург, ул. Первомайская, 23, кв. 2', N'javonte71@kuhlman.biz', N'cl12385')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Семенов Даниил Иванович', N'45462567', 42, CAST(N'1976-01-04' AS Date), N'344990, г. Санкт-Петербург, ул. Красноармейская, 19, кв. 92', N'vconnelly@kautzer.com', N'cl12386')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Виноградов Вячеслав Дмитриевич', N'45462568', 43, CAST(N'1976-07-12' AS Date), N'410248, г. Санкт-Петербург, ул. Чкалова, 11, кв. 75', N'anabelle07@schultz.info', N'cl12387')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Соболева Николь Фёдоровна', N'45462569', 44, CAST(N'1976-05-02' AS Date), N'400839, г. Санкт-Петербург, ул. 8 Марта, 46, кв. 44', N'nitzsche.katlynn@yahoo.com', N'cl12388')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Тихонова Анна Львовна', N'45462570', 45, CAST(N'1985-03-23' AS Date), N'450539, г. Санкт-Петербург, ул. Заводская, 3, кв. 81', N'corine16@von.com', N'cl12389')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Кузнецова Ульяна Савельевна', N'45462571', 46, CAST(N'1999-06-03' AS Date), N'614591, г. Санкт-Петербург, ул. Цветочная, 20, кв. 40', N'otha.wisozk@lubowitz.org', N'cl12390')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Смирнова Анна Германовна', N'45462572', 47, CAST(N'1997-07-18' AS Date), N'400260, г. Санкт-Петербург, ул. Больничная, 30, кв. 53', N'may.kirlin@hotmail.com', N'cl12391')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Черепанова Анна Давидовна', N'45462573', 48, CAST(N'1985-11-06' AS Date), N'660924, г. Санкт-Петербург, ул. Молодежная, 32, кв. 59', N'bryana.kautzer@yahoo.com', N'cl12392')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Григорьев Максим Кириллович', N'45462574', 49, CAST(N'1999-05-26' AS Date), N'644133, г. Санкт-Петербург, ул. Гагарина, 28, кв. 69', N'deborah.christiansen@quigley.biz', N'cl12393')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Голубев Даниэль Александрович', N'45462575', 50, CAST(N'1999-06-14' AS Date), N'450698, г. Санкт-Петербург, ул. Вокзальная, 14, кв. 37', N'connelly.makayla@yahoo.com', N'cl12394')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Миронов Юрий Денисович', N'45462576', 51, CAST(N'1985-01-26' AS Date), N'620653, г. Санкт-Петербург, ул. Западная, 15, кв. 25', N'tatum.collins@fay.org', N'cl12395')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Терехов Михаил Андреевич', N'45462577', 52, CAST(N'1976-07-06' AS Date), N'644321, г. Санкт-Петербург, ул. Клубная, 32, кв. 10', N'itzel73@anderson.com', N'cl12396')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Орлова Алиса Михайловна', N'45462578', 53, CAST(N'1997-02-24' AS Date), N'603653, г. Санкт-Петербург, ул. Молодежная, 2, кв. 45', N'arjun39@hotmail.com', N'cl12397')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Кулаков Константин Даниилович', N'45462579', 54, CAST(N'1993-06-20' AS Date), N'410181, г. Санкт-Петербург, ул. Механизаторов, 16, кв. 74', N'ohara.rebeka@yahoo.com', N'cl12398')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Кудрявцев Максим Романович', N'45462580', 55, CAST(N'1998-05-10' AS Date), N'394207, г. Санкт-Петербург, ул. Свердлова, 31, кв. 28', N'danika58@rath.com', N'cl12399')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Соболева Кира Фёдоровна', N'45462581', 56, CAST(N'1998-03-14' AS Date), N'420633, г. Санкт-Петербург, ул. Матросова, 18, кв. 41', N'janae.bogan@gmail.com', N'cl12400')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Коновалов Арсений Максимович', N'45462582', 57, CAST(N'1985-02-18' AS Date), N'445720, г. Санкт-Петербург, ул. Матросова, 50, кв. 67', N'vern91@yahoo.com', N'cl12401')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Гусев Михаил Дмитриевич', N'45462583', 58, CAST(N'1999-11-23' AS Date), N'400646, г. Санкт-Петербург, ул. Октябрьская, 47, кв. 65', N'mariana.leannon@larkin.net', N'cl12402')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Суханова Варвара Матвеевна', N'45462584', 59, CAST(N'1993-09-13' AS Date), N'644410, г. Санкт-Петербург, ул. Красная, 17, кв. 69', N'vmoore@gmail.com', N'cl12403')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Орлова Ясмина Васильевна', N'45462585', 60, CAST(N'1984-06-24' AS Date), N'400750, г. Санкт-Петербург, ул. Школьная, 36, кв. 71', N'damon.mcclure@mills.com', N'cl12404')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Васильева Ксения Константиновна', N'45462586', 61, CAST(N'1999-08-01' AS Date), N'660590, г. Санкт-Петербург, ул. Дачная, 37, кв. 70', N'grady.reilly@block.com', N'cl12405')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Борисова Тамара Данииловна', N'45462587', 62, CAST(N'1993-05-29' AS Date), N'426083, г. Санкт-Петербург, ул. Механизаторов, 41, кв. 26', N'boyd.koss@yahoo.com', N'cl12406')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Дмитриев Мирон Ильич', N'45462588', 63, CAST(N'1985-04-13' AS Date), N'410569, г. Санкт-Петербург, ул. Парковая, 36, кв. 17', N'obartell@franecki.info', N'cl12407')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Лебедева Анна Александровна', N'45462589', 64, CAST(N'1985-03-30' AS Date), N'443375, г. Санкт-Петербург, ул. Дзержинского, 50, кв. 95', N'reina75@ferry.net', N'cl12408')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Пономарев Артём Маркович', N'45462590', 65, CAST(N'1984-06-02' AS Date), N'614316, г. Санкт-Петербург, ул. Первомайская, 48, кв. 31', N'karson28@hotmail.com', N'cl12409')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Борисова Елена Михайловна', N'45462591', 66, CAST(N'1976-05-23' AS Date), N'445685, г. Санкт-Петербург, ул. Зеленая, 7, кв. 47', N'damaris61@okon.com', N'cl12410')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Моисеев Камиль Максимович', N'45462592', 67, CAST(N'1999-06-17' AS Date), N'614505, г. Санкт-Петербург, ул. Нагорная, 37, кв. 31', N'carroll.jerod@hotmail.com', N'cl12411')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Герасимова Дарья Константиновна', N'45462593', 68, CAST(N'1984-10-13' AS Date), N'426629, г. Санкт-Петербург, ул. Весенняя, 32, кв. 46', N'ron.treutel@quitzon.com', N'cl12412')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Михайлова Мария Марковна', N'45462594', 69, CAST(N'1976-12-02' AS Date), N'603743, г. Санкт-Петербург, ул. Матросова, 19, кв. 20', N'olen79@yahoo.com', N'cl12413')
GO
INSERT [dbo].[Clients] ([Name], [Code], [PassportDataId], [Birthday], [Address], [Email], [Password]) VALUES (N'Коршунов Кирилл Максимович', N'45462595', 70, CAST(N'1985-05-22' AS Date), N'450750, г. Санкт-Петербург, ул. Клубная, 23, кв. 90', N'pacocha.robbie@yahoo.com', N'cl12414')
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (1, N'4546252612032022', CAST(N'2022-03-12' AS Date), N'45462526', 1, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (2, N'4546252713032022', CAST(N'2022-03-13' AS Date), N'45462527', 2, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (3, N'4546252814032022', CAST(N'2022-03-14' AS Date), N'45462528', 2, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (4, N'4546252915032022', CAST(N'2022-03-15' AS Date), N'45462529', 1, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (5, N'4546253016032022', CAST(N'2022-03-16' AS Date), N'45462530', 3, CAST(N'2022-04-16' AS Date), CAST(N'05:20:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (6, N'4546253117032022', CAST(N'2022-03-17' AS Date), N'45462531', 1, NULL, CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (7, N'4546253218032022', CAST(N'2022-03-18' AS Date), N'45462532', 1, NULL, CAST(N'04:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (8, N'4546253319032022', CAST(N'2022-03-19' AS Date), N'45462533', 2, NULL, CAST(N'06:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (9, N'4546253420032022', CAST(N'2022-03-20' AS Date), N'45462534', 2, NULL, CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (10, N'4546253521032022', CAST(N'2022-03-21' AS Date), N'45462535', 1, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (11, N'4546253622032022', CAST(N'2022-03-22' AS Date), N'45462536', 3, CAST(N'2022-03-22' AS Date), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (12, N'4546253723032022', CAST(N'2022-03-23' AS Date), N'45462537', 2, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (13, N'4546253824032022', CAST(N'2022-03-24' AS Date), N'45462538', 2, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (14, N'4546253925032022', CAST(N'2022-03-25' AS Date), N'45462539', 2, NULL, CAST(N'05:20:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (15, N'4546254026032022', CAST(N'2022-03-26' AS Date), N'45462540', 3, CAST(N'2022-04-26' AS Date), CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (16, N'4546254127032022', CAST(N'2022-03-27' AS Date), N'45462541', 1, NULL, CAST(N'04:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (17, N'4546254228032022', CAST(N'2022-03-28' AS Date), N'45462542', 2, NULL, CAST(N'06:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (18, N'4546254329032022', CAST(N'2022-03-29' AS Date), N'45462543', 2, NULL, CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (19, N'4546254430032022', CAST(N'2022-03-30' AS Date), N'45462544', 1, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (20, N'4546254531032022', CAST(N'2022-03-31' AS Date), N'45462545', 1, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (21, N'4546254601042022', CAST(N'2022-04-01' AS Date), N'45462546', 3, CAST(N'2022-04-01' AS Date), CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (22, N'4546254702042022', CAST(N'2022-04-02' AS Date), N'45462547', 1, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (23, N'4546254803042022', CAST(N'2022-04-03' AS Date), N'45462548', 1, NULL, CAST(N'05:20:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (24, N'4546254904042022', CAST(N'2022-04-04' AS Date), N'45462549', 2, NULL, CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (25, N'4546255005042022', CAST(N'2022-04-05' AS Date), N'45462550', 2, NULL, CAST(N'04:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (26, N'4546255106042022', CAST(N'2022-04-06' AS Date), N'45462551', 2, NULL, CAST(N'06:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (27, N'4546255207042022', CAST(N'2022-04-07' AS Date), N'45462552', 2, NULL, CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (28, N'4546255308042022', CAST(N'2022-04-08' AS Date), N'45462553', 3, CAST(N'2022-04-08' AS Date), CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (29, N'4546255409042022', CAST(N'2022-04-09' AS Date), N'45462554', 1, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (30, N'4546255510042022', CAST(N'2022-04-10' AS Date), N'45462555', 2, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (31, N'4546255611042022', CAST(N'2022-04-11' AS Date), N'45462556', 2, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (32, N'4546255712042022', CAST(N'2022-04-12' AS Date), N'45462557', 1, NULL, CAST(N'05:20:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (33, N'4546255813042022', CAST(N'2022-04-13' AS Date), N'45462558', 1, NULL, CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (34, N'4546255914042022', CAST(N'2022-04-14' AS Date), N'45462559', 1, NULL, CAST(N'04:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (35, N'4546256015042022', CAST(N'2022-04-15' AS Date), N'45462560', 2, NULL, CAST(N'06:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (36, N'4546256102042022', CAST(N'2022-04-02' AS Date), N'45462561', 2, NULL, CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (37, N'4546256203042022', CAST(N'2022-04-03' AS Date), N'45462562', 2, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (38, N'4546256304042022', CAST(N'2022-04-04' AS Date), N'45462563', 3, CAST(N'2022-04-04' AS Date), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (39, N'4546256405042022', CAST(N'2022-04-05' AS Date), N'45462564', 2, NULL, CAST(N'02:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (40, N'4546256506042022', CAST(N'2022-04-06' AS Date), N'45462565', 1, NULL, CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (41, N'4546256607042022', CAST(N'2022-04-07' AS Date), N'45462566', 3, CAST(N'2022-04-07' AS Date), CAST(N'05:20:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (42, N'4546256708042022', CAST(N'2022-04-08' AS Date), N'45462567', 2, NULL, CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (43, N'4546256809042022', CAST(N'2022-04-09' AS Date), N'45462568', 2, NULL, CAST(N'04:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (44, N'4546256901042022', CAST(N'2022-04-01' AS Date), N'45462569', 2, NULL, CAST(N'06:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (45, N'4546257002042022', CAST(N'2022-04-02' AS Date), N'45462570', 2, NULL, CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (46, N'4546257103042022', CAST(N'2022-04-03' AS Date), N'45462571', 2, NULL, CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (47, N'4546257204042022', CAST(N'2022-04-04' AS Date), N'45462572', 3, CAST(N'2022-04-04' AS Date), CAST(N'05:20:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (48, N'4546257305042022', CAST(N'2022-04-05' AS Date), N'45462573', 1, NULL, CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (49, N'4546257406042022', CAST(N'2022-04-06' AS Date), N'45462574', 1, NULL, CAST(N'04:00:00' AS Time))
GO
INSERT [dbo].[Order] ([Id], [OrderCode], [DataCreate], [ClientCode], [StatusId], [DateClose], [RentalPeriod]) VALUES (50, N'4546257507042022', CAST(N'2022-04-07' AS Date), N'45462575', 1, NULL, CAST(N'06:00:00' AS Time))
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (1, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (1, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (1, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (1, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (2, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (2, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (2, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (2, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (2, 123)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (3, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (3, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (3, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (3, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (4, 44)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (4, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (4, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (4, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (4, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (5, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (5, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (5, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (5, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (5, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (5, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (6, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (6, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (6, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (7, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (7, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (7, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (7, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (8, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (8, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (8, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (8, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (9, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (9, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (9, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (9, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (10, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (10, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (10, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (10, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (10, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (11, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (11, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (11, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (12, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (12, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (12, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (12, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (13, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (13, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (13, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (14, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (14, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (14, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (14, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (15, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (15, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (15, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (15, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (15, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (16, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (16, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (16, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (17, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (17, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (17, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (17, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (18, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (18, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (18, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (19, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (19, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (19, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (19, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (20, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (20, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (20, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (20, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (20, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (21, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (21, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (21, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (22, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (22, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (22, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (22, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (23, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (23, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (23, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (24, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (24, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (24, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (24, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (25, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (25, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (25, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (25, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (25, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (26, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (26, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (26, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (27, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (27, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (27, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (27, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (28, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (28, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (28, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (29, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (29, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (29, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (29, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (30, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (30, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (30, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (30, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (30, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (31, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (31, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (31, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (32, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (32, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (32, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (32, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (33, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (33, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (33, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (34, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (34, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (34, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (34, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (35, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (35, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (35, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (35, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (35, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (36, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (36, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (36, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (37, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (37, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (37, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (37, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (38, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (38, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (38, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (39, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (39, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (39, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (39, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (40, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (40, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (40, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (40, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (40, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (41, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (41, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (41, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (42, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (42, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (42, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (42, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (43, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (43, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (43, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (44, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (44, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (44, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (44, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (45, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (45, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (45, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (45, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (45, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (46, 31)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (46, 34)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (46, 353)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (47, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (47, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (47, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (47, 99)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (48, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (48, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (48, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (49, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (49, 57)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (49, 88)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (49, 92)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (50, 45)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (50, 89)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (50, 98)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (50, 336)
GO
INSERT [dbo].[Order_Services] ([OrderId], [ServiceId]) VALUES (50, 353)
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (1, N'1180', N'176596')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (2, N'2280', N'223523')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (3, N'4560', N'354155')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (4, N'9120', N'554296')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (5, N'2367', N'558134')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (6, N'7101', N'669343')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (7, N'3455', N'719630')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (8, N'2377', N'871623')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (9, N'8755', N'921148')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (10, N'4355', N'104594')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (11, N'2791', N'114390')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (12, N'5582', N'126286')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (13, N'2978', N'133653')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (14, N'7512', N'141956')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (15, N'5046', N'158433')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (16, N'2460', N'169505')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (17, N'3412', N'174593')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (18, N'4950', N'183034')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (19, N'5829', N'219464')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (20, N'6443', N'208059')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (21, N'7079', N'213265')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (22, N'8207', N'522702')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (23, N'9307', N'232158')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (24, N'1357', N'242839')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (25, N'1167', N'256636')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (26, N'1768', N'266986')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (27, N'1710', N'427875')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (28, N'1806', N'289145')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (29, N'1587', N'291249')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (30, N'1647', N'306372')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (31, N'1742', N'316556')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (32, N'1474', N'326347')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (33, N'1452', N'339539')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (34, N'2077', N'443480')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (35, N'2147', N'357518')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (36, N'2687', N'363884')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (37, N'2376', N'443711')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (38, N'2568', N'386237')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (39, N'2556', N'439376')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (40, N'2737', N'407501')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (41, N'2581', N'441645')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (42, N'2675', N'427933')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (43, N'2967', N'434531')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (44, N'3070', N'449655')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (45, N'3108', N'451174')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (46, N'3250', N'464705')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (47, N'3392', N'471644')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (48, N'3497', N'487819')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (49, N'3560', N'491260')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (50, N'3620', N'506034')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (51, N'3774', N'511438')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (52, N'3862', N'521377')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (53, N'3084', N'535966')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (54, N'4021', N'541528')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (55, N'4109', N'554053')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (56, N'4537', N'564868')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (57, N'4914', N'572471')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (58, N'4445', N'581302')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (59, N'4743', N'598180')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (60, N'4741', N'601821')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (61, N'4783', N'612567')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (62, N'4658', N'621200')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (63, N'4908', N'634613')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (64, N'5092', N'642468')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (65, N'5155', N'465274')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (66, N'5086', N'666893')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (67, N'5333', N'675375')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (68, N'5493', N'684572')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (69, N'5150', N'696226')
GO
INSERT [dbo].[PassportData] ([Id], [Number], [Serial]) VALUES (70, N'1308', N'703305')
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (31, N'Прокат сноуборда', N'JUR8R', 1200.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (34, N'Прокат обуви для сноуборда', N'JKFBJ09
', 400.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (44, N'Прокат салазок', N'DHBGFY563
', 450.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (45, N'Прокат защитных подушек для сноубордистов', N'JFH7382
', 300.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (57, N'Подъем на 1 уровень', N'JHVSJF6
', 300.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (88, N'Подъем на 2  уровень', N'DJHGBS982
', 700.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (89, N'Прокат очков для лыжников', N'OIJNB12
', 150.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (92, N'Прокат санок', N'HJBUJE21J
', 300.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (98, N'Прокат шлема', N'63748HF
', 300.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (99, N'Прокат вартушки', N'BSFBHV63
', 100.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (123, N'Подъем на 3 уровень', N'638VVNQ3
', 1200.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (336, N'Прокат лыж', N'8HFJHG443', 800.0000)
GO
INSERT [dbo].[Services] ([Id], [Name], [Code], [PricePerHour]) VALUES (353, N'Прокат лыжных палок', N'87FDJKHJ', 100.0000)
GO
INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Новая')
GO
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'В прокате')
GO
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Закрыта')
GO
INSERT [dbo].[TypeLogin] ([Id], [Name]) VALUES (1, N'Успешно')
GO
INSERT [dbo].[TypeLogin] ([Id], [Name]) VALUES (2, N'Неуспешно')
GO
INSERT [dbo].[UserRole] ([Id], [Name]) VALUES (1, N'Администратор')
GO
INSERT [dbo].[UserRole] ([Id], [Name]) VALUES (2, N'Старший смены')
GO
INSERT [dbo].[UserRole] ([Id], [Name]) VALUES (3, N'Продавец')
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (101, N'Иванов Иван Иванович', 3, N'Ivanov@namecomp.ru', N'2L6KZG', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (102, N'Петров Петр Петрович', 3, N'petrov@namecomp.ru', N'uzWC67', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (103, N'Федоров Федор Федорович', 1, N'fedorov@namecomp.ru', N'8ntwUp', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (104, N'Миронов Вениамин Куприянович', 2, N'mironov@namecomp.ru', N'YOyhfR', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (105, N'Ширяев Ермолай Вениаминович', 2, N'shiryev@namecomp.ru', N'RSbvHv', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (106, N'Игнатов Кассиан Васильевич', 2, N'ignatov@namecomp.ru', N'rwVDh9', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (107, N'Хохлов Владимир Мэлсович', 3, N'hohlov@namecomp.ru', N'LdNyos', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (108, N'Стрелков Мстислав Георгьевич', 3, N'strelkov@namecomp.ru', N'gynQMT', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (109, N'Беляева Лилия Наумовна', 3, N'belyeva@@namecomp.ru', N'AtnDjr', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [RoleId], [Login], [Password], [LastLogin], [TypeLogin]) VALUES (110, N'Смирнова Ульяна Гордеевна', 3, N'smirnova@@namecomp.ru', N'JlFRCZ', CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1)
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_PassportData] FOREIGN KEY([PassportDataId])
REFERENCES [dbo].[PassportData] ([Id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_PassportData]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Clients] FOREIGN KEY([ClientCode])
REFERENCES [dbo].[Clients] ([Code])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Clients]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order_Services]  WITH CHECK ADD  CONSTRAINT [FK_Order_Services_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Order_Services] CHECK CONSTRAINT [FK_Order_Services_Order]
GO
ALTER TABLE [dbo].[Order_Services]  WITH CHECK ADD  CONSTRAINT [FK_Order_Services_Services] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[Order_Services] CHECK CONSTRAINT [FK_Order_Services_Services]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_TypeLogin] FOREIGN KEY([TypeLogin])
REFERENCES [dbo].[TypeLogin] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_TypeLogin]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRole] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRole]
GO
USE [master]
GO
ALTER DATABASE [Igora] SET  READ_WRITE 
GO
