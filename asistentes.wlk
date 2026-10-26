import entradas.*

class Asistente {
  const property abono
  var property dineroDisponible = 0
  const entradasCompradas = []

  method entradas() = entradasCompradas
  method historial() = entradasCompradas
  method cantidadEntradas() = entradasCompradas.size()
  method puedeComprar() = dineroDisponible > 0
  method esVip() = abono.esVip()

  method comprarEntrada(banda, fecha, productora) {
    if (!self.puedeComprar()) {
      throw new DomainException(message = "No se puede comprar una entrada sin saldo positivo")
    }
    const entrada = new Entrada(banda = banda, fecha = fecha)
    dineroDisponible -= self.montoAPagar(entrada, productora)
    entradasCompradas.add(entrada)
    productora.registrarVenta(entrada)
    return entrada
  }

  method montoAPagar(entrada, productora) {
    const precio = entrada.precioPublico(productora)
    return precio - (precio * abono.porcentajeDescuento()) / 100
  }

  method entradasDelAnioAnterior() = self.entradasDelAnio(calendar.today().year() - 1)

  method entradasDelAnio(anio) = entradasCompradas.filter { entrada => entrada.anio() == anio }

  method bandasCompradas() = entradasCompradas.map { entrada => entrada.banda().nombre() }.withoutDuplicates()

  method bonificar() {
    abono.bonificar()
  }
}
