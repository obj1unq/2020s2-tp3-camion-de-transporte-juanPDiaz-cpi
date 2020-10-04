import cosas.*

object camion {
	const property cosas = #{}
	const pesoMaximo = 2500
	const tara = 1000
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTotal() {
		return tara + cosas.sum { c => c.peso() } 
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}
	
	method objetosPeligrosos(nivel) {
		return cosas.filter { c => c.nivelPeligrosidad() > nivel }
	}
	
	method objetosMasPeligrososQue(cosa) {
		return self.objetosPeligrosos(cosa.nivelPeligrosidad())
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		// Otra forma: 
		// return cosas.all {c => c.nivelPeligrosidad() <= nivelMaximoPeligrosidad}
		return self.objetosPeligrosos(nivelMaximoPeligrosidad).isEmpty()
	}
}
