SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT INTO [dbo].[Customer] ([id], [email], [password], [is_Admin], [name]) VALUES (3, N'nick@gm.com', N'123', 1, N'Nicolas ')
INSERT INTO [dbo].[Customer] ([id], [email], [password], [is_Admin], [name]) VALUES (4, N'sarah@out.com', N'123', 0, N'Sarah')
SET IDENTITY_INSERT [dbo].[Customer] OFF
