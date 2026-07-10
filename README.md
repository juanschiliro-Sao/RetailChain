# RetailChain




-Comparación de Operadores de Conjuntos: UNION vs. UNION ALL

Al ejecutar las consultas de comparación sobre el inventario de **RetailChain**, los resultados de conteo de filas son los siguientes:

*   **`filas_union`**: Devuelve **11** filas.
*   **`filas_union_all`**: Devuelve **14** filas.


La diferencia de **3 filas** entre ambos operadores se debe al comportamiento interno de cada comando respecto a los registros duplicados:

1. **UNION (Catálogo Único):** 
   Este operador unifica los conjuntos de datos de ambas sucursales, pero aplica un proceso de **desduplicación**. Si encuentra filas donde los valores de *todas* las columnas seleccionadas (`id_producto`, `nombre_producto` y `categoria`) son exactamente iguales, descarta las repetidas y conserva una sola. 
   * **Caso práctico:** Los productos **103** (Monitor 4K 27"), **104** (Teclado Mecánico) y **106** (SSD Externo 1TB) existen con la misma información en la sucursal Norte y Sur. `UNION` eliminó sus 3 duplicados, reduciendo el total de 14 a 11 filas.

2. **UNION ALL (Auditoría Total):**
   Este operador es puramente aditivo. Toma el resultado de la primera consulta y le concatena abajo el resultado de la segunda consulta **sin realizar ninguna verificación ni filtro**. Es mucho más rápido de ejecutar porque el motor de la base de datos no gasta recursos en ordenar ni buscar duplicados.
   * **Caso práctico:** Mantiene los 7 registros de la Sucursal Norte y los 7 de la Sucursal Sur intactos, devolviendo el total físico de **14** filas.

### 💡 Criterio de Uso en el Negocio
* Use **`UNION`** cuando necesite presentar un reporte limpio a un usuario final, como un catálogo de productos únicos a la venta o un listado de clientes sin repeticiones.
* Use **`UNION ALL`** cuando necesite realizar auditorías de registros totales, cálculos matemáticos globales (como sumar el stock total mediante un `GROUP BY`), o cuando tenga la certeza absoluta de que los conjuntos de datos no contienen duplicados entre sí (para ahorrar rendimiento).
