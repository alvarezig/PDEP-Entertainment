class Entrada {
  const property banda
  const property fecha
  const precioBase = 1000

  method precioPublico(productora) = productora.precioConImpuesto(precioBase)

  method anio() = fecha.year()
}
