import wollok.game.*

object personaje {
	/*const posicion = game.at(10,6)*/
	const posicion = game.at(2,0)
	var imagen = "1.png"
	var poder = 150
	var vida = 100
	var diamantes = []
	
	method equipar(algo) {
		algo.equiparse(self)
	}
	
	method imagen() {
		return imagen
	}
	
	method modificarImagen(unaImagen) {
		imagen = unaImagen
	}
	
	method configuracion() {
	//	CONFIGURACIÓN DEL JUEGO
		game.title("Mundo Medieval")
		game.height(12)
		game.width(20)
		
		
		game.ground("9510.bmp")		
		
		new Position(8,0).drawElement(mapa1)
		new Position(8,2).drawElement(mapa1)
		/*new Position(10,0).drawElement(mapa2)
		new Position(10,2).drawElement(mapa2)
		new Position(6,0).drawElement(mapa3)
		new Position(6,2).drawElement(mapa3)
		new Position(5,4).drawElement(mapa4)
		new Position(7,4).drawElement(mapa4)
		new Position(9,4).drawElement(mapa4)
		new Position(13,4).drawElement(mapa4)
		new Position(15,4).drawElement(mapa4)
		new Position(17,4).drawElement(mapa4)
		new Position(3,4).drawElement(mapa4)*/
		new Position(3,6).drawElement(mapa1)
		new Position(5,6).drawElement(mapa1)
		new Position(7,6).drawElement(mapa1)
		new Position(9,6).drawElement(mapa1)
		new Position(11,6).drawElement(mapa1)
		new Position(13,6).drawElement(mapa1)
		new Position(15,6).drawElement(mapa1)
		new Position(17,6).drawElement(mapa1)
		/*new Position(3,8).drawElement(mapa5)
		new Position(5,8).drawElement(mapa5)
		new Position(7,8).drawElement(mapa5)
		new Position(9,8).drawElement(mapa5)
		new Position(11,8).drawElement(mapa5)
		new Position(13,8).drawElement(mapa5)
		new Position(15,8).drawElement(mapa5)
		new Position(17,8).drawElement(mapa5)
		*/
	 	new Position(13,6).drawElement(dragon)
	 	new Position(13,0).drawElement(diamante)
	 	new Position(18,2).drawElement(diamanteVerde)
	 	
		DOWN.onPressDo{ posicion.moveDown(1) }
	    UP.onPressDo{ posicion.moveUp(1) }
	    RIGHT.onPressDo{ posicion.moveRight(1) }
	    LEFT.onPressDo{ posicion.moveLeft(1) }	
	    
	    /* metodo para interactuar con objetos */
	    SPACE.onPressDo { 
		const colliders = game.colliders(self)
		if (colliders.isEmpty()) 
			throw new Exception("Seguire caminando")
		colliders.head().interactua(self)
	}
	}
	
	method aumentarPoder(cantidad){
		poder+= cantidad
	}
	
	method aumentarVida(cantidad){
		vida+=cantidad
	}
	
	method perderVida(cantidad){
		vida-=cantidad
	}
	
	method completarVidaAlTotal(){
		vida=100
	}
	
	method vida() = vida
	
	method conocerLaVidaquePierde(){
		return 100 - vida
	}
	
	method adquirirElemento(elem){
		elem.modificarPersonaje(self)
	}
	
	method agregarUnDiamante(diamt){
		diamantes.add(diamt)
	}
	
	method diamantes() = diamantes

	method atacar(adversario){}
}

object mapa1 {
		var imagen = "9511.png"
		
		var posicion
	 	
	 	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	 	
	 	method imagen() = imagen
		
}

object mapa2 {
		var imagen = "9518.bmp"
		
		var posicion
	 	
	 	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	 	 method imagen() = imagen
}

object mapa3 {
		var imagen = "9517.bmp"
		
		var posicion
	 	
	 	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	 	 method imagen() = imagen
}

object mapa4 {
		var imagen = "9515.bmp"
		
		var posicion
	 	
	 	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	  	method imagen() = imagen
}

object mapa5 {
		var imagen = "9516.bmp"
		
		var posicion
	 	
	 	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	  	method imagen() = imagen
}

object dragon {
		var imagen = "dragon.png"
	 	var posicion
	 	
	 	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	  	method imagen() = imagen
	 	
}

object armadura {
	method equiparse(alguien) {
		alguien.modificarImagen("armadura.png")
	}
}


object daga {

	method equiparse(unPersonaje) {
		unPersonaje.modificarImagen("daga.png")
	}
}

object casco {
	method equiparse(alguien) {
		alguien.modificarImagen("casco.png")
	}
}

object diamante{
	var imagen="diamanteP.png"
	var posicion
	
	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	
	method imagen() = imagen
}

object diamanteVerde{
	var imagen="verde.png"
	var posicion
	method posicion(unaPosicion) {
	 		posicion = unaPosicion
	 		unaPosicion.clear()
	 	}
	
	method imagen() = imagen
	
	method modificarPersonaje(personaje){
		if(personaje.conocerLaVidaquePierde() < 10){
			personaje.completarVidaAlTotal()
			personaje.agregarUnDiamante(self)
			
		}
		personaje.aumentarVida(10)
		personaje.agregarUnDiamante(self)
		
	}
	
	method interactua(personaje) { personaje.adquirirElemento(self) }
}


