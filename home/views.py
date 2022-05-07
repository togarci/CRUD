from django.shortcuts import render, redirect, get_object_or_404

from django.http import JsonResponse

# import models
from .models import Cliente, Produto, Endereco, Venda

# Conversão para Json
from django.core import serializers

# Formualario do Cliente
from .forms import ClientForm, EnderecoForm, ProductForm

# Paginator
from django.core.paginator import Paginator


# Create your views here.

# view da tela inicial
def home(request):
    tipo = 'user'

    # pesquisa de produto e nome
    busca = request.GET.get('search')
    filtro = request.GET.get('filter')
    if busca or filtro:
        if request.GET.get('filter') == 'Cliente':
            users = Cliente.objects.filter(nome__contains=busca)

        elif request.GET.get('filter') == 'Produto':
            users = Produto.objects.filter(nome__contains=busca)
            tipo = 'product'

        else:
            users = Cliente.objects.filter(nome__contains=busca)

    # requisicao normal
    else:
        users = Cliente.objects.all().order_by("-created_at")

    # pegando enderecos dos usuarios e convertendo como JSON
    enderecos = []
    for x in users:
        result = Endereco.objects.filter(cod_cliente=x.id)
        enderecos.append(serializers.serialize('json', result))

    paginator = Paginator(users, 5)
    page = request.GET.get('page')
    users = paginator.get_page(page)
    json = serializers.serialize('json', users)

    return render(request, 'index/home.html', {'users': users, 'json':json, 'enderecos':enderecos, 'tipo': tipo})








# View de cadastro do cliente
def addClient(request):
    if request.method == 'POST':
        formClient = ClientForm(request.POST)
        formEnd = EnderecoForm(request.POST)

        if formClient.is_valid() and formEnd.is_valid():
            formClient.save()
            codClient = Cliente.objects.latest('pk')
            endereco = formEnd.save(commit=False)
            endereco.cod_cliente = codClient
            endereco.save()

            return redirect("/")

    return render(request, 'index/cadastro.html')

# Deletar Cliente
def deleteCliente(request, pk):
    cliente = get_object_or_404(Cliente, pk=pk)
    cliente.delete()

    return redirect('/')

# Editar Cliente
def editClient(request):
    id = request.POST['pk']
    cliente = get_object_or_404(Cliente, pk=id)
    end = get_object_or_404(Endereco, cod_cliente=id)

    formEnd = EnderecoForm(request.POST, instance=end)
    form = ClientForm(request.POST, instance=cliente)
    if form.is_valid():
        form.save()
    if formEnd.is_valid():
        formEnd.save()

    return redirect('/')




# Novo Produto
def newProduct(request):
    if request.method == 'POST':
        formProduto = ProductForm(request.POST)
        if formProduto.is_valid():
            formProduto.save()
            return redirect('/')


    return render(request, 'index/newProduct.html')

#Editar Produto
def editProduct(request):
    print(request.POST)
    id = request.POST['pk']
    print(id)
    produto = get_object_or_404(Produto, pk=id)
    form = ProductForm(request.POST, instance=produto)
    if form.is_valid():
        form.save()

    return redirect('/?search=&filter=Produto')

# Delete Produto

def deleteProduct(request, pk):
    produto = get_object_or_404(Produto, pk=pk)
    produto.delete()

    return redirect('/?search=&filter=Produto')







#view da tela de vendas
def sales(request):
    busca = request.GET.get('search')
    if busca:
        if request.GET.get('filter') == 'codigo':
            vendas = Venda.objects.all().filter(pk__contains=busca)
        elif request.GET.get('filter') == 'cliente':

            vendas = Venda.objects.all().filter(cod_cliente__nome__contains=busca)
    else:
        vendas = Venda.objects.all()

    paginator = Paginator(vendas, 5)
    page = request.GET.get('page')
    vendas = paginator.get_page(page)

    return render(request, 'index/vendas.html', {'vendas':vendas})



# Cadastro de venda
def new(request):
    if request.GET.get('cliente'):
        clientes = Cliente.objects.all().filter(nome__contains=request.GET.get('cliente'))

        clientes = serializers.serialize('json', clientes)

        return JsonResponse({'clientes': clientes})
    elif request.GET.get('produto'):
        produto = Produto.objects.all().filter(nome__contains=request.GET.get('produto'))
        prodotoJSON = serializers.serialize('json', produto)

        return JsonResponse({'produtos': prodotoJSON})

    users = Cliente.objects.all().order_by("-created_at")[0:5]
    produtos = Produto.objects.all()[0:5]

    return render(request, 'index/nova_venda.html', {'clientes':users, 'produtos':produtos})

def deleteSale(request, id):
    venda = get_object_or_404(Venda, pk=id)
    venda.delete()

    return redirect('/vendas')

def editSale(request, id):
    pass
