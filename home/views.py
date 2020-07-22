from django.shortcuts import render, redirect

# Create your views here.

def home(request):
    return render(request, 'index/home.html')

def addClient(request):
    return render(request, 'index/cadastro.html')

def sales(request):
    return render(request, 'index/vendas.html')

def new(request):
    return render(request, 'index/nova_venda.html')