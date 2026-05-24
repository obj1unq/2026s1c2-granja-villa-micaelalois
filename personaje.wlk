import wollok.game.*
import cultivos.* 




object granja{
	var property cultivos = [Trigo, Maiz, Tomaco]

method laUbicacionTieneUnCultivo(){
	return game.getObjectsIn(granjero.position()).filter({ obj => obj != self}).isEmpty().not()
}

method elCultivoEstaListoParaRegar(){
	return game.getObjectsIn(granjero.position()).filter({ obj => obj != self }).estaListoParaRegar()

}

method cultivoActual(){
	if (self.laUbicacionTieneUnCultivo()){
		return game.getObjectsIn(granjero.position()).filter({ obj => obj != self })
	} else { game.say(granjero, "No hay nada para regar")}

}
}



object granjero {
	var property position = game.center()
	const property image = "fplayer.png"


// method cultivoActual() {    //Preguntar a la granja los cultivos en esa posicion
//     return game.getObjectsIn(self.position()).find({ objeto => granja.cultivos.contain(objeto) })
// }


//SOLO VOY A PERMITIR UNA PLANTA POR CELDA, POR LO TANTO USO EL MÉTODO if(game.getObjectsIn(self.position()).filter({ obj => obj != self }).isEmpty()){
//PARA QUE ME DEVUELVA SI LA CELDA ESTÁ VACÍA SIN CONTAR AL GRANJERO// 

method sembrarMaiz(){
	if(game.getObjectsIn(self.position()).filter({ obj => obj != self }).isEmpty()){ //ME FIJO QUE LA CELDA ESTE VACIA SIN EL PERSONAJE
	game.addVisual(new Maiz(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero()), estado = semillaMaiz))
	}
}

method sembrarTrigo(){
	if(game.getObjectsIn(self.position()).filter({ obj => obj != self }).isEmpty()){
	game.addVisual(new Trigo(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero()), estado = etapaDeEvolucion0))
}
}

method sembrarTomaco(){
	if(game.getObjectsIn(self.position()).filter({ obj => obj != self }).isEmpty()){
	game.addVisual(new Tomaco(position=game.at(self.coordenadaEnXDelGranjero(), self.coordenadaEnYDelGranjero()), estado = tomacoRecienPlantado))
}
}


method coordenadaEnXDelGranjero(){
	return self.position().x()
}

method coordenadaEnYDelGranjero(){
	return self.position().y()
}



method regar(){
if (granja.laUbicacionTieneUnCultivo() &&
       granja.elCultivoEstaListoParaRegar()){
 granja.cultivoActual().crecer()

}
}
}



// // method cosechar(){
// // //  // Verificar que haya un cultivo listo para cosechar//
// // //  if (game.getObjectsIn(self.position()).estaListoParaCosechar())
// // //  game.getObjectsIn(self.position())  //ACá incluye al granjero?// 
// // //  //MODELAR UNA GRANJA Y PREGUNTARLE A LA GRANJA QUE CULTIVO HAY/ 
// }






