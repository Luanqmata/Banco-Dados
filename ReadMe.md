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
# CODIGO da 1fn do exemplo:
```sql
  DROP TABLE cliente;
  SELECT * FROM cliente;
  
  CREATE TABLE cliente (
      cod_cliente INT PRIMARY KEY,
  	nome_cliente VARCHAR(50),
  	telefone_cliente VARCHAR(20),
  	endereco_cliente VARCHAR(150)
  )
  
  INSERT INTO cliente (cod_cliente, nome_cliente, telefone_cliente, endereco_cliente)
  VALUES
  (2532, 'José ', '998241004,998877665', 'Rua 19, 244 - Formosinha'),
  (2536, 'Marcus ', '998877665', 'Avenida Brocoto, 670 apt-103 - Abreu'),
  (2453, 'Ana ','400289222,666777888', 'Rua 9a, 9 - Bela Vista');
  
  ------------------------------------------------------
  DROP TABLE telefone_cliente;
  SELECT * FROM telefone_cliente;
  
  CREATE TABLE telefone_cliente (
      cod_cliente INT,
      telefone NUMERIC(11),
      FOREIGN KEY (cod_cliente) REFERENCES cliente (cod_cliente)
  );
  
  INSERT INTO telefone_cliente (cod_cliente, telefone)
  VALUES
  (2532, 998241004),
  (2532, 998877665),
  (2536, 998877665),
  (2453, 400289222),
  (2453, 666777888);
  
  -------------- organizando CLIENTE ------------------
  ALTER TABLE cliente DROP COLUMN telefone_cliente;
  
  ALTER TABLE cliente ADD COLUMN bairro VARCHAR(30);
  
  UPDATE cliente
  SET bairro = 'Formosinha'
  WHERE cod_cliente = 2532;
  
  UPDATE cliente
  SET bairro = 'Abreu'
  WHERE cod_cliente = 2536;
  
  UPDATE cliente
  SET bairro = 'Bela Vista'
  WHERE cod_cliente = 2453;
  
  UPDATE cliente
  SET endereco_cliente = 'Rua 19, 244'
  WHERE cod_cliente = 2532;
  
  UPDATE cliente
  SET endereco_cliente = 'Avenida Brocoto, 670 apt-103'
  WHERE cod_cliente = 2536;
  
  UPDATE cliente
  SET endereco_cliente = 'Rua 9a, 9'
  WHERE cod_cliente = 2453;
  ------------- RESULTA DO FINAL ---------------
  SELECT * FROM cliente;
  SELECT * FROM telefone_cliente;
```
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

