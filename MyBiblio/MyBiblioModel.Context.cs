﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyBiblio
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MyBiblioModelContainer : DbContext
    {
        public MyBiblioModelContainer()
            : base("name=MyBiblioModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Livros> LivrosSet { get; set; }
        public virtual DbSet<Exemplares> ExemplaresSet { get; set; }
        public virtual DbSet<Utentes> UtentesSet { get; set; }
        public virtual DbSet<Emprestimos> EmprestimosSet { get; set; }
    }
}
