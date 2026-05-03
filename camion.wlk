import cosas.*
import caminos.*
import destinos.*

object camion {
	const property cosas = #{}
	const pesoTara = 1000
	var pesoMaximo = 2500
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method puedeCircular(peligrosidadDada){
		return (not self.estaExcedidoDePeso()) && not(cosas.any({ cosa => cosa.nivelPeligrosidad() > peligrosidadDada}))
	}
	method descargar(unaCosa){
		if (not cosas.contains(unaCosa)){
			self.error("No se puede descargar algo que no esta en el camion")
		}
		cosas.remove(unaCosa)
	}
	method todoPesoPar() {
	  return cosas.all({ cosa => cosa.peso().even()})
	}
	method hayAlgunoQuePesa(pesoDado){
		return cosas.any({cosa => cosa.peso()==pesoDado})
	}
	method estaExcedidoDePeso() = self.pesoTotal() > pesoMaximo
	method pesoTotal() = pesoTara + self.pesoTodasLasCosas()
	method pesoTodasLasCosas(){
		return cosas.sum({cosa => cosa.peso()})
	}
	method hayAlgunoTanPeligroso(peligrosidadBuscada){
		return cosas.find({cosa => cosa.nivelPeligrosidad()==peligrosidadBuscada})
	}
	method tieneAlgoEntre(min,max){
		return cosas.any({ cosa => cosa.peso() > min and cosa.peso()< max})
	}
	method cosaMasPesada(){
		return  cosas.max({cosa => cosa.peso()})
	}
	method todosLosPesos(){
		return cosas.map({cosa => cosa.peso()})
	}
	method totalBultos() {
	   return cosas.sum({cosa => cosa.cantBultos()})
	}
	method sufrirAcidente(){
		cosas.forEach({cosa => cosa.sufrioAccidente()})
	}
	method transportar(destino, camino){
		if(camino.soportaElViaje(self)){
		destino.depositarCosas(cosas)
		cosas.clear()
		}
	}
	method pesoMaximo(nuevoPeso) {
	  pesoMaximo = nuevoPeso
	}
}
