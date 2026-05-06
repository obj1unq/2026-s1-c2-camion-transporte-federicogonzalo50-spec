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
		return (not self.estaExcedidoDePeso()) && not(cosas.any({ cosa => cosa.esMasPeligrosoQue(peligrosidadDada)}))
	}
	method descargar(unaCosa){
		self.verificarCamion(unaCosa)
		cosas.remove(unaCosa)
	}
	method verificarCamion(unaCosa){
		return if (not cosas.contains(unaCosa)){
			self.error("No se puede descargar algo que no esta en el camion")
		}
	}
	method todoPesoPar() {
	  return cosas.all({ cosa => cosa.tienePesoPar()})
	}
	method hayAlgunoQuePesa(pesoDado) {
    	return cosas.any({ cosa => cosa.pesa(pesoDado) })
	}
	method estaExcedidoDePeso() = self.pesoTotal() > pesoMaximo
	method pesoTotal() = pesoTara + self.pesoTodasLasCosas()
	method pesoTodasLasCosas(){
		return cosas.sum({cosa => cosa.peso()})
	}
	method hayAlgunoTanPeligroso(peligrosidadBuscada){
		return cosas.find({cosa => cosa.esTanPeligroso(peligrosidadBuscada)})
	}
	method tieneAlgoEntre(min,max){
		return cosas.any({ cosa => cosa.pesaEntre(min,max)})
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
	method cosasQueSuperanPeligrosidad(nivel){
    	return cosas.filter({cosa => cosa.esMasPeligrosoQue(nivel)})
	}
	method cosasmasPeligrosasQue(unaCosa){
    	return cosas.filter({cosa => cosa.esMasPeligrosoQueObjeto(unaCosa)})
	}
}
