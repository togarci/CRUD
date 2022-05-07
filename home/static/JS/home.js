var idDelete = null;


function submit(){
    document.querySelector('#search').submit();
}

function showModal(deleteModal) {
    // scroll da pagina e posicionamento da modal
    var valueScroll = window.scrollY + 'px';
    modal = deleteModal 
        ? document.querySelectorAll('.screen-modal')[1]
        : document.querySelectorAll('.screen-modal')[0];
        
    modal.style.top = valueScroll;
    document.body.style.overflowY = 'hidden';

    // Fazer modal visivel
    modal.style.display = 'flex';
}


function toggleModal(id, deleteModal){
    if(id && !deleteModal) {
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

        showModal();
    } else {
        let modal = document.querySelectorAll('.screen-modal');
        if ((modal[0].style.display === 'flex') || (modal[1].style.display === 'flex')) {
            modal[0].style.display = 'none';
            modal[1].style.display = 'none';
            document.body.style.overflowY = 'auto';
        } else {
            showModal(deleteModal);
            if (id) document.querySelector('#pk').value = id;
        }
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