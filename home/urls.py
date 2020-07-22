from django.urls import path, include
from . import views
urlpatterns = [
    path('', views.home, name="home"),
    path('cadastro/', views.addClient, name='addClient'), 
    path('vendas/', views.sales, name='sales'),
    path('vendas/novo', views.new, name='new'),
]