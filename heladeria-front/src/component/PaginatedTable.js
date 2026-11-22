
import React, { useState, useMemo, useEffect } from 'react';

const PaginatedTable = ({
  columns,
  data = [],
  renderRow,
  extraAction,
  filasPorPagina = 4,
  defaultSort = { key: 'created_at', direction: 'desc' },
  sortConfig = [],
  enableSorting = true
}) => {
  const [paginaActual, setPaginaActual] = useState(0);
  const [orden, setOrden] = useState(defaultSort);

  // Reiniciar la página cuando cambien los datos
  useEffect(() => {
    setPaginaActual(0);
  }, [data]);

  // Obtener el tipo de ordenamiento
  const obtenerTipo = (key, valor) => {
    const config = sortConfig.find(item => item.key === key);

    if (config?.type) return config.type;

    if (
      key.toLowerCase().includes('fecha') ||
      key.toLowerCase().includes('date') ||
      key.toLowerCase().includes('created') ||
      key.toLowerCase().includes('updated') ||
      key.toLowerCase().includes('at')
    ) {
      return 'date';
    }

    if (typeof valor === 'number') return 'number';

    return 'string';
  };

  // Ordenar los registros
  const datosOrdenados = useMemo(() => {
    if (!Array.isArray(data)) return [];

    if (!enableSorting || !orden?.key) return data;

    return [...data].sort((a, b) => {
      const valorA = a?.[orden.key];
      const valorB = b?.[orden.key];

      // Valores nulos al final
      if (valorA == null && valorB == null) return 0;
      if (valorA == null) return 1;
      if (valorB == null) return -1;

      const tipo = obtenerTipo(orden.key, valorA);

      let resultado = 0;

      if (tipo === 'date') {
        const fechaA = new Date(valorA).getTime();
        const fechaB = new Date(valorB).getTime();

        resultado = (Number.isNaN(fechaA) ? 0 : fechaA) -
                    (Number.isNaN(fechaB) ? 0 : fechaB);
      } else if (tipo === 'number') {
        resultado = Number(valorA) - Number(valorB);
      } else {
        resultado = String(valorA).localeCompare(
          String(valorB),
          'es',
          { numeric: true, sensitivity: 'base' }
        );
      }

      return orden.direction === 'asc' ? resultado : -resultado;
    });
  }, [data, orden, sortConfig, enableSorting]);

  const totalPaginas = Math.ceil(datosOrdenados.length / filasPorPagina);

  const inicio = paginaActual * filasPorPagina;
  const datosVisibles = datosOrdenados.slice(
    inicio,
    inicio + filasPorPagina
  );

  // Cambiar orden
  const cambiarOrden = (key) => {
    setOrden(prev => ({
      key,
      direction:
        prev.key === key && prev.direction === 'asc'
          ? 'desc'
          : 'asc'
    }));

    setPaginaActual(0);
  };

  return (
    <div className="max-w-7xl mx-auto p-4">

      {extraAction && (
        <div className="mb-4 text-right">
          {extraAction}
        </div>
      )}

      <table className="table table-zebra max-w-7xl mx-auto border">
        <thead className="bg-blue-400 text-white">
          <tr className="text-center">
            {columns.map((col, idx) => {
              const config = sortConfig.find(item => item.label === col);
              const ordenable = enableSorting && (
                sortConfig.length === 0 || Boolean(config)
              );

              const key = config?.key ?? col;

              return (
                <th
                  key={idx}
                  onClick={() => ordenable && cambiarOrden(key)}
                  className={ordenable ? 'cursor-pointer select-none' : ''}
                >
                  {col}

                  {ordenable && (
                    <span className="ml-2">
                      {orden.key === key
                        ? orden.direction === 'asc' ? '▲' : '▼'
                        : '↕'}
                    </span>
                  )}
                </th>
              );
            })}
          </tr>
        </thead>

        <tbody>
          {datosVisibles.map(renderRow)}
        </tbody>
      </table>

      {/* Paginación */}
      <div className="mt-6 flex justify-center items-center space-x-4">
        <button
          className="btn btn-sm"
          onClick={() => setPaginaActual(prev => Math.max(prev - 1, 0))}
          disabled={paginaActual === 0}
        >
          « Anterior
        </button>

        <span className="text-sm">
          Página <strong>{totalPaginas === 0 ? 0 : paginaActual + 1}</strong> de{' '}
          <strong>{totalPaginas}</strong>
        </span>

        <button
          className="btn btn-sm"
          onClick={() =>
            setPaginaActual(prev => Math.min(prev + 1, totalPaginas - 1))
          }
          disabled={paginaActual >= totalPaginas - 1}
        >
          Siguiente »
        </button>
      </div>
    </div>
  );
};

export default PaginatedTable;
