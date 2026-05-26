import personaje.*
import cultivos.*
import wollok.game.*


object granja{

method estaPosicionEstaVacia(){
	return game.getObjectsIn(granjero.position()).size() <= 1
}


method hayAlgoParaRegarAca() {

	return !self.estaPosicionEstaVacia() && self.cultivoActual().estado().estaListoParaRegar()
       
}


method objetosSinGranjero() {
        return game.getObjectsIn(granjero.position()).filter({ obj => obj != granjero })
    }

    method cultivoActual() {
        return self.objetosSinGranjero().first()
    }


method sePuedeSembrarAca(){
	return self.estaPosicionEstaVacia()
}

}