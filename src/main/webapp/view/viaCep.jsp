<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Teste</title>
</head>

<body>
	<!--Importando Script Jquery-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<!--Formul�rio-->
	<form>
		<label for="cep">CEP</label>
		<input id="cep" type="text" required/>
		<label for="logradouro">Logradouro</label>
		<input id="logradouro" type="text" required/>
		<label for="numero">N�mero</label>
		<input id="numero" type="text" />
		<label for="cidade">Cidade</label>
		<input id="cidade" type="text"/>
		<label for="bairro">Bairro</label>
		<input id="bairro" type="text" required/>
		<label for="uf">Estado</label>
		<select id="uf">
			<option value="AC">Acre</option>
			<option value="AL">Alagoas</option>
			<option value="AP">Amap�</option>
			<option value="AM">Amazonas</option>
			<option value="BA">Bahia</option>
			<option value="CE">Cear�</option>
			<option value="DF">Distrito Federal</option>
			<option value="ES">Esp�rito Santo</option>
			<option value="GO">Goi�s</option>
			<option value="MA">Maranh�o</option>
			<option value="MT">Mato Grosso</option>
			<option value="MS">Mato Grosso do Sul</option>
			<option value="MG">Minas Gerais</option>
			<option value="PA">Par�</option>
			<option value="PB">Para�ba</option>
			<option value="PR">Paran�</option>
			<option value="PE">Pernambuco</option>
			<option value="PI">Piau�</option>
			<option value="RJ">Rio de Janeiro</option>
			<option value="RN">Rio Grande do Norte</option>
			<option value="RS">Rio Grande do Sul</option>
			<option value="RO">Rond�nia</option>
			<option value="RR">Roraima</option>
			<option value="SC">Santa Catarina</option>
			<option value="SP">S�o Paulo</option>
			<option value="SE">Sergipe</option>
			<option value="TO">Tocantins</option>
		</select>
	</form>
	
	<script type="text/javascript">
		$("#cep").focusout(function(){
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
					$("#logradouro").val(resposta.logradouro);
					$("#complemento").val(resposta.complemento);
					$("#bairro").val(resposta.bairro);
					$("#cidade").val(resposta.localidade);
					$("#uf").val(resposta.uf);
					//Vamos incluir para que o N�mero seja focado automaticamente
					//melhorando a experi�ncia do usu�rio
					$("#numero").focus();
				}
			});
		});
	</script>
</body>
</html>