import personaje.*
import cultivos.*
import wollok.game.*


object granja{
const property mercados = [new Mercado(position = game.at(8, 8), monedas = 400),
     new Mercado(position = game.at(1, 1), monedas = 3000)]
method esPosibleCosecharAca(){
    return (!self.estaPosicionEstaVacia() && self.cultivoActual().estaListoParaCosechar())
}


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


class Mercado {
    var property position = game.at(0, 0)
    var property monedas = 0
    const property mercaderia = [] 
    
    method estaListoParaRegar(){
        return false
    }
    
    method image() = "market.png"
    
    method tienePlataSuficiente(monto) {
        return monedas >= monto
    }
    
    method comprarCosecha(plantas, totalAPagar) {
        monedas = monedas - totalAPagar
        mercaderia.addAll(plantas)
    }
}