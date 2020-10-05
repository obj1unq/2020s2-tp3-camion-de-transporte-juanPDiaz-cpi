import cosas.*

object camion {
	const property cosas = []
	const property pesoMaximo = 2500
	const pesoTara = 1000
	
	method cargar(cosa) {
		self.validarCarga(cosa)
		cosas.add(cosa)
	}
	
	method descargar(cosa) {
		self.validadDescarga(cosa)
		cosas.remove(cosa)
	}
	
	method validarCarga(cosa) {
		if (self.pesoTotal() + cosa.peso() > pesoMaximo) {
			self.error("No se puede cargar más peso")
		}
	}
	
	method validadDescarga(cosa) {
		if (!self.posee(cosa)) {
			self.error("No se puede descargar algo que no está cargado")
		}
	}
	
	method pesoTotal() {
		return pesoTara + self.pesoCosas()
	}
	
	method pesoCosas() {
		return cosas.sum({ cosa => cosa.peso() })
	}
	
	method posee(cosa) {
		return cosas.contains(cosa)
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}
	
	method objetosPeligrosos(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}
	
	method objetosMasPeligrososQue(cosa) {
		return self.objetosPeligrosos(cosa.nivelPeligrosidad())
	}
	
	method puedeCircularEnRuta(nivelMaximo) {
		return cosas.all({ cosa => cosa.nivelPeligrosidad() < nivelMaximo })
	}
	
	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({ cosa => cosa.peso().between(min, max) })
	}
	
	method cosaMasPesada() {
		return cosas.max({ cosa => cosa.peso() })
	}
	
	method totalBultos() {
		return cosas.sum({ cosa => cosa.bulto() })
	}
	
	method pesos() {
		return cosas.map({ cosa => cosa.peso() })
	}
}












