if object_id('Responsable', 'U') is null
create table Responsable (
    idResponsable                   bigint not null identity (1, 1)
  , NombreCompleto                  varchar(200) not null
  , Iniciales                       varchar(20) not null
  , btLogin                         varchar(50) not null constraint [DF_Responsable_btLogin]  default (suser_sname())
  , btFecha                         datetime not null constraint [DF_Responsable_btFecha]  default (getdate())
  , btHost                          varchar(50) not null constraint [DF_Responsable_btHost]  default (host_name())
  , constraint pkResponsable
      primary key (idResponsable)
);

if object_id('Categoria', 'U') is null
create table Categoria (
    idCategoria                     bigint not null identity (1, 1)
  , Categoria                       varchar(100) not null
  , Color                           bigint not null
  , btLogin                         varchar(50) not null constraint [DF_Categoria_btLogin]  default (suser_sname())
  , btFecha                         datetime not null constraint [DF_Categoria_btFecha]  default (getdate())
  , btHost                          varchar(50) not null constraint [DF_Categoria_btHost]  default (host_name())
  , constraint pkCategoria
      primary key (idCategoria)
);

if object_id('Tarea', 'U') is null
create table Tarea (
    idTarea                         bigint not null identity (1, 1)
  , Tarea                           varchar(max) not null
  , Prioridad                       int
  , FechaLimite                     datetime
  , idResponsable                   bigint
  , idCategoria                     bigint
  , FlagCompletada                  bit not null constraint DF_Tarea_FlagCompletada default (0)
  , btLogin                         varchar(50) not null constraint [DF_Tarea_btLogin]  default (suser_sname())
  , btFecha                         datetime not null constraint [DF_Tarea_btFecha]  default (getdate())
  , btHost                          varchar(50) not null constraint [DF_Tarea_btHost]  default (host_name())
  , constraint pkTarea
      primary key (idTarea)
  , constraint fkTarea_Responsable
      foreign key (idResponsable)
      references Responsable (idResponsable)
      on update cascade
      on delete set null
  , constraint fkTarea_Categoria
      foreign key (idCategoria)
      references Categoria (idCategoria)
      on update cascade
      on delete set null
);

if object_id('Control', 'U') is null
create table Control (
    PKControl                       char(1) not null constraint CK_Control_PKControl check (PKControl = 'X')
  , VersionEstructura               int not null
  , btLogin                         varchar(50) not null constraint [DF_Control_btLogin]  default (suser_sname())
  , btFecha                         datetime not null constraint [DF_Control_btFecha]  default (getdate())
  , btHost                          varchar(50) not null constraint [DF_Control_btHost]  default (host_name())
  , constraint pkControl
      primary key (PKControl)
);


if (select count(1) from Control) = 0
insert into Control (PKControl, VersionEstructura) values ('X', 1);
