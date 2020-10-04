object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return if (transformadoEnAuto) { 15 } else { 30 }
	}
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteLadrillos {
	var property cantidad = 0
	const pesoUnitario = 2
	
	method peso() { return cantidad * pesoUnitario }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1 }	
}

object bateriaAntiaerea {
	var property tieneMisiles = false
	method peso() { return if (tieneMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { 
		return if (tieneMisiles) { 100 } else { 0 }
	}	
}
