class Abono {
  method porcentajeDescuento()
  method aplicarDescuentoA(precio) = precio - (precio * self.porcentajeDescuento()) / 100
  method esVip()
  method bonificar() {}
}

class Fan inherits Abono {
  override method porcentajeDescuento() = 0

  override method esVip() = false
}

class Vip inherits Abono {
  var property descuento = 0

  override method porcentajeDescuento() = descuento

  override method esVip() = true

  override method bonificar() {
    descuento += 1
  }
}
