from django.shortcuts import render, redirect, get_object_or_404

# import models
from .models import Cliente, Produto, Endereco

# Conversão para Json
from django.core import serializers

# Formualario do Cliente
from .forms import ClientForm, EnderecoForm

# Paginator
from django.core.paginator import Paginator
    

# Create your views here.

# view da tela inicial 
def home(request):
    # Salvar dados editados
    if request.method == 'POST':
        id = request.POST['pk']
        cliente = get_object_or_404(Cliente, pk=id)
        end = get_object_or_404(Endereco, cod_cliente=id)
        
        formEnd = EnderecoForm(request.POST, instance=end)
        form = ClientForm(request.POST, instance=cliente)
        if form.is_valid():
            form.save()
        if formEnd.is_valid():
            formEnd.save()

    # pesquisa de produto e nome
    busca = request.GET.get('search')
    if busca:
        if request.GET.get('filtro') == 'Cliente':
            users = Cliente.objects.filter(nome__contains=busca)
       
        elif request.GET.get('filtro') == 'Produto':
            users = Produto.objects.filter(nome__contains=busca)      
       
        else:
            users = Cliente.objects.filter(nome__contains=busca)

    # requisicao normal
    else:
        users = Cliente.objects.all().order_by("-created_at")[0:5]
    
    # pegando enderecos dos usuarios e convertendo como JSON
    enderecos = []
    for x in users:
        result = Endereco.objects.filter(cod_cliente=x.id)
        enderecos.append(serializers.serialize('json', result))

    
    json = serializers.serialize('json', users)
    return render(request, 'index/home.html', {'users': users, 'json':json, 'enderecos':enderecos})


# View de cadastro do cliente
def addClient(request):
    if request.method == 'POST':
        formClient = ClientForm(request.POST)
        formEnd = EnderecoForm(request.POST)
        formClient.nome = 'teste'

        if formClient.is_valid() and formEnd.is_valid():
            formClient.save()
            codClient = Cliente.objects.latest('pk')
            endereco = formEnd.save(commit=False)
            endereco.cod_cliente = codClient
            endereco.save()
            
            return redirect("/")

    return render(request, 'index/cadastro.html')


#view da tela de vandas
def sales(request):
    return render(request, 'index/vendas.html')



# view da tela de cadastro de venda
def new(request):
    return render(request, 'index/nova_venda.html')


# Deletar User
def deleteCliente(request, pk):
    cliente = get_object_or_404(Cliente, pk=pk)
    cliente.delete()

    return redirect('/')