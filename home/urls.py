from django.urls import path, include
from . import views
urlpatterns = [
    path('', views.home, name="home"),
    path('client/new', views.addClient, name='addClient'), 
    path('client/edit', views.editClient, name='addClient'), 
    path('client/delete/<int:pk>', views.deleteCliente, name='delete'),
    path('vendas/', views.sales, name='sales'),
    path('vendas/novo', views.new, name='new'),
    path('venda/delete/<int:id>', views.deleteSale, name='Delete Sale'),
    path('produto/new', views.newProduct, name='Cadastro Produto'),
    path('produto/edit', views.editProduct, name='Editar Produto'),
    path('produto/delete/<int:pk>', views.deleteProduct, name='delete'),
]