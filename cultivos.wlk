import wollok.game.*
import personaje.* 
import granja.*

class Maiz {
 var property estado = semillaMaiz
 var property position = game.at(1, 1)

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

	method estaListoParaCosechar(){
		return self.estado()
	}
	

}

class Trigo {
	 var property estado = etapaDeEvolucion0
     var property position = game.at(1, 1)


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
		 game.removeVisual(self)

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
        const posicionActual = planta.position()
        var nuevaY = posicionActual.y() + 1
        
        if (nuevaY >= game.height()) {
            nuevaY(0)
        }
        
        planta.position(game.at(posicionActual.x(), nuevaY))
		game.addVisual(planta.position())
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
