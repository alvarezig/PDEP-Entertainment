# PDEP Entertainment - TP individual de Objetos

Ignacio Gabriel Álvarez

![Diagrama de clases](diagrama_solucion_Ignacio_Alvarez.png)

El diagrama también está en `diagrama_solucion_Ignacio_Alvarez.puml`.

## Decisiones de diseño

- El impuesto es un porcentaje que guarda la productora, es el mismo para todas las entradas y se aplica al precio base. La productora puede cambiarlo.
- El descuento vip se calcula sobre el precio público, es decir, precio base más impuesto. Cada vip tiene su propio porcentaje y el abono fan no tiene descuento.
- Para comprar, el asistente necesita saldo mayor a cero. Después de la compra puede quedar con saldo negativo.
- La productora crea la entrada; el asistente valida el saldo, paga, agrega la entrada a su historial y registra la venta. El cálculo del descuento queda en el abono.
- La recaudación y la cantidad de entradas vendidas salen del registro de ventas. La recaudación usa el precio público sin descontar el beneficio vip, porque esa diferencia la cubren los sponsors.
- El canon de trap es 1.000.000 multiplicado por la popularidad. Para la banda más popular usé la cantidad de entradas vendidas, no el método `popularidad()`, y considero también las bandas que todavía no vendieron.
- “Año anterior” significa el año calendario anterior. Los nombres de las bandas compradas se devuelven sin repetir.
- Bonificar un abono vip aumenta su descuento en un punto porcentual.

## Conceptos aplicados

1. **Objetos y mensajes:** la productora crea la entrada y le envía `comprarEntrada` al asistente. El asistente consulta el precio a la entrada, el descuento a su abono y registra la venta en la productora.
2. **Herencia:** `Banda` es la superclase abstracta de `BandaRock`, `BandaTrap` y `BandaIndie`; `Abono` es la superclase abstracta de `Fan` y `Vip`. Las subclases reutilizan lo común e implementan solo lo que cambia. En Wollok no hay interfaces, así que la variación de comportamiento se resolvió con herencia y polimorfismo.
3. **Polimorfismo:** `popularidad()`, `canon()`, `gastoExtra()`, `porcentajeDescuento()`, `aplicarDescuentoA()` y `bonificar()` se comportan distinto según el tipo de banda o de abono. La productora y el asistente trabajan con todos de la misma forma.
4. **Encapsulamiento:** el dinero, el historial, las ventas, los descuentos y los datos de las bandas son estado interno y se consultan o modifican mediante métodos. La productora arma la venta y el asistente resuelve el pago, el historial y el registro; el descuento lo calcula el abono.
5. **Composición y colecciones:** la productora contiene bandas, asistentes y ventas; el asistente contiene un abono y su historial. Los reportes se arman recorriendo esas colecciones con `filter`, `map`, `sum`, `count` y `max`.
