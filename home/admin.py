from django.contrib import admin
from .models import *
# Register your models here.
admin.site.register(Cliente)
admin.site.register(Endereco)
admin.site.register(Venda)
admin.site.register(Produto)