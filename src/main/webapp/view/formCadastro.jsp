<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="pear.model.Usuario"%>
<c:url value="/pear" var="linkEntradaServlet" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formul�rio</title>

<style>
label {
	display: block;
	float: left;
}

label, input {
	width: 100px;
	margin: 3px 0;
}

input {
	width: 150px;
}
</style>
</head>
<body>
<header><c:import url="header.jsp" /></header>
	<div class="card">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<h1>Formul�rio de Cadastro</h1>
		<div class="container-form">
			<form action="${linkEntradaServlet}" method="post">
				<fieldset>
					<div class="label-container">
						<label for='client-login'>Login: </label> <input id='client-login'
							placeholder="Login" name="login" required>
					</div>
					<div class="label-container">
						<label for='client-password'>Senha: </label> <input
							id='client-password' placeholder="Senha" name="senha"
							type="password" required>
					</div>
					<div class="label-container">
						<label for='destiny'>CEP: </label> <input id='destiny'
							placeholder="CEP" name="CEP" type="text"
							pattern=[0-9]{8} required>
					</div>
					<div class="label-container">
						<label for='client-street'>Rua: </label> <input id='client-street'
							placeholder="Rua" name="rua" required>
					</div>
					<div class="label-container">
						<label for='client-housenumber'>N�mero: </label> <input
							id='client-housenumber' placeholder="Numero" name="numero"
							type="number" required>
					</div>
					<div class="label-container">
						<label for='client-district'>Bairro: </label> <input id='client-district'
							placeholder="Bairro" name="bairro" required>
					</div>
					<div class="label-container">
						<label for='client-city'>Cidade: </label> <input id='client-city'
							placeholder="Cidade" name="cidade" required readonly>
					</div>
					<div class="label-container">
						<label for='client-state'>Estado: </label> <input
							id='client-state' placeholder="Estado" name="estado" required readonly>
					</div>
					<div class="label-container">
						<input type="hidden" name=acao value=Cadastro> <input
							type="submit" value="Cadastrar">
					</div>
					<div class="label-container">
						<a href="${linkEntradaServlet}?acao=TelaLogin"> Voltar </a>
					</div>
				</fieldset>
			</form>
			
			<script type="text/javascript">
		$("#destiny").focusout(function(){
			//In�cio do Comando AJAX
			$.ajax({
				//O campo URL diz o caminho de onde vir� os dados
				//� importante concatenar o valor digitado no CEP
				url: 'https://viacep.com.br/ws/'+$(this).val()+'/json/unicode/',
				//Aqui voc� deve preencher o tipo de dados que ser� lido,
				//no caso, estamos lendo JSON.
				dataType: 'json',
				//SUCESS � referente a fun��o que ser� executada caso
				//ele consiga ler a fonte de dados com sucesso.
				//O par�metro dentro da fun��o se refere ao nome da vari�vel
				//que voc� vai dar para ler esse objeto.
				success: function(resposta){
					//Agora basta definir os valores que voc� deseja preencher
					//automaticamente nos campos acima.
					if (("erro" in resposta)) {
						alert("Digite um CEP valido!")
						$("#destiny").val(resposta.destiny);
					}
					$("#client-street").val(resposta.logradouro);
					$("#complemento").val(resposta.complemento);
					$("#client-district").val(resposta.bairro);
					$("#client-city").val(resposta.localidade);
					$("#client-state").val(resposta.uf);
					
					//Vamos incluir para que o N�mero seja focado automaticamente
					//melhorando a experi�ncia do usu�rio
					$("#numero").focus();
				}

				
			});
		});
	</script>
		</div>
	</div>
</body>
</html>