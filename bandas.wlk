class Banda {
  const property nombre
  const property canonBase = 1000000

  method canon() = canonBase
  method gastoExtra() = 0
  method popularidad()
  method presupuesto() = self.canon() + self.gastoExtra()
}

class BandaRock inherits Banda {
  var property solosDeGuitarra = 0

  method agregarSoloDeGuitarra() {
    solosDeGuitarra += 1
  }

  override method gastoExtra() = 10000

  override method popularidad() = 100 * solosDeGuitarra
}

class BandaTrap inherits Banda {
  var property tieneHielo = false

  override method popularidad() = if (tieneHielo) 1000 else 0

  override method canon() = self.canonBase() * self.popularidad()
}

class BandaIndie inherits Banda {
  const instrumentos = []

  method agregarInstrumento(instrumento) {
    instrumentos.add(instrumento)
  }

  method cantidadInstrumentos() = instrumentos.size()

  override method gastoExtra() = 500 * self.cantidadInstrumentos()

  override method popularidad() = 3.14 * nombre.size()
}
