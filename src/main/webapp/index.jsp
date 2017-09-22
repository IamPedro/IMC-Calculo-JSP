<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>IMC</title>

    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <form>    
	    <div class="container-fluid"> 
	        <div class="jumbotron">
	            <h1>IMC</h1>
	        </div>            
	        
	
	        <div class="row">
	            <div class="col-md-4">
	                <label for="peso">Peso:</label>    
	                <input type="number" id="peso" name="peso_usuario" step="0.01" min="1" value="1" required autofocus>        
	            </div>
	
	            <div class="col-md-4">
	                <label for="altura">Altura:</label>
	                <input type="number" id="altura" name="altura_usuario" step="0.01" min="1" value="1" required>                
	            </div>
	            
	            <div class="col-md-4">
	                <h4>Sexo</h4>
	                <select id="sexo" name="sexo_usuario" class="form-control">
	                    <option value="Masculino">Masculino</option>
	                    <option value="Feminino">Feminino</option>
	                </select>
	            </div>
	            <button type="submit" class="btn btn-default">Resultado</button>
	        </div>            
	           
	    </div>            
	</form>

	<%
	
	
	// Inicio do Scriplet
	String S_peso, S_altura, sexo;
	float peso, altura, imc;
	
	S_peso = request.getParameter("peso_usuario");
	S_altura = request.getParameter("altura_usuario");
	sexo = request.getParameter("sexo_usuario");
		
	if(S_peso == null || S_altura == null || sexo == null)
	{
		out.print("Favor preencher todos os campos");		
	}	
	else
	{
	
		peso = Float.parseFloat(S_peso);
		altura = Float.parseFloat(S_altura);		
		
	
		if(peso < 1 || altura < 1)	
		{
			out.print("Valores menores que 1 sao invalidos");
			return;
		}		
	
		imc = peso/(altura*altura);
		//imc = parseFloat(imc.toFixed(2));
	
		if (sexo.equals("Masculino") == true)
		{
			if(imc < 20.7)
				out.print("Seu IMC eh: "+imc + " e voce esta abaixo do peso");
			else if(imc >= 20.7 && imc < 26.4)
				out.print("Seu IMC eh: "+imc + " e voce esta no peso normal");
			else if(imc >= 26.4 && imc < 27.8)
				out.print("Seu IMC eh: "+imc + " e voce esta marginalmente acima do peso");
			else if(imc >= 27.8 && imc < 31.1)
				out.print("Seu IMC eh: "+imc + " e voce esta acima do peso ideal");
			else
				out.print("Seu IMC eh: "+imc + " e voce esta obeso");
		}
		else if(sexo.equals("Feminino") == false)
		{
			if(imc < 19.1)
				out.print("Seu IMC eh: "+imc + " e voce esta abaixo do peso");
			else if(imc >= 19.1 && imc < 25.8)
				out.print("Seu IMC eh: "+imc + " e voce esta no peso normal");
			else if(imc >= 25.8 && imc < 27.3)
				out.print("Seu IMC eh: "+imc + " e voce esta marginalmente acima do peso");
			else if(imc >= 27.3 && imc < 32.3)
				out.print("Seu IMC eh: "+imc + " e voce esta acima do peso ideal");
			else
				out.print("Seu IMC eh: "+imc + " e voce esta obeso");
	
		}		
	}		
	
	%>   
        
    

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
</html>