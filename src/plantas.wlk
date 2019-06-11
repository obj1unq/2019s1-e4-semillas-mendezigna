class Plantas {
	var property anioDeObtencion
	var property altura
	method horasAlSolQueTolera() = null
	method esFuerte() = self.horasAlSolQueTolera() > 10
	method daSemillas() = self.esFuerte() || self.condicionParaDarSemillas()
	method espacioQueOcupa() = null
	method condicionParaDarSemillas() = null
	method lePareceIdeal(parcela) = true
}

class Menta inherits Plantas{
	override method horasAlSolQueTolera() = 6
	override method condicionParaDarSemillas() = altura > 0.4
	override method espacioQueOcupa() = altura * 3
	override method lePareceIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Plantas{
	override method horasAlSolQueTolera() = if (altura < 0.5) {6} else if (altura >= 0.5 and altura < 1) {7} else {9}
	override method condicionParaDarSemillas() = anioDeObtencion > 2007 and altura > 1
	override method espacioQueOcupa() = altura / 2
	override method lePareceIdeal(parcela) = parcela.horasDeSolQueRecibe() == self.horasAlSolQueTolera()
}

class Quinoa inherits Plantas{
	var horasAlSolQueTolera
	override method horasAlSolQueTolera() = horasAlSolQueTolera
	override method condicionParaDarSemillas() = anioDeObtencion < 2005
	override method espacioQueOcupa() = 0.5
	override method lePareceIdeal(parcela) = parcela.plantas().all({planta => planta.altura() < 1.5})
}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	override method lePareceIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() = altura * 6
}

