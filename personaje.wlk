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
	const gananciasEnEstaInstancia = (plantasCosechadasHastaAhora.sum({planta => planta.valorDeVenta()}))//NO OLVIDARSE LAS LLAVES DEL LADO DE ADENTRO
    self.oroAcumulado(self.oroAcumulado() + gananciasEnEstaInstancia)
	plantasCosechadasHastaAhora.clear() 
}

method darInformacionDeCosechaYOro(){
	game.say(self, "Tengo hasta ahora" + granjero.plantasCosechadasHastaAhora.toString() + "plantas cosechadas" + "Y además tengo" + granjero.oroAcumulado.toString() + "oro hasta el momento")
}

method dejarAspersor(){
		game.addVisual(new Aspersor(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero())))
        aspersor.regarPlantasLimitrofes()
}
}






