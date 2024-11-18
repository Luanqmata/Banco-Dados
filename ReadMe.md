#			Rev. Simu Sandir (RSS) 4°Sem - 2°Tri

# Para a tabela estar na 1° forma normal ela deve:

### -somente possuir valores *ATOMICOS*
### -não ha grupos de atributos repetidos (há apenas um dado por coluna nas linhas)
### -existe uma chave primaria
### -relação nao possui atributos multivalorados ou relações aninhadas (uma tabela dentro de outra tabela)
-----------------------------------------------------------------------------------------------------------------
![image](https://github.com/user-attachments/assets/d210ea15-e061-4113-bce1-9d3b2920ed7c)
##                    (Imagem tabela errada!! acima!)
![image](https://github.com/user-attachments/assets/92f7bcd2-85db-46bb-b90a-c02bb3e56f71)
##                     (Imagem tabela Normalizada!! acima!!)
## Obs: Contem 1Pk, Desmembrar o endereço para que nao tenha compostos dentro de um campo só,e na segunda tab temos os telefones não multivalorados e fazendo referenciação a pk da primeira tab.
![image](https://github.com/user-attachments/assets/656df3eb-8849-47c6-859b-cd83b80b9615)

# Para a tabela estar na 2° Fn ela deve: 
### - Estar na 1°Fn .
### - Todos atributos não-chave são funcionalmente dependentes de * *TODAS-AS-PARTES* * da chave primaria.
### - Não existem Dependencias Parciais.
### - Caso Contrario deve se criar outra tabela com os dados.

