-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: [Juan Manuel]
-- Fecha: [10/07/26]
-- ══════════════════════════════════════════

-- ── CONSULTA 1: UNION ────────────────────
-- Reporte de Catálogo Unificado
-- Pregunta de negocio: ¿Qué productos únicos comercializa
-- la empresa en toda su red de sucursales?
-- Operador: UNION (elimina filas completamente duplicadas)

-- [Tu consulta aquí]
SELECT id_producto, nombre_producto, categoria
FROM inventario_sucursal_norte

UNION

SELECT id_producto, nombre_producto, categoria
FROM inventario_sucursal_sur
ORDER BY id_producto;


-- ── CONSULTA 2: UNION ALL ────────────────
-- Auditoría de Stock Total
-- Pregunta de negocio: ¿Cuántos registros físicos de stock
-- existen en total entre ambas sucursales?
-- Operador: UNION ALL (mantiene todos los registros incluyendo duplicados)

-- [Tu consulta aquí]
SELECT id_producto, nombre_producto, stock, 'Norte' AS sucursal
FROM inventario_sucursal_norte

UNION ALL

SELECT id_producto, nombre_producto, stock, 'Sur' AS sucursal
FROM inventario_sucursal_sur;


-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─
-- Ejecutá estas dos consultas para comparar cuántas filas
-- devuelve cada operador y explicá la diferencia en tu README

-- 1. Conteo para UNION (Elimina duplicados)
SELECT COUNT(*) AS filas_union 
FROM (
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_norte
    UNION
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_sur
) AS resultado_union;

-- 2. Conteo para UNION ALL (Mantiene todos los registros)
SELECT COUNT(*) AS filas_union_all 
FROM (
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_norte
    UNION ALL
    SELECT id_producto, nombre_producto, categoria FROM inventario_sucursal_sur
) AS resultado_union_all;


SELECT COUNT(*) AS filas_union     FROM (/* tu UNION aquí */)     AS resultado_union;
SELECT COUNT(*) AS filas_union_all FROM (/* tu UNION ALL aquí */) AS resultado_union_all;
