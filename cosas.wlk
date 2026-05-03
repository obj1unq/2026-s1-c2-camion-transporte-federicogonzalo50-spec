import camion.*
import caminos.*
import destinos.*
// tf = true/false
object knightRider {
	
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantBultos(){ return 1}
	method sufrioAccidente() {
	}
}
object arenaAGranel {
	var pesoActual = 1
	method peso() { return pesoActual }
	method nivelPeligrosidad() { return 1 }
	method pesoActual(nuevo){
		pesoActual = nuevo
	}
	method cantBultos(){ return 1}
	method sufrioAccidente(){
		pesoActual = pesoActual + 20
	}
}
object bumblebee {
	var estaComoRobot = false
	method peso() { return 800 }
	method peligrosidadSegunForma() {
	  return if (estaComoRobot) 30 else 15
	}
	method nivelPeligrosidad() { return self.peligrosidadSegunForma()}	
	method estaComoRobot(tf){
		estaComoRobot = tf
	}
	method cantBultos() { return 2}
	method sufrioAccidente(){
		estaComoRobot = not (estaComoRobot)
	}
	method estaComoRobot() = estaComoRobot 
}
object paqueteLadrillos {
	var cantLadrillos = 0
	const pesoLadrillo = 2
	method peso() { return self.pesoPaqueteLadrillo()}
	method pesoPaqueteLadrillo() { return pesoLadrillo * cantLadrillos }
	method nivelPeligrosidad() { return 2 }
	method cantLadrillos(nuevaCant){
		cantLadrillos = nuevaCant
	}
	method cantBultos() {
		return if (cantLadrillos<=100){
			1
		}else if (cantLadrillos>300){
			3
		}else 2
	}
	method sufrioAccidente(){
		if(cantLadrillos>12)
		cantLadrillos = cantLadrillos - 12
		else cantLadrillos = 0
	}
	method cantLadrillos() = cantLadrillos 
}
object bateriaAntiAerea {
	var estaConMisiles = false
	method pesoSegunMisiles(){
		return if (estaConMisiles) 300 else 200
	}
	method peligrosidadSegunMisiles() {
	  return if (estaConMisiles) 100 else 0
	}
	method peso() { return self.pesoSegunMisiles()}
	method nivelPeligrosidad() { return self.peligrosidadSegunMisiles()}
	method estaConMisiles() = estaConMisiles 
	method estaConMisiles(tf){
		estaConMisiles = tf
	}
	method cantBultos(){
		return if (estaConMisiles) 2 else 1
	}
	method sufrioAccidente() {
	  if (estaConMisiles)
	   self.estaConMisiles(false)
	}
}
object residuosRad {
	var peso = 1
	method nivelPeligrosidad() {
	  return 200
	}
	method peso() {
	  return peso 
	}
	method peso(nuevo) {
	  peso = nuevo
	}
	method cantBultos(){ return 1}
	method sufrioAccidente(){
		peso = peso + 15
	}
}
object contenedorPortuario{
	const property cosas = #{}
	const pesoC = 100
	method cargar(cosa){
		cosas.add(cosa)
	}
	method descargar(unaCosa){
		if (not cosas.contains(unaCosa)){
			self.error("No se puede descargar algo que no esta en el contenedor")
		}
		cosas.remove(unaCosa)
	}
	method peso() {
		return pesoC + cosas.sum({cosa => cosa.peso()})
	}
	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		}
		return cosas.map({ cosa => cosa.nivelPeligrosidad()}).max()
	}
	method cantBultos() {
	   return 1 + cosas.sum({cosa => cosa.cantBultos()})
	}
	method sufrioAccidente(){
		cosas.forEach({cosa => cosa.sufrioAccidente()})
	}
}
object embalajeDeSeg{
	var objEnvuelto = residuosRad
	method objEnvuelto(nuevoObj) {
	  objEnvuelto = nuevoObj
	}
	method peso() = objEnvuelto.peso()
	method nivelPeligrosidad() = objEnvuelto.nivelPeligrosidad()*0.5 
	method cantBultos(){return 2}
	method sufrioAccidente(){
	}
}



