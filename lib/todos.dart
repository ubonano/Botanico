// Middlewares para permisos y modulos

// Refactor de los widgets de shipmet
// Refactor de service y busines logic, reducir los metodos de las acciones
// Revisar que la sesion se mantenga activa siempre
// Crear los middlewares



// Crear configuracion de modulos, por ahora solo de via_shipment, y tener ahi la configuracion de la api, para que lo configure el usuario

// Bloquear la modificacion del la activacion del modulo Empresa

// CREa modulo de COMPRAS! Finaliza el feature y comenza uno nuevo
// Crear proceso programaado para que elimine todos los dias los envios archivados de dos meses hacia atras

// TODO llevar la creacion de GetPage a cada page en particular y referenciarla en el navigation (en el pages[])
// TODO extraer el pages en un archivo aparte (Tal vez al ui.dart)
// TODO Al ingresar al worker_form, en el caso de que el usuario loggeado tenga un worker, que lo cargue automaticamente
// TODO al ingresar al company_form, en el caso de que el usuario loggeado tenga una empresa, que lo cargue automaticamente
//// TODO Refactorizar shipment_module_tile_button... separar en widget diferentes cada menu(botton para acceder a las pantallas)

// TODO Crear ABM de lugares de entrega
// TODO Bloquear modulo de trabajadores y empresa

// TODO no funciona la transaccion en operation_helper, si falla la transaccion no hace el rollback
// TODO, resolver que en los navigation helpers, en todos se agrega el metodo TO... no tienen que aclarase en todos, ver como resolverlo
// TODO Agregar al globalHelper las instancias de worker and company service y sacar el operation helper, tal vez instanciarlo diretamente en los servicios
// TODO Extraer el cambio de estado de los via_shipment en un servicio aparte
// TODO refactorizar modulo de WORKER (en general) Inclusive hay que agregar el paginationHelper

// TODO crear un servicio para el porta papeles y que dentro tambien tenga la posiblidad de mostrr snackbakrs si uno quisiera advertir al usuario que se copio algo, por ejemplo

