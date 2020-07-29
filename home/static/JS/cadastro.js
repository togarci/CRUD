function limpa_formulário_cep() {
    //Limpa valores do formulário de cep.
    document.getElementById('endereco').value=("");
    document.getElementById('bairro').value=("");
    document.getElementById('cid').value=("");
    document.getElementById('est').value=("");

};

function meu_callback(conteudo) {
    if (!("erro" in conteudo)) {
        //Atualiza os campos com os valores.
        document.getElementById('endereco').value=(conteudo.logradouro);
        document.getElementById('bairro').value=(conteudo.bairro);
        document.getElementById('cid').value=(conteudo.localidade);
        document.getElementById('est').value=(conteudo.uf);

        document.getElementById('endereco').disabled=false;
        document.getElementById('bairro').disabled=false;
        document.getElementById('cid').disabled=false;
        document.getElementById('est').disabled=false;
    } //end if.
    else {
        //CEP não Encontrado.
        limpa_formulário_cep();
        alert("CEP não encontrado.");
    }
};

function pesquisarCep(get) {
    var valor = '';
    for(var x in get){
        if(Number(get[x]) % 1 == 0) valor = valor + get[x];
    }
    //Nova variável "cep" somente com dígitos.
    var cep = valor.replace(/\D/g, '');

    //Verifica se campo cep possui valor informado.
    if (cep != "") {
        document.getElementById('endereco').disabled=true;
        document.getElementById('bairro').disabled=true;
        document.getElementById('cid').disabled=true;
        document.getElementById('est').disabled=true;
        //Expressão regular para validar o CEP.
        var validacep = /^[0-9]{8}$/;

        //Valida o formato do CEP.
        if(validacep.test(cep)) {
            //Cria um elemento javascript.
            var script = document.createElement('script');

            //Sincroniza com o callback.
            script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

            //Insere script no documento e carrega o conteúdo.
            document.body.appendChild(script);

        } //end if.
        else {
            //cep é inválido.
            limpa_formulário_cep();
            alert("Formato de CEP inválido.");
        }
    } //end if.
    else {
        //cep sem valor, limpa formulário.
        limpa_formulário_cep();
    }
};

function Submit(){
    cep = document.querySelector('#cep');
    ndoc = document.querySelector('#n_doc');

    cep.value = cep.value.split('.').join('');
    cep.value = cep.value.split('-').join('');
    ndoc.value = ndoc.value.split('-').join('');
    ndoc.value = ndoc.value.split('.').join('');

    document.querySelector("#form").submit();
}