function formatar(mascara, documento){
    var i = documento.value.length;
    var masc = mascara[i];

    if (masc != '#'){
        documento.value += masc.substring(0,1);
    }
}