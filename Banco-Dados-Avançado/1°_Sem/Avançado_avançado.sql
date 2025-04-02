SELECT * FROM Pedidos
where data_pedido 
BETWEEN '2024-03-20' AND '2024-03-24';

# ------------------------------------------------------
SELECT * 
FROM Transacoes 
WHERE id_cliente = 5  									   -- Filtra pelo cliente específico (substitua pelo ID desejado)
AND data_transacao BETWEEN '2024-03-20' AND '2024-03-25';  -- Filtra pelo período desejado

# ------------------------------------------------------

SELECT
	c.nome,
    count(p.id_pedido) AS Soma_pedidos
FROM
	Clientes c
NATURAL JOIN
	Pedidos p
GROUP BY
	c.nome
ORDER BY
	Soma_pedidos DESC; -- ASC crescente

# ------------------------------------------------------

SELECT id_vendedor,
	SUM(valor) AS total_vendas
FROM Vendas
GROUP BY id_vendedor;

SELECT 
    id_vendedor, 
    SUM(valor) AS total_vendas,
    (SUM(valor) / (SELECT SUM(valor) FROM Vendas)) * 100 AS percentual_participacao
FROM Vendas
GROUP BY id_vendedor;


# ------------------------------------------------------

SELECT * FROM 
Transacoes
where id_cliente = '1'
AND data_transacao 
between 
'2024-03-20' AND '2024-03-26';


# ------------------------------------------------------

SELECT 
    id_vendedor,
    SUM(valor) AS total_valor_vendas,
    COUNT(id_venda) AS quantidade_vendas
FROM Vendas
GROUP BY id_vendedor
ORDER BY total_valor_vendas DESC;


-- 02:
-- Agora, reescreva a consulta para exibir o percentual de participação de cada vendedor nas vendas totais.
SELECT 
    id_vendedor,
    SUM(valor) AS total_vendas,
    ROUND(SUM(valor) / (SELECT SUM(valor) FROM Vendas) * 100, 2) AS percentual,
    COUNT(*) AS quantidade_vendas
FROM Vendas
GROUP BY id_vendedor
ORDER BY total_vendas DESC;


-- Utilizações de CTE WITH
-- O With é utilizado para criação de tabelas temporárias enquanto há uma consulta sem complexidade
-- Calcula a média salarial primeiro e depois usa em uma comparação

/*
WITH media_salarial AS (
    SELECT AVG(salario) AS media_geral
    FROM funcionarios
    WHERE departamento = 'TI'
)
SELECT 
    f.nome,
    f.salario,
    m.media_geral,
    f.salario - m.media_geral AS diferenca_media
FROM 
    funcionarios f
CROSS JOIN 
    media_salarial m
WHERE 
    f.departamento = 'TI'
ORDER BY 
    diferenca_media DESC;
*/    


/*
CASE
    WHEN condição1 THEN resultado1
    WHEN condição2 THEN resultado2
    ...
    ELSE resultado_padrao
END

SELECT 
    nome,
    total_gasto,
    CASE
        WHEN total_gasto > 1000 THEN 'Cliente Premium'
        WHEN total_gasto > 500 THEN 'Cliente Frequente'
        WHEN total_gasto > 100 THEN 'Cliente Regular'
        ELSE 'Cliente Ocasional'
    END AS categoria_cliente
FROM clientes;
