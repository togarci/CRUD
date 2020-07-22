# Generated by Django 2.2 on 2020-07-22 19:37

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Produto',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('valor', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Venda',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valorTotal', models.IntegerField()),
                ('cod_cliente', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='home.Cliente')),
                ('cod_produto', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='home.Produto')),
                ('cod_vendedor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Prod_Venda',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qtd', models.IntegerField()),
                ('valor', models.IntegerField()),
                ('cod_produto', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='home.Produto')),
                ('cod_venda', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.Venda')),
            ],
        ),
        migrations.CreateModel(
            name='Endereco',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('endereco', models.CharField(max_length=150)),
                ('bairro', models.CharField(max_length=100)),
                ('cid_est', models.CharField(max_length=200)),
                ('cep', models.IntegerField()),
                ('cod_cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='home.Cliente')),
            ],
        ),
    ]