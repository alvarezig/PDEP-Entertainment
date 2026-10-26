class Asistente {
  const property abono
  var property dineroDisponible = 0
  const entradasCompradas = []

  method entradas() = entradasCompradas
  method historial() = entradasCompradas
  method cantidadEntradas() = entradasCompradas.size()
  method puedeComprar() = dineroDisponible > 0
  method esVip() = abono.esVip()

  method comprarEntrada(entrada, productora) {
    if (!self.puedeComprar()) {
      throw new DomainException(message = "No se puede comprar una entrada sin saldo positivo")
    }
    dineroDisponible -= self.montoAPagar(entrada, productora)
    entradasCompradas.add(entrada)
    productora.registrarVenta(entrada)
    return entrada
  }

  method montoAPagar(entrada, productora) = abono.aplicarDescuentoA(entrada.precioPublico(productora))

  method entradasDelAnioAnterior() = self.entradasDelAnio(calendar.today().year() - 1)

  method entradasDelAnio(anio) = entradasCompradas.filter { entrada => entrada.anio() == anio }

  method bandasCompradas() = entradasCompradas.map { entrada => entrada.banda().nombre() }.withoutDuplicates()

  method bonificar() {
    abono.bonificar()
  }
}
