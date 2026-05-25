import personaje.*
import cultivos.*
import wollok.game.*


object granja{

method estaPosicionEstaVacia(){
	return game.getObjectsIn(granjero.position()).size() <= 1
}


method hayAlgoParaRegarAca() {

	if(self.estaPosicionEstaVacia().not()){
        return self.cultivoActual().estado().estaListoParaRegar()
    } else { return false}
}

method cultivoActual() {
         return game.getObjectsIn(granjero.position()).without(granjero)
    
}

method sePuedeSembrarAca(){
	return self.estaPosicionEstaVacia()
}

}