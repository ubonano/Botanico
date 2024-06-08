// CREa modulo de COMPRAS! Finaliza el feature y comenza uno nuevo


// TODO ver de agregar el collectionName en el modelo como valor static
// TODO, hacer que los initializeStream no tengan como parametro el company, ya que dentro del repo se obtiene del busines logic de company
// TODO no funciona la transaccion en operation_helper, si falla la transaccion no hace el rollback
// TODO Cambiar que en la logica de negocio no se navegue... Eso se tiene que hacer en los controllers es parte de la interfaz grafica
// TODO los gets de lo servicios tienen que pasar por perform... hacer que el perform devuelva el resultado de la operacion
// TODO, resolver que en los navigation helpers, en todos se agrega el metodo TO... no tienen que aclarase en todos, ver como resolverlo
// TODO Agregar al globalHelper las instancias de worker and company service y sacar el operation helper, tal vez instanciarlo diretamente en los servicios
// TODO Extraer el cambio de estado de los via_shipment en un servicio aparte
// TODO refactorizar modulo de WORKER (en general) Inclusive hay que agregar el paginationHelper

