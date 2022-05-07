function formatar(mascara, documento){
    var i = documento.value.length;
    var masc = mascara[i];

    if (masc != '#'){
        documento.value += masc.substring(0,1);
    }
}

function convertToMoneyValue(field) {
    let value = Number(field.value);
    value = value.toFixed(2);
    field.value = value;
}