# gacseTareas

La aplicación fué desarrollada utilizando Delphi 10.2, FireDAC y componentes estándar de Delphi.
Utiliza SQL Server como base de datos.

Al ejecutarse por primera vez, se lanza la configuración de base de datos.

## Configuración de base de datos.

Se utiliza un diálogo estándar para pedir la configuración de la base de datos, que debe ser SQL Server.
Puede utilizar una base de datos nueva o existente, siempre que no haya conflicto entre los nombres de las 
tablas que se utilizan en el esquema. La recomendación es utilizar una base de datos nueva.

La base de datos debe existir previo a utilizar el programa.

### Configuración de conexión a base de datos 

![cfg](/img/cfg1.png)

Coloque el nombre del servidor, si utilizará autenticación de Windows  marque la casilla _Use Trusted 
Connection_ y si no coloque el usuario y contraseña. Luego haga clic en el botón _Options >>_

![cfg](/img/cfg2.png)

En el cuadro de diálogo extendido seleccione la base de datos ampliando el combo _Database_., Finalmente haga clic en _OK_.

![cfg](/img/cfg3.png)

### Estructura de la base de datos

El programa crea de manera automática la estructura necesaria para su funcionamiento. Tiene provisto también un mecanismo
para actualizar de manera automática esta estructura en versiones posteriores.


## Interfaz de usuario

La ventana muestra tantas tareas como sea posible. Puede _"manipular"_ las tareas utilizando el botón derecho del ratón o 
el menú principal.

![Tareas](/img/Tareas1.png)

El listado muestra las tareas relevantes de acuerdo al filtro y el orden seleccionado en el momento. Si ha definido 
categorías para las tareas, estas se muestran con el color de las categorí a la que pertenecen, para su fácil identificación.

Cuándo una tarea está vencida (no se ha completado y su fecha límite es hoy o está en el pasado) se muestra un recuadro rojo 
al rededor de la fecha de vencimiento, de manera que se le haga fácil identificar esta situación.

En el listado de tareas, puede utilizar el menú contextual o las opciones del menú principal 
para cambiar el responsable, prioridad o categoría de la tarea.

![Tareas](/img/TareasMenuContextual.png)

Desde este menú también puede agregar nuevos responsables, nuevas categorías, o dejar una tarea sin cateogría o sin responsable.

### Nueva tarea

Al agregar una nueva tarea, se muestra un diálogo donde puede llenar los datos correspondientes a la tarea. Al hacer clic en 
Aceptar la tarea se agrega al listado de tareas. 

![Tareas](/img/DialogoTarea.png)

### Filtros

![Tareas](/img/MenuFiltro.png)

Utilice el menú principal para filtrar las tareas que se muestran. De esta manera, puede ver solamente las tareas
pendientes, las terminadas, las que están atrasadas y todas las tareas.

### Orden

![Tareas](/img/MenuOrden.png)

Utilice el menú principal para elegir el orden en el que ve las tareas. Puede elegir entre 9 distintos tipos de orden, de acuerdo 
a sus necesidades en el momento.
