import wollok.game.*
import cultivos.* 
import granja.*





object granjero {
	var property position = game.center()
	const property image = "fplayer.png"


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

}



// // method cosechar(){
// // //  // Verificar que haya un cultivo listo para cosechar//
// // //  if (game.getObjectsIn(self.position()).estaListoParaCosechar())
// // //  game.getObjectsIn(self.position())  //ACá incluye al granjero?// 
// // //  //MODELAR UNA GRANJA Y PREGUNTARLE A LA GRANJA QUE CULTIVO HAY/ 
// }






