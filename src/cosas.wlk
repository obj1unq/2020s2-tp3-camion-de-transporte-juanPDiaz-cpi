object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }	
}

object cosaDePesoVariable {
	var property peso = 0
}

object paqueteDeLadrillos {
	var property cantidadLadrillos = 0
	
	method cantidadRefuerzos() {
		const divisor = if(cantidadLadrillos <= 1000) 100 else 50
		
		return (cantidadLadrillos / divisor).roundUp()
	}
	
	/*method divisor() {
		return if(cantidadLadrillos <= 1000) 100 else 50
	}*/
	
	method peso() {
		return self.pesoLadrillos() + self.pesoRefuerzos()
	}
	
	method pesoLadrillos() {
		return 2 * cantidadLadrillos
	}
	
	method pesoRefuerzos() {
		return 10 * self.cantidadRefuerzos()
	}
	
	method nivelPeligrosidad() {
		return (50 - self.cantidadRefuerzos()).max(0)
	}
}

object arenaAGranel {
	var property peso = 0
	
	method nivelPeligrosidad() { return 1 }
}

object bateriaAntiaerea {
	var property poseeMisiles = false
	
	method peso() {
		return if (poseeMisiles) 300 else 200
	}
	
	method nivelPeligrosidad() {
		return if (poseeMisiles) 100 else 0
	}
}

object contenedorPortuario {
	const pesoContenedor = 100
	var cosasGuardadas = []
	
	method peso() {
		return pesoContenedor + self.pesoCosasGuardadas()
	}
	
	method pesoCosasGuardadas() {
		return cosasGuardadas.sum({ cosa => cosa.peso() })
	}
	
	method agregar(cosa) {
		cosasGuardadas.add(cosa)
	}
	
	method sacar(cosa) {
		self.validarSacar(cosa)
		cosasGuardadas.remove(cosa)
	}
	
	method validarSacar(cosa) {
		if(!cosasGuardadas.contains(cosa)) {
			self.error("No se puede sacar algo que no está guardado")
		}
	}
	
	method nivelPeligrosidad() {
		return cosasGuardadas.max({ cosa => cosa.nivelPeligrosidad() }).nivelPeligrosidad()
	}
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelPeligrosidad() { return 200 }
}

object embalajeDeSeguridad {
	var property cosaEmbalada
	
	method peso() {
		return cosaEmbalada.peso()
	}
	
	method nivelPeligrosidad() {
		return cosaEmbalada.nivelPeligrosidad() / 2
	}
}








