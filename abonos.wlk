class Abono {
  method porcentajeDescuento() = 0
  method esVip() = false
  method bonificar() {}
}

class Fan inherits Abono {}

class Vip inherits Abono {
  var property descuento = 0

  override method porcentajeDescuento() = descuento

  override method esVip() = true

  override method bonificar() {
    descuento += 1
  }
}
