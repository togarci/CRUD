from django import forms
from .models import Cliente, Endereco, Venda, Produto

class ClientForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ('nome', 'idade', 'sexo', 'n_doc')


class EnderecoForm(forms.ModelForm):
    class Meta:
        model = Endereco
        fields = ('endereco', 'bairro', 'cid', 'est', 'cep')

class ProductForm(forms.ModelForm):
    class Meta:
        model = Produto
        fields = ('nome', 'valor')