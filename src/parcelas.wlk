class Parcela {
	var ancho
	var largo
	var property horasDeSolQueRecibe
	const property plantas = []
	
	method superficie() = ancho * largo
	method cantidadMaximaDePlantas(){
		return if (ancho > largo){
			self.superficie() / 5
		} else {
			self.superficie() / 3 + largo
		}
	}
	method tieneComplicaciones() = plantas.any({planta => planta.horasAlSolQueTolera() < horasDeSolQueRecibe})
	method verificarPlantar(planta){
		self.verificiarSiHayEspacio()
		self.verificarSiSePuedePlantar(planta)
	}
	method verificiarSiHayEspacio() {
		if (plantas.size() == self.cantidadMaximaDePlantas()){
			self.error("ya alcanzaste el maximo de plantas")
		}
	}
	method verificarSiSePuedePlantar(planta){
		if (horasDeSolQueRecibe - planta.horasAlSolQueTolera() >= 2){
			self.error("no se puede plantar esta planta")
		}
	}
	method plantar(planta) { 
		self.verificarPlantar(planta)
		plantas.add(planta)
	}
	method seAsociaBien(planta) = true
	method cantidadDePlantas() = plantas.size()
	method porcentajeDeBienAsociadas() = (self.cantidadDePlantasQueSeAsocianBien() / self.cantidadDePlantas()) * 100
	method cantidadDePlantasQueSeAsocianBien() = plantas.filter({planta => self.seAsociaBien(planta)}).size()
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(planta) = planta.lePareceIdeal(self) and not self.tieneComplicaciones()
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(planta) = self.cantidadDePlantas() < 3 and planta.esFuerte()
}
