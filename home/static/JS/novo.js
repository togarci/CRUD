var dataSale = {'Cod_Ven':'', 'Cod_Client':'', 'Cod_ProdVenda':1};
var prodVenda = {'Cod_ProVenda':1};

// Transinção de tela
function passStep(number){
    
    if((number >= 0) && (number <= 1)){
        if((number == 1) && (document.querySelector('#buttonResumo').style.display == 'flex')){
            document.querySelector('#main').style.visibility = 'visible';
            document.querySelector('#buttonResumo').style.display = 'none';
            document.querySelector('.resumo').style.width = '350px';
            document.querySelector('.resumo').style.transform = 'translateX(0%)';
        } else{
            var t = "translateX(-" + (number * 750) +"px)";
            // Muda de Container
            document.querySelector(".container-dados").style.transform = t;

            // Mudar do Step
            document.querySelectorAll(".ball")[number].style.backgroundColor = '#1B89EE';
            if(number < 2){
                document.querySelectorAll(".ball")[number + 1].style.backgroundColor = '#C4C4C4';
            }
        }
        
        
    } else if(number == 2){
        document.querySelector('#main').style.visibility = 'hidden';
        document.querySelector('#buttonResumo').style.display = 'flex';
        document.querySelector('#buttonResumo').style.marginTop = '80px';
        document.querySelector('.resumo').style.width = '70%';
        document.querySelector('.resumo').style.transform = 'translateX(-40%)';
    }
}

//Selecao de usuario
var elementUser
function selectUser(element){
    //Voltar Cor Original
    if(!elementUser){
        elementUser = element;
    }
    elementUser.style.backgroundColor = "#EFEFEF";
    elementUser.style.color = '#010B13'
    
    //Mudas Cor
    element.style.backgroundColor = '#1B89EE';
    element.style.color = '#FFFFFF';
    elementUser = element;
    
    //Add no resumo
    document.querySelector('#cliente').innerHTML = '<p class="word"><i class="far fa-user"></i>'+ element.children[1].outerText +'</p>';
}

// Selecao de Produto
valorTotal = 0;
function selectProduct(element, id){
    var valor = parseInt(element.children[3].children[0].outerText);
    var qtd = element.children[2].children[0].value

    if(element.className.match('mark') ){
        //Voltar Cor Original
        element.style.backgroundColor = '#EFEFEF';
        element.style.color = '#010B13';
        element.classList.remove('mark');
    
        // remover do resumo
        document.querySelector('.resumo').removeChild(document.getElementById(id));

        valorTotal -= (valor*qtd);

    } else {
        //Mudas Cor
        element.style.backgroundColor = '#1B89EE';
        element.style.color = '#FFFFFF';
        element.classList.add('mark');

        // Add no resumo 
        
        var EleProd = '<div id="'+ id +'" class="model-text flex"> <p class="word">Produto A x' + qtd + '</p> <p class="word">Valor: ' +  (valor * qtd) + '</p></div>'; 
        document.querySelector("#produto").insertAdjacentHTML('afterend', EleProd);

        valorTotal += (valor*qtd);
    }
    
    // Add Valor total no resumo 
    var text = 'Valor Total: ' + valorTotal;
    document.querySelector("#vlrTotal").innerText = text;
    
    
}
