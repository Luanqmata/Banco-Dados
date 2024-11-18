#			Rev. Simu Sandir (RSS) 4°Sem - 2°Tri

# Para a tabela estar na 1° forma normal ela deve:

### -somente possuir valores *ATOMICOS*
### -não ha grupos de atributos repetidos (há apenas um dado por coluna nas linhas)
### -existe uma chave primaria
### -relação nao possui atributos multivalorados ou relações aninhadas (uma tabela dentro de outra tabela)
-----------------------------------------------------------------------------------------------------------------
![image](https://github.com/user-attachments/assets/d210ea15-e061-4113-bce1-9d3b2920ed7c)
##                    (Imagem tabela não normalizada, acima!)
![image](https://github.com/user-attachments/assets/92f7bcd2-85db-46bb-b90a-c02bb3e56f71)
##                     (Imagem tabela Normalizada!! acima!!)
## Obs: Contem 1Pk, Desmembrar o endereço para que nao tenha compostos dentro de um campo só,e na segunda tab temos os telefones não multivalorados e fazendo referenciação a pk da primeira tab.
![image](https://github.com/user-attachments/assets/656df3eb-8849-47c6-859b-cd83b80b9615)

# Conceito 2Fn:
### Baseado no conceito de Dependencia funcional total (DFT)
### Cada Atributo que nao for chave tende ser total e funcionalmente dependentes da PK
### Um atributo-chave é um atributo que é uma PK ou parte de uma PKC (Composta) .
### Atributos não-chaves São os demais atributos .

-----------------------------------------------------------------------------------------------------------------
# Para a tabela estar na 2° Fn ela deve: 
### - Estar na 1°Fn .
### - Todos atributos não-chave são funcionalmente dependentes de * *TODAS-AS-PARTES* * da chave primaria.
### - Não existem Dependencias Parciais (DFP).
### - Caso Contrario deve se criar outra tabela com os dados.
-----------------------------------------------------------------------------------------------------------------

![image](https://github.com/user-attachments/assets/917d2f20-74e0-41bc-8cee-947fcebff23e)
## (Imagem tabela não normalizada, acima!)
![image](https://github.com/user-attachments/assets/5af11a86-bb99-456a-b056-863408dbb561)
## (Imagem tabela Normalizada!! acima!)

### o que vc deve fazer é analisar a tabela inteira desde nome a atributos , e os atributos que não fazem parte diretamente da chave primaria inteira (se for uma composta no caso)
### vc vai remover da tabela principal e criar outra tabela com chave primaria referenciando ao msm numero da chave que esta na primeira tabela.
-----------------------------------------------------------------------------------------------------------------
## Ou seja:
### Resumindo vc vai criar uma tabela com atributos principais e o atributos secundario vc vai colocar na outra tabela e fazer refenciação daquelas atributos secundarios que possuem um ID ao msm aID da tabela principal.

