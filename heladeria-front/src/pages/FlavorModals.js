import React, { useState, useEffect } from "react";
import { getSaleCyInventDisponibles } from "../services/cyInventService";
import { getSaleProInvents } from "../services/proInventService";


const FlavorModal = ({ isOpen, onClose, onConfirm, product, branchId, isGlobalAdmin = false }) => {
  const [cylinders, setCylinders] = useState([]);
  const [selections, setSelections] = useState([]);
  const [proInvents, setProInvents] = useState([]);
  const [selectedDepot, setSelectedDepot] = useState(null);


  const ballsCount = product?.ballsPerUnit || 1;
  const isIce = product?.code === 'SE' || product?.code === 'DO' || product?.code === 'TR';

  useEffect(() => {
    if (isOpen) {
      const fetchCyInvents = async () => {
        try {
          const data = await getSaleCyInventDisponibles(branchId);
          //console.log('Cilindros disponibles:');
          //console.log(data);
          setCylinders(data);
          setSelections([{ cylinderId: null, balls: 1 }]); // empezamos con un select
        } catch (err) {
          console.log(err);
        }
      };
      fetchCyInvents();
    }
  }, [isOpen, branchId]);

  useEffect(() => {
    if (!isOpen || (isGlobalAdmin && !branchId)) return;
    const fetchProInvents = async () => {
      try {
        const data = await getSaleProInvents(branchId);
        const iceCreamCodes = ['BRQ', 'CON', 'V5', 'V8'];
        const filteredData = data.filter(p => iceCreamCodes.includes(p.product?.code) && p.stock > 0);
        console.log(filteredData);
        setProInvents(filteredData);
      } catch (err) {
        console.log(err);
      }
    };
    fetchProInvents();
  }, [isOpen, branchId, isGlobalAdmin]);

  const handleFlavorChange = (index, cylinderId, balls = 1) => {
    const newSelections = [...selections];
    newSelections[index] = { cylinderId: parseInt(cylinderId), balls: parseInt(balls) || 1 };

    // contar total de bolas seleccionadas
    const totalBalls = newSelections.reduce((sum, s) => sum + (s?.balls || 0), 0);

    // si todavía no llegamos al total de bolas, agregamos un nuevo select
    if (totalBalls < ballsCount && !newSelections.some(s => s.cylinderId === null)) {
      newSelections.push({ cylinderId: null, balls: 1 });
    }

    setSelections(newSelections);
  };

  const handleDepotChange = (e) => {
    setSelectedDepot(e.target.value ? parseInt(e.target.value) : null);
  };


  const handleConfirm = () => {
    const selected = selections.filter((s) => s.cylinderId !== null);

    const totalBalls = selected.reduce((sum, s) => sum + (s.balls || 0), 0);
    if (totalBalls !== ballsCount) {
      alert(`Debes seleccionar ${ballsCount} bola(s) 🍦`);
      return;
    }

    if (isIce && !selectedDepot) {
      alert("Debes seleccionar un depósito para este producto.");
      return;
    }

    // Obtener los nombres de los sabores
    const selectionsWithNames = selected.map(s => {
      const cylinder = cylinders.find(
        c => Number(c.id) === Number(s.cylinderId)
      );

      return {
        ...s,
        flavor: cylinder?.cylinder?.flavor || 'Sabor desconocido'
      };
    });

    const selectedDepotObj = proInvents.find(p => p.product.id === selectedDepot);


    onConfirm(product, selectionsWithNames, {
      id: selectedDepot,
      name: selectedDepotObj?.product.name || ''
    });


    onClose();
  };


  if (!isOpen) return null;

  return (
    
    <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50 p-4">
      <div className="bg-white rounded-xl p-6 md:p-8 w-full md:w-[60vw] h-[85vh] md:h-[56vh] shadow-xl relative flex flex-col overflow-y-auto">

        {/* Título */}
        <h3 className="text-2xl md:text-3xl font-bold mb-8 text-gray-800">
          Seleccionar sabores para {product?.name}
        </h3>

        {/* Selección de sabores */}
        <div className="flex-1">
          {selections.map((sel, index) => {
            const selection = sel || { cylinderId: null, balls: 1 };

            return (
              <div key={index} className="mb-6 flex gap-4 items-end">

                {/* Botón eliminar selección */}
                <div>
                  <label className="block text-base font-semibold mb-2 invisible">
                    Eliminar
                  </label>

                  {selections.length > 1 && (
                    <button
                      className="px-3 py-3 bg-red-500 text-white rounded-lg hover:bg-red-600"
                      onClick={() => {
                        const newSelections = selections.filter(
                          (_, i) => i !== index
                        );
                        setSelections(newSelections);
                      }}
                    >
                      &times;
                    </button>
                  )}
                </div>

                {/* Selector de sabor */}
                <div className="flex-1">
                  <label className="block text-lg font-semibold mb-2 text-gray-700">
                    Sabor {index + 1}
                  </label>

                  <select
                    className="border border-gray-300 rounded-lg px-4 py-3 w-full text-lg"
                    value={selection.cylinderId || ""}
                    onChange={(e) =>
                      handleFlavorChange(index, e.target.value, selection.balls)
                    }
                  >
                    <option value="">-- Seleccionar sabor --</option>

                    {cylinders.map((c) => (
                      <option key={c.id} value={c.id}>
                        {c.cylinder.flavor}
                      </option>
                    ))}
                  </select>
                </div>

                {/* Cantidad de bolas */}
                <div>
                  <label className="block text-lg font-semibold mb-2 text-gray-700">
                    Bolas
                  </label>

                  <input
                    type="number"
                    min="1"
                    max={ballsCount}
                    value={selection.balls ?? ''}
                    onChange={(e) => {
                      const value = e.target.value;

                      const newSelections = [...selections];

                      newSelections[index] = {
                        ...selection,
                        cylinderId: selection.cylinderId,
                        balls: value === '' ? '' : Math.max(1, parseInt(value, 10))
                      };

                      setSelections(newSelections);
                    }}
                    onBlur={() => {
                      if (!selection.balls || selection.balls < 1) {
                        handleFlavorChange(index, selection.cylinderId, 1);
                      }
                    }}
                    className="border border-gray-300 rounded-lg px-3 py-3 w-28 text-xl text-center"
                    style={{ fontSize: '20px' }}
                  />
                </div>

              </div>
            );
          })}

          {/* Selección de depósito */}
          {isIce && (
            <div className="mt-8">
              <label className="block text-lg font-semibold mb-2 text-gray-700">
                Seleccionar depósito
              </label>

              <select
                className="border border-gray-300 rounded-lg px-4 py-3 w-full text-lg"
                value={selectedDepot || ""}
                onChange={handleDepotChange}
              >
                <option value="">Seleccionar el depósito</option>

                {proInvents.map((p) => (
                  <option key={p.id} value={p.product.id}>
                    {p.product.name}
                  </option>
                ))}
              </select>
            </div>
          )}
        </div>

        {/* Botones */}
        <div className="flex justify-end gap-4 mt-8 pt-4 border-t">
          <button
            className="px-6 py-3 bg-gray-300 rounded-lg text-lg font-semibold hover:bg-gray-400"
            onClick={onClose}
          >
            Cancelar
          </button>

          <button
            className="px-6 py-3 bg-green-600 text-white rounded-lg text-lg font-semibold hover:bg-green-700"
            onClick={handleConfirm}
          >
            Confirmar
          </button>
        </div>

        {/* Cerrar modal */}
        <button
          className="absolute top-4 right-5 text-gray-500 hover:text-gray-800 text-3xl"
          onClick={onClose}
        >
          &times;
        </button>

      </div>
    </div>

  );
};

export default FlavorModal;
