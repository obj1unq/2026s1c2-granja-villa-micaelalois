import personaje.*
import cultivos.*
import wollok.game.*


object granja{

method estaPosicionEstaVacia(){
	return game.getObjectsIn(granjero.position()).size() <= 1
}


method hayAlgoParaRegarAca() {

	if(!self.estaPosicionEstaVacia()){
        return self.cultivoActual().estado().estaListoParaRegar()
    } else { return false}
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