import cosas.*
import camion.*
import destinos.*

object ruta9{
    method soportaElViaje(transporte){
        return transporte.puedeCircular(20)
    }
}
object caminosVecinales{
    var limitePeso = 0
    method soportaElViaje(transporte){
        return transporte.pesoTotal() <= self.limitePeso()
    }
    method limitePeso() = limitePeso
    method limitePeso(nuevoLim){
        limitePeso = nuevoLim
    }  
}