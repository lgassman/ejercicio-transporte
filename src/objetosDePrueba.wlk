object cosaPesada {
	
	var cargado = false
	
	method peso() {
		return 3000
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return true
	}
	
	method efectoDeCarga() {
		cargado=true
	}
	
	method cargado() {
		return cargado
	}
	

}

object objetoMuyPeligroso {
	
	
	method peso() {
		return 0
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return false
	}

	method efectoDeCarga() {
	}
	
}

object objetoRecargable {
	
	var vecesCargadas = 0
	
	method peso() {
		return 0
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return true
	}

	method efectoDeCarga() {
		vecesCargadas = vecesCargadas + 1 
	}
	
	method vecesCargadas() {
		return vecesCargadas
	}
	
	
	
}


