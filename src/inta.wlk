object inta {
	const property parcelas = []
	
	method promedioDePlantas() = self.cantidadDePlantas() / parcelas.size()
	method cantidadDePlantas() = parcelas.sum({parcela => parcela.cantidadDePlantas()})
	method masSustentable() = self.parcelasConMasde4Plantas().max({parcela => parcela.porcentajeDeBienAsociadas()})
	method parcelasConMasde4Plantas() = parcelas.filter({parcela => parcela.cantidadDePlantas() > 4})
	method agregarParcela(parcela) = parcelas.add(parcela)
}
