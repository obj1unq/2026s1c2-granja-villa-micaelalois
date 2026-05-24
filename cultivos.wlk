import wollok.game.*
import personaje.* 

class Maiz {
 var property estado = semillaMaiz
 var property position = game.at(1, 1)


	method cambiaEstadoAListoParaSembrar(){
	self.estado(semillaMaiz)
	}


	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return estado.imagen()
	}
	
	method esCultivo(){
		return true
	}

    method crecer() {
         estado.siguienteEstado()
    }

	method estaListoParaCosechar(){
		return self.estado()
	}
	

}

class Trigo {
	 var property estado = etapaDeEvolucion0
     var property position = game.at(1, 1)


	method cambiaEstadoAListoParaSembrar(){
	self.estado(etapaDeEvolucion0)
	}
	
	
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_1.png"
	}
	method esCultivo(){
		return true
	}
	method crecer() {
         estado.siguienteEstado()
    }
	
}

class Tomaco {
	 var property estado = tomacoRecienPlantado
	  var property position = game.at(1, 1)



	method cambiaEstadoAListoParaSembrar(){
	self.estado(tomacoRecienPlantado)
	}
	
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}
	method esCultivo(){
		return true
	}
	method crecer() {
         estado.siguienteEstado()
    }
}




// Estados del maíz// 
object semillaMaiz { 

method estaListoParaSembrar(){
	return true
}
method imagen() {
	return "corn_baby.png" 
	}

method siguienteEstado(){
	return maizAdulta
}
method estaListoParaCosechar(){
		return false
	}
}



object maizAdulta { 
    method imagen(){

	return "corn_adult.png" 
	}
    method siguienteEstado(){
		return self
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

method estaListoParaSembrar(){
	return true
}
method image(){

	return "wheat_0.png" 
}

method siguienteEstado(){
	return etapaDeEvolucion1
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
	method siguienteEstado(){
		return etapaDeEvolucion2
	}

	method estaListoParaCosechar(){
			return false
		}
}



object etapaDeEvolucion2{

	method estaListoParaSembrar(){
		return false
	}
	method image(){

		return "wheat_2.png" 
	}
	method siguienteEstado(){
		return etapaDeEvolucion3
	}

	method estaListoParaCosechar(){
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
	method siguienteEstado(){
		return etapaDeEvolucion0
	}

	method estaListoParaCosechar(){
			return true
		}
}




//Estados del tomaco//

object tomacoRecienPlantado{

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
	method estaListoParaCosechar(){
		return true
	}
	method estaListoParaSembrar(){
	return false
	}
}
