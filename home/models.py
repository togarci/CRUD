from operator import mod
from django.db import models
from django.contrib.auth import get_user_model


# Create your models here.
class Vendedor(models.Model):
    SEXO = (
        ("masculino", "masculino"),
        ("feminino", "feminino"),
    )

    nome = models.CharField( max_length = 100 )
    idade = models.IntegerField()
    sexo = models.CharField( max_length = 9 , choices=SEXO )
    n_doc = models.IntegerField()
    
    def __str__(self):
        return self.nome

class Cliente(models.Model):
    SEXO = (
        ("masculino", "masculino"),
        ("feminino", "feminino"),
    )
    
    nome = models.CharField( max_length = 100 )
    idade = models.IntegerField()
    sexo = models.CharField( max_length = 9 , choices=SEXO, )
    n_doc = models.CharField( max_length = 14 )
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)
    
    def __str__(self):
        return self.nome

class Endereco(models.Model):
    cod_cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    endereco = models.CharField( max_length = 150 )
    bairro = models.CharField( max_length = 100 )
    cid = models.CharField( max_length = 100 )
    est = models.CharField( max_length = 50 )
    cep = models.IntegerField()

    
    def __str__(self):
        return self.endereco


class Produto(models.Model):
    nome = models.CharField( max_length = 100 )
    valor = models.IntegerField()
    
    def __str__(self):
        return self.nome

class Venda(models.Model):
    cod_vendedor = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    cod_produto = models.ForeignKey(Produto, on_delete=models.DO_NOTHING)
    cod_cliente = models.ForeignKey(Cliente, on_delete=models.DO_NOTHING)
    valorTotal = models.IntegerField()

    def __str__(self):
        return str(self.id )
class Prod_Venda(models.Model):
    cod_venda = models.ForeignKey(Venda, on_delete=models.CASCADE)
    cod_produto = models.ForeignKey(Produto, on_delete=models.DO_NOTHING)
    qtd = models.IntegerField()
    valor = models.IntegerField()
    