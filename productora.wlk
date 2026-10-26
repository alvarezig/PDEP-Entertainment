class Productora {
  var property impuesto = 0
  const bandasRegistradas = []
  const asistentesRegistrados = []
  const ventas = []

  method bandas() = bandasRegistradas
  method asistentes() = asistentesRegistrados
  method entradasVendidas() = ventas

  method registrarBanda(banda) {
    bandasRegistradas.add(banda)
  }

  method registrarAsistente(asistente) {
    asistentesRegistrados.add(asistente)
  }

  method registrarVenta(entrada) {
    ventas.add(entrada)
  }

  method precioConImpuesto(precioBase) = precioBase + (precioBase * impuesto) / 100

  method venderEntradaA(asistente, banda, fecha) = asistente.comprarEntrada(banda, fecha, self)

  method recaudacion() = ventas.sum { entrada => entrada.precioPublico(self) }

  method presupuestoTotal() = bandasRegistradas.sum { banda => banda.presupuesto() }

  method gananciaTotal() = self.recaudacion() - self.presupuestoTotal()

  method cantidadEntradasVendidas() = ventas.size()

  method ventasDe(banda) = ventas.count { entrada => entrada.banda() == banda }

  method bandaMasPopular() {
    if (bandasRegistradas.isEmpty()) {
      throw new DomainException(message = "No hay bandas registradas en la productora")
    }
    return bandasRegistradas.max { banda => self.ventasDe(banda) }
  }

  method bonificar(asistente) {
    asistente.bonificar()
  }

  method bonificarAsistentesVip() {
    asistentesRegistrados.filter { asistente => asistente.esVip() }.forEach { asistente => asistente.bonificar() }
  }
}
