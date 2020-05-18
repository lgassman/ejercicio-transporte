object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.nivelPeligrosidad() <= nivelMaximoPeligrosidad
	}
	
	method efectoDeCarga() {
		//el requerimientos es que no haga nada
	}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.nivelPeligrosidad() <= nivelMaximoPeligrosidad
	}
	
	method efectoDeCarga() {
		transformadoEnAuto = false
	}
}

object contenedorPortuario {
	
	const contenidos = #{}
	const pesoPropio = 100
	
	method agregar(unaCosa) {
		contenidos.add(unaCosa)
	} 
	
	method peso() {
		return pesoPropio + self.pesoDeLasCosas()
	}
	
	method pesoDeLasCosas() {
		return contenidos.sum({unaCosa =>unaCosa.peso()})
	}
	
	method nivelPeligrosidad() {
		if(contenidos.isEmpty()) {
			return 0
		}
		return self.masPeligroso().nivelPeligrosidad()
	}
	
	method masPeligroso() {
		return contenidos.max({unaCosa => unaCosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.nivelPeligrosidad() <= nivelMaximoPeligrosidad
	}
	
	method efectoDeCarga() {
		contenidos.forEach({cosa => cosa.efectoDeCarga() })
	}
	
}

object embalaje {
	
	var property embalado
	
	method peso() {
		return embalado.peso()
	}
	
	method nivelPeligrosidad() {
		return embalado.nivelPeligrosidad() / 2	
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.nivelPeligrosidad() <= nivelMaximoPeligrosidad
	}
	
	method efectoDeCarga() {
		
	}	
}







