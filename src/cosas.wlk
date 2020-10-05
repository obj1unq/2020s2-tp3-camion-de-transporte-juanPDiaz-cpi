object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() { return 1 }
	method seCarga() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() { return 2 }
	
	method seCarga() {							// Preguntarle a Leo
		transformadoEnAuto = false
	}
}

object cosaDePesoVariable {
	var property peso = 0
}

object paqueteDeLadrillos {
	var property cantidadLadrillos = 0
	//var property cantidadRefuerzos = 0
	
	/*
	method cantidadLadrillos(cantidad){
		cantidadLadrillos = cantidad
		
		if (cantidad <= 1000) {
			cantidadRefuerzos = (cantidad / 100).roundUp()
		} else {
			cantidadRefuerzos = (cantidad / 50).roundUp()
		}
	}
	*/
	
	method cantidadRefuerzos() {
		//const divisor = if(cantidadLadrillos <= 1000) 100 else 50
		
		return (cantidadLadrillos / self.divisor()).roundUp()

		/*return if(cantidadLadrillos <= 1000) {
			(cantidadLadrillos / 100).roundUp()
		} else {
			(cantidadLadrillos / 50).roundUp()
		}*/
	}
	
	method divisor() {
		return if(cantidadLadrillos <= 1000) 100 else 50
	}
	
	
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
	
	method bulto() {
		return if(cantidadLadrillos <= 100) {
			1
		} else if(cantidadLadrillos <= 300) {
			2
		} else {
			3
		}
	}
	
	method seCarga() {
		cantidadLadrillos = (cantidadLadrillos - 12).max(0)
	}
}

object arenaAGranel {
	var property peso = 0
	
	method nivelPeligrosidad() { return 1 }
	method bulto() { return 1 }
	
	method seCarga() {
		peso = (peso - 15).max(0)
	}
}

object bateriaAntiaerea {
	var property poseeMisiles = false
	
	method peso() {
		return if (poseeMisiles) 300 else 200
	}
	
	method nivelPeligrosidad() {
		return if (poseeMisiles) 100 else 0
	}
	
	method bulto() {
		return if(poseeMisiles) {
			2
		} else {
			1
		}
	}
	
	method seCarga() {
		poseeMisiles = true
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
		cosasGuardadas.remove(cosa)
	}
	
	method nivelPeligrosidad() {
		return cosasGuardadas.max({ cosa => cosa.nivelPeligrosidad() }).nivelPeligrosidad()
	}
	
	method bulto() {
		return 1 + self.bultoCosasGuardadas()
	}
	
	method bultoCosasGuardadas() {
		return cosasGuardadas.sum({ cosa => cosa.bulto() })
	}
	
	method seCarga() {
		cosasGuardadas.forEach({ cosa => cosa.seCarga() })
	}
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelPeligrosidad() { return 200 }
	method bulto() { return 1 }
	
	method seCarga() {
		peso += 15
	}
}

object embalajeDeSeguridad {
	var property cosaEmbalada
	
	method bulto() { return 2 }
	method seCarga() {}
	
	method peso() {
		return cosaEmbalada.peso()
	}
	
	method nivelPeligrosidad() {
		return cosaEmbalada.nivelPeligrosidad() / 2
	}
	
}








