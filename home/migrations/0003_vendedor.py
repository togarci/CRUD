# Generated by Django 2.2 on 2020-07-22 19:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0002_endereco_prod_venda_produto_venda'),
    ]

    operations = [
        migrations.CreateModel(
            name='Vendedor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100)),
                ('idade', models.IntegerField()),
                ('sexo', models.CharField(choices=[('masculino', 'masculino'), ('feminino', 'feminino')], max_length=5)),
                ('n_doc', models.IntegerField()),
            ],
        ),
    ]