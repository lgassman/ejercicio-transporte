import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMaximo = 2500
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		
		unaCosa.efectoDeCarga()
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTotal() {
		return tara + self.pesoCosas()
	}
	
	method pesoCosas() {
		return cosas.sum({cosa => cosa.peso()})
	}
	
	method excedidoPeso() {
		return self.pesoTotal() > pesoMaximo
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoPeso() and 
				self.todosPuedenCircular(nivelMaximoPeligrosidad)
	}
	
	method todosPuedenCircular(nivelMaximoPeligrosidad) {
		return cosas.all({unaCosa => 
			unaCosa.puedeCircularEnRuta(nivelMaximoPeligrosidad)
		})		
	}
	
	method puedeTransitar(ruta) {
	    return ruta.puedeTransitar(self)	
	}
	
	method validarTransito(ruta) {
		if(not self.puedeTransitar(ruta)) {
			self.error("no puedo transitar por " + ruta)
		}
	}
	
	method transitar(ruta) {
		self.validarTransito(ruta)
		ruta.transitar(self)
	}
	
	method perderUno() {
		if( !cosas.isEmpty() ) {
			cosas.remove(cosas.anyOne())
		}	
	}
	
	method controlDeCarga() {
		cosas.forEach( { cosa => 
			cosa.efectoDeCarga()
		})
	}
}

object ruta51 {
	const pesoMaximo = 2000
	const peligrosidadMaxima = 20
	method puedeTransitar(unVehiculo) {
		return unVehiculo.pesoTotal() <= pesoMaximo and 	
				unVehiculo.puedeCircularEnRuta(peligrosidadMaxima)	
	}
	
	method transitar(unVehiculo) {
		unVehiculo.perderUno()
	}
}

object ruta9 {
	const peligrosidadMaxima = 100
	
	method puedeTransitar(unVehiculo) {
		return unVehiculo.puedeCircularEnRuta(peligrosidadMaxima)	
	}
	
	method transitar(unVehiculo) {
		unVehiculo.controlDeCarga()	
	}
		
}
