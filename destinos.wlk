import camion.*
import caminos.*
import cosas.*

object almacen{
    const property cosas = #{}
    method depositarCosas(cosasNuevas) {
      cosas.addAll(cosasNuevas)
    } 
    method depositarCosa(cosaNueva) {
      cosas.add(cosaNueva)
    }
    method cosas() = cosas 
}