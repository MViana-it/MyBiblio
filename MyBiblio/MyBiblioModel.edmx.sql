
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/03/2020 12:15:16
-- Generated from EDMX file: C:\Users\MarioViana\Projetos\MyBiblio\MyBiblio\MyBiblioModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MyBiblioDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'LivrosSet'
CREATE TABLE [dbo].[LivrosSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(max)  NOT NULL,
    [Subtitulo] nvarchar(max)  NOT NULL,
    [Autores] nvarchar(max)  NOT NULL,
    [ISBN] nvarchar(max)  NULL,
    [Editora] nvarchar(max)  NOT NULL,
    [Ano] smallint  NOT NULL,
    [Edicao] tinyint  NOT NULL,
    [NrPaginas] smallint  NOT NULL,
    [Assunto] nvarchar(max)  NULL,
    [CDU] nvarchar(max)  NOT NULL,
    [Obs] nvarchar(max)  NULL
);
GO

-- Creating table 'ExemplaresSet'
CREATE TABLE [dbo].[ExemplaresSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cota] nvarchar(max)  NOT NULL,
    [Estante] nvarchar(max)  NOT NULL,
    [Requisitado] bit  NOT NULL,
    [LivrosId] int  NOT NULL
);
GO

-- Creating table 'UtentesSet'
CREATE TABLE [dbo].[UtentesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Morada] nvarchar(max)  NOT NULL,
    [Contacto] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EmprestimosSet'
CREATE TABLE [dbo].[EmprestimosSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DataEmprestimo] datetime  NOT NULL,
    [DataDevolucao] datetime  NULL,
    [ExemplaresId] int  NOT NULL,
    [UtentesId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'LivrosSet'
ALTER TABLE [dbo].[LivrosSet]
ADD CONSTRAINT [PK_LivrosSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ExemplaresSet'
ALTER TABLE [dbo].[ExemplaresSet]
ADD CONSTRAINT [PK_ExemplaresSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UtentesSet'
ALTER TABLE [dbo].[UtentesSet]
ADD CONSTRAINT [PK_UtentesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmprestimosSet'
ALTER TABLE [dbo].[EmprestimosSet]
ADD CONSTRAINT [PK_EmprestimosSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LivrosId] in table 'ExemplaresSet'
ALTER TABLE [dbo].[ExemplaresSet]
ADD CONSTRAINT [FK_LivrosExemplares]
    FOREIGN KEY ([LivrosId])
    REFERENCES [dbo].[LivrosSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LivrosExemplares'
CREATE INDEX [IX_FK_LivrosExemplares]
ON [dbo].[ExemplaresSet]
    ([LivrosId]);
GO

-- Creating foreign key on [ExemplaresId] in table 'EmprestimosSet'
ALTER TABLE [dbo].[EmprestimosSet]
ADD CONSTRAINT [FK_ExemplaresEmprestimos]
    FOREIGN KEY ([ExemplaresId])
    REFERENCES [dbo].[ExemplaresSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ExemplaresEmprestimos'
CREATE INDEX [IX_FK_ExemplaresEmprestimos]
ON [dbo].[EmprestimosSet]
    ([ExemplaresId]);
GO

-- Creating foreign key on [UtentesId] in table 'EmprestimosSet'
ALTER TABLE [dbo].[EmprestimosSet]
ADD CONSTRAINT [FK_UtentesEmprestimos]
    FOREIGN KEY ([UtentesId])
    REFERENCES [dbo].[UtentesSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UtentesEmprestimos'
CREATE INDEX [IX_FK_UtentesEmprestimos]
ON [dbo].[EmprestimosSet]
    ([UtentesId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------