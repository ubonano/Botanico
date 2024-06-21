// CREa modulo de COMPRAS! Finaliza el feature y comenza uno nuevo

// TODO Fixear problema al buscar envio por ID, si falla queda el loading del boton

// cambiar orden en el dashboard, al revez
//Que se copie el nro de guia al presionar en el
// El campo ESTADO no es necesario acá en este form, por defecto tiene que ser pendiente siempre (creacion y actualizcion de envios)
// y el campo lugar de entrega esta como obligatorio, tiene que ser opcional, mayormente eso se decide despues de crear el item
// lo mismo con el tipo: por defecto ENTREGA

// al actualizar la empreda, esta pisando la lista de modulos

// Revisar que la sesion se mantenga activa siempre

// Crear proceso programaado para que elimine todos los dias los envios archivados de dos meses hacia atras
// Refactor de modulos
// TODO Crear ABM de lugares de entrega
// TODO Bloquear modulo de trabajadores y empresa

// TODO no funciona la transaccion en operation_helper, si falla la transaccion no hace el rollback
// TODO, resolver que en los navigation helpers, en todos se agrega el metodo TO... no tienen que aclarase en todos, ver como resolverlo
// TODO Agregar al globalHelper las instancias de worker and company service y sacar el operation helper, tal vez instanciarlo diretamente en los servicios
// TODO Extraer el cambio de estado de los via_shipment en un servicio aparte
// TODO refactorizar modulo de WORKER (en general) Inclusive hay que agregar el paginationHelper

