USE [APIHR]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 23/06/2023 4:51:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[CodigoBarra] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Marca] [varchar](50) NULL,
	[Categoria] [varchar](100) NULL,
	[Precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CodigoBarra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_editar_producto]    Script Date: 23/06/2023 4:51:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_editar_producto](
@idProducto int,
@codigoBarra varchar(50) null,
@nombre varchar(50) null,
@marca varchar(50) null,
@categoria varchar(100) null,
@precio decimal(10,2) null
)as
begin

 

    update PRODUCTO set
    CodigoBarra = isnull(@codigoBarra,CodigoBarra),
    Nombre = isnull(@nombre,Nombre),
    Marca = isnull(@marca,Marca),
    Categoria = isnull(@categoria,Categoria),
    Precio = ISNULL(@precio,Precio)
    where IdProducto = @idProducto

 

end


GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_producto]    Script Date: 23/06/2023 4:51:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

create proc [dbo].[sp_eliminar_producto](
@idProducto int
)as
begin

 

delete from PRODUCTO where IdProducto = @idProducto

 

end

 

 


select * from PRODUCTO
GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_producto]    Script Date: 23/06/2023 4:51:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

create proc [dbo].[sp_guardar_producto](

@codigoBarra varchar(50),

@nombre varchar(50),

@marca varchar(50),

@categoria varchar(100),

@precio decimal(10,2)

)as

begin

    insert into PRODUCTO(CodigoBarra,Nombre,Marca,Categoria,Precio)

    values(@codigoBarra,@nombre,@marca,@categoria,@precio)

end

 


GO
/****** Object:  StoredProcedure [dbo].[sp_lista_productos]    Script Date: 23/06/2023 4:51:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_lista_productos]

as

begin

    select 

    IdProducto,CodigoBarra,Nombre,

    Marca,Categoria,Precio

    from PRODUCTO

end

GO
