public aspect VerificarSesion {	
    //pointcut Cliente(): call(* Clientes.consultar(..)); 
    pointcut Producto(): call(* Producto.consultar(..)); 
    pointcut Cliente(): call(* Clientes.consultar(..)); 


  //Advices. Se ejecutarán en el lugar indicado por el pointcut.
    before() : Producto() {
    	System.out.println("Holi");
    	if(!IniciarSesion.sesionIniciada) {
    		IniciarSesion.initialize();}
    }; 
    
    before() : Cliente() {
    	System.out.println("Holi");
    	if(!IniciarSesion.sesionIniciada) {
    		IniciarSesion.initialize();}
    };
    
    after() : Cliente(){
    	if(!IniciarSesion.sesionIniciada) {
    		Clientes.mensaje.setVisible(false);	}
    };
    
    after() : Producto(){
    	if(!IniciarSesion.sesionIniciada) {
    		Producto.mensaje.setVisible(false);	}
    	
    };
        //Ya se inició sesión. (Puede imprimir un mensaje)
    }  
