import wollok.game.*
import cultivos.* 
import granja.*





object granjero {
	var property position = game.center()
	const property image = "fplayer.png"
	var property plantasCosechadasHastaAhora = []
	var property oroAcumulado = 0


method sembrarMaiz(){
	if(granja.sePuedeSembrarAca()){ //ME FIJO QUE LA CELDA ESTE VACIA 
	game.addVisual(new Maiz(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero()), estado = semillaMaiz))
	}
}

method sembrarTrigo(){
	if(granja.sePuedeSembrarAca()){
	game.addVisual(new Trigo(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero()), estado = etapaDeEvolucion0))
} 
}

method sembrarTomaco(){
	if(granja.sePuedeSembrarAca()){
	game.addVisual(new Tomaco(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero()), estado = tomacoRecienPlantado))
}
}


method coordenadaEnXDelGranjero(){
	return self.position().x()
}

method coordenadaEnYDelGranjero(){
	return self.position().y()
}



method regar() {

    if (granja.hayAlgoParaRegarAca()) {
        granja.cultivoActual().crecer()
    } else {
        game.say(self, "No hay nada para regar acá")
    }
}


method cosechar(){
  if(granja.esPosibleCosecharAca()){
    plantasCosechadasHastaAhora.add(granja.objetosSinGranjero().first())
	game.removeVisual(granja.objetosSinGranjero().first())
  }
}

method vender(){
	 const mercadoActual = self.mercadoDondeEstoyParado()
     const montoACobrar = self.valorTotalDeLaCosecha()
if (self.tieneMercaderiaParaVender() && self.estaParadoEnUnMercado() && self.mercadoDondeEstoyParado().tienePlataSuficiente(self.valorTotalDeLaCosecha())) {
        
            self.realizarTransaccion(mercadoActual, montoACobrar)
        
    } else { 
        game.say(self, "No tengo mercadería, no es el lugar correcto o al mercado no le alcanza la plata")
    }
}


method realizarVenta(){
	const mercadoActual = self.mercadoDondeEstoyParado()
    const totalACobrar = self.valorTotalDeLaCosecha()
 if (mercadoActual.tienePlataSuficiente(totalACobrar)) {
        self.realizarTransaccion(mercadoActual, totalACobrar)
    } else {
        game.say(self, "A este mercado no le alcanza la plata para pagarme")
    }
}
method tieneMercaderiaParaVender(){
	return (not plantasCosechadasHastaAhora.isEmpty())     
}

method estaParadoEnUnMercado(){
   const objetosEnEstaUbicacion = game.getObjectsIn(self.position()).filter({ obj => obj != self })
return  objetosEnEstaUbicacion.any({ supuestoMercado => granja.mercados().contains(supuestoMercado) })
}
   

    

method mercadoDondeEstoyParado() {
    return granja.mercados().find({ mercado => mercado.position() == self.position() })
}



method valorTotalDeLaCosecha() {
    return plantasCosechadasHastaAhora.sum({ planta => planta.valorDeVenta() })
}

method realizarTransaccion(mercado, monto) {
    mercado.comprarCosecha(plantasCosechadasHastaAhora, monto)
    self.oroAcumulado(self.oroAcumulado() + monto)
    plantasCosechadasHastaAhora.clear()
    
    game.say(self, "Se realizó la venta, cobré " + monto + " monedas.")
}

method darInformacionDeCosechaYOro(){
	game.say(self, "Tengo hasta ahora" + granjero.plantasCosechadasHastaAhora.toString() + "plantas cosechadas" + "Y además tengo" + granjero.oroAcumulado.toString() + "oro hasta el momento")
}

method dejarAspersor(){
	const aspersor1 = new Aspersor(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero()))
		game.addVisual(aspersor1)
game.onTick(1000, "aspersor1" + aspersor1.identity().toString(), { aspersor1.regarPlantasAlrededor()})}
}






