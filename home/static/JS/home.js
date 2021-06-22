function submit(){
    document.querySelector('#search').submit();
}

function toggleModal(id){
    if(document.querySelector('.screen-modal').style.display == 'flex'){
        // sumir com a modal e voltar scroll da pagina
        document.querySelector('.screen-modal').style.display = 'none';
        document.body.style.overflowY = 'auto';

    } else if(id) {
        // inserir dados do usuário da id na modal
        for(var x = 0; x != users.length; x++){
            if(users[x].pk == id){
                document.querySelector('#pk').value = users[x].pk;
                for(y in users[x].fields){
                    if((!y.match('created_at')) && (!y.match('updated_at')))
                        document.getElementById(y).value = users[x].fields[y];
                }
            }
        }
        if(users[0].model == 'home.cliente'){
            // inserir dados de endereco do usuário da id da modal 
            for(var x = 0; x < enderecos.length; x++){
                if(enderecos[x].fields.cod_cliente == id){
                    for(y in enderecos[x].fields){
                        if(!y.match('cod_cliente'))
                            document.getElementById(y).value = enderecos[x].fields[y];
                    }
                }
            }
        }

        // scroll da pagina e posicionamento da modal
        var valueScroll = window.scrollY + 'px';
        document.querySelector('.screen-modal').style.top = valueScroll;
        document.body.style.overflowY = 'hidden';

        // Fazer modal visivel
        document.querySelector('.screen-modal').style.display = 'flex';       
    }
}


window.onload = function(){
    window.addEventListener('click', function(e){
        var element = e.target;
        if(element.className.match('close')){
            toggleModal();
        }
    })
}

var flagEdit = false;
function edit(){
    if(flagEdit){
        document.querySelector('#edit').style.backgroundColor = "white";
        document.querySelector('#edit').style.color = '#1B89EE';
        var list = document.querySelectorAll('.input');
        for(var x = 0; x < list.length; x++){
            list[x].disabled = true;
        }
        flagEdit = false;
    } else {
        document.querySelector('#edit').style.backgroundColor = "#1B89EE";
        document.querySelector('#edit').style.color = 'white';
        var list = document.querySelectorAll('.input');
        for(var x = 0; x < list.length; x++){
            list[x].disabled = false;
        }
        flagEdit = true;
    }
}
function delCli(){
    var str = '/client/delete/' + document.getElementById('pk').value;
    window.location.href = str;
}

function delPro(){
    var str = '/produto/delete/' + document.getElementById('pk').value;
    window.location.href = str
}

var teste;
function teste(){
    fetch("https://viacep.com.br/ws/12323420/json/?callback=meu_callback", {
        method: "GET",
    })
    .then(function(response) { 
        // response.JSON()
        response.text()
        .then(function(result){ 
          teste = result;
        })
      })
    .catch(function(err) { console.error(err); })
     
}