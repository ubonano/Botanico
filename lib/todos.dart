// CREa modulo de COMPRAS! Finaliza el feature y comenza uno nuevo



// TODO Fixear problema al buscar envio por ID, si falla queda el loading del boton
// al actualizar la empreda, esta pisando la lista de modulos



// Bloquear la odificacion del la activacion del modulo Empresa

// Revisar que la sesion se mantenga activa siempre
// Crear proceso programaado para que elimine todos los dias los envios archivados de dos meses hacia atras
// Crear los middlewares



// Refactor de modulos
// TODO Crear ABM de lugares de entrega
// TODO Bloquear modulo de trabajadores y empresa

// TODO no funciona la transaccion en operation_helper, si falla la transaccion no hace el rollback
// TODO, resolver que en los navigation helpers, en todos se agrega el metodo TO... no tienen que aclarase en todos, ver como resolverlo
// TODO Agregar al globalHelper las instancias de worker and company service y sacar el operation helper, tal vez instanciarlo diretamente en los servicios
// TODO Extraer el cambio de estado de los via_shipment en un servicio aparte
// TODO refactorizar modulo de WORKER (en general) Inclusive hay que agregar el paginationHelper

// TODO crear un servicio para el porta papeles y que dentro tambien tenga la posiblidad de mostrr snackbakrs si uno quisiera advertir al usuario que se copio algo, por ejemplo




/**
 * 
 * Se modifco:
 *  Colores de los botones.
 *  Modulos protegidos, los usuarios no deben ver los modulos que no estan activados, y los que no tiene permisos.
 *  Formulario de creacion/actualizacion en formato columna
 *  Copiar numero de guia al precionar sobre el mismo
 *  Alerta de pendiente en color naranja. (Se mantiene en rojo las que fueron facturadas y no estan listas/entregadas)
 *  Cambio de orden de las guias, Ahora se muestran las mas nuevas ultimas.
 *  Se quito del formulario el campo estado, lugar de entrega y facturado.
 *  Se arreglo el problema de que al intentar buscar un envio mediante la api, en el caso de que fallara, el boton quedaba inaccesible (quedaba el loading eternamente)
 *   
 */