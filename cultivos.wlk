import wollok.game.*
import personaje.* 
import granja.*



class Aspersor{
	var property position = game.at(1, 1)


	method estaListoParaRegar() {
        return false 
    }
	method estaListoParaCosechar() {
        return false 
    }
    
    method crecer() {
        
    }
	method image(){
		return "aspersor.png"
	}
	method regarPlantasAlrededor(){
		self.regarPlantaHaciaLaIzquierdaSiSePuede()
		self.regarPlantaHaciaLaDerechaSiSePuede()
		self.regarPlantaHaciaArribaSiSePuede()
		self.regarPlantaHaciaAbajoSiSePuede()

      
	}

	method  regarPlantaHaciaLaIzquierdaSiSePuede(){
        if(self.position().x() > 0){
			self.regarPlantaHaciaLaIzquierda()

		}
	}

	method regarPlantaHaciaLaIzquierda(){
		self.regarPorAspersorEnPosicion(game.at(self.position().x() -1, self.position().y()))
	}

	method regarPorAspersorEnPosicion(positionPlanta){
		 const objetosEnEsaPosicion = game.getObjectsIn(positionPlanta)
        const cultivosEncontrados = objetosEnEsaPosicion.filter({ obj => obj != granjero })
        
        if (!cultivosEncontrados.isEmpty() && cultivosEncontrados.first().estaListoParaRegar()) {
            cultivosEncontrados.first().crecer()

	}
	}
	method regarPlantaHaciaLaDerechaSiSePuede(){
		  if(self.position().x() < 9){
			self.regarPlantaHaciaLaDerecha()
	    }

	}
	method  regarPlantaHaciaLaDerecha(){
		self.regarPorAspersorEnPosicion(game.at(self.position().x() + 1, self.position().y()))
	}



	method regarPlantaHaciaArribaSiSePuede(){
		 if(self.position().y() < 9){
			self.regarPlantaHaciaArriba()
	    }

	}

	method regarPlantaHaciaArriba(){
	self.regarPorAspersorEnPosicion(game.at(self.position().x(), self.position().y()+1))

	}
	
	method regarPlantaHaciaAbajoSiSePuede(){
		 if(self.position().y() >0){
			self.regarPlantaHaciaAbajo()
	    
	}

	}

	method regarPlantaHaciaAbajo(){
	self.regarPorAspersorEnPosicion(game.at(self.position().x(), self.position().y()-1))

	}
	
}
class Maiz {
 var property estado = semillaMaiz
 var property position = game.at(1, 1)

	method valorDeVenta(){
		return 150 
	}

	method estaListoParaCosechar(){
		return estado.estaListoParaCosechar()

	}

	method estaListoParaRegar(){
		return estado.estaListoParaRegar()
	}

	method cambiaEstadoAListoParaSembrar(){
		self.estado(semillaMaiz)
	}


	method image() {
		return estado.imagen()
	}

    method crecer() {
         estado.siguienteEstado(self)
    }


	

}

class Trigo {
	 var property estado = etapaDeEvolucion0
     var property position = game.at(1, 1)

	method valorDeVenta(){
		return (estado.nroDeEtapa() - 1) * 100
	}
    method estaListoParaCosechar(){
		return estado.estaListoParaCosechar()
	}

	method estaListoParaRegar(){
		return estado.estaListoParaRegar()
	}


	method cambiaEstadoAListoParaSembrar(){
		self.estado(etapaDeEvolucion0)
	}
	
	
	method image() {
		return estado.image()
	}
	
	method crecer() {
         estado.siguienteEstado(self)
    }
	
}

class Tomaco {
	var property estado = tomacoRecienPlantado
	var property position = game.at(1, 1)


	method valorDeVenta(){
		return 80
	}

	method estaListoParaCosechar(){
		return estado.estaListoParaCosechar()
	}

	method estaListoParaRegar(){
		return estado.estaListoParaRegar()
	}

	method cambiaEstadoAListoParaSembrar(){
		self.estado(tomacoRecienPlantado)
	}
	
	method image() {

		return estado.image()
	}
	
	method crecer() {
         estado.siguienteEstado(self)

    }
}




// Estados del maíz// 
object semillaMaiz { 

	method estaListoParaRegar(){
		return true
	}
	method estaListoParaSembrar(){
		return true
	}
	method imagen() {
		return "corn_baby.png" 
	}

	method siguienteEstado(planta){
		planta.estado(maizAdulta)
	}
	method estaListoParaCosechar(){
		return false
	}

}



object maizAdulta { 
    method imagen(){

		return "corn_adult.png" 
	}

	method estaListoParaRegar(){
		return false 
	}
    method siguienteEstado(planta){
		return planta
	}
	method estaListoParaCosechar(){
		return true
	}

	method estaListoParaSembrar(){
		return false 
	}
}
//Estados del trigo//

object etapaDeEvolucion0{

	method nroDeEtapa(){
		return 0
	}

	method estaListoParaRegar(){
		return true
    }
	method estaListoParaSembrar(){
		return true
    }
	method image(){
		return "wheat_0.png" 
    }
	method siguienteEstado(planta){
		planta.estado(etapaDeEvolucion1)
    }
	method estaListoParaCosechar(){
		return false
	}

}

object etapaDeEvolucion1{

	method nroDeEtapa(){
		return 1
	}

	method estaListoParaSembrar(){
		return  false
	}
	method image(){

		return "wheat_1.png" 
	}
	method siguienteEstado(planta){
	planta.estado(etapaDeEvolucion2)
	}

	method estaListoParaCosechar(){
		return false
	}
	method estaListoParaRegar(){
		return true
    }
}



object etapaDeEvolucion2{

	method nroDeEtapa(){
		return 2
	}

	method estaListoParaSembrar(){
		return false
	}
	method image(){

		return "wheat_2.png" 
	}
	method siguienteEstado(planta){
		 planta.estado(etapaDeEvolucion3)
	}

	method estaListoParaCosechar(){
		return true
	}
	method estaListoParaRegar(){
		return true
}
}

object etapaDeEvolucion3{

	method nroDeEtapa(){
		return 3
	}

	method estaListoParaSembrar(){
			return false
	}	
	method image(){

			return "wheat_3.png" 
	}
	method siguienteEstado(planta){
		planta.estado(etapaDeEvolucion0)
	}

	method estaListoParaCosechar(){
			return true
		}
	method estaListoParaRegar(){
			return true
}
}




//Estados del tomaco//

object tomacoRecienPlantado{

	method siguienteEstado(planta) {
        planta.estado(tomacoCrecido)
        
        if (planta.position().y() < 9) {
            planta.position(game.at(planta.position().x(), planta.position().y() + 1))
        } else {
            planta.position(game.at(planta.position().x(), 0))
        }
    }


	method estaListoParaRegar(){
		return true
    }

	method estaListoParaSembrar(){
		return true
	}

	method image(){
		return "tomaco.png"
	}

	method estaListoParaCosechar(){
		return true
	}
}

object tomacoCrecido{
	method image(){
		
		return "tomaco.png"
	}

    method estaListoParaRegar(){
		return false
    }

	method siguienteEstado(planta) {
		planta.estado(self)
	
	}

	method moverHaciaArriba(planta){

	}
	method estaListoParaCosechar(){
		return true
	}
	method estaListoParaSembrar(){
		return false
	}
}
