import React, { useEffect, useState } from 'react'
import { deleteCylinder, getCylinder, saveCylinder } from '../services/cylinderService';
import PaginatedTable from '../component/PaginatedTable';
import { AddIcon, DeleteIcon, EditIcon, SaveIcon } from '../assets/icons';

const Cylinders = () => {
    const [cylinders, setCylinders]             = useState([]);
    const [loading, setLoading]                 = useState(true);
    const [error, setError]                     = useState(null);
    const [isEditing, setIsEditing]             = useState(false);
    const [currentCylinder, setCurrentCylinder] = useState({flavor:"", estimatedBalls:"", purchasePrice:""});
    const [confirmDeleteId, setConfirmDeleteId] = useState(null);

    useEffect(() => {
        const fetchCylinders = async () =>{
            try{
                const data = await getCylinder();
                setCylinders(data);
                console.log(data);
            }catch(err){
                setError("error");
                console.log(err);
            } finally{
                setLoading(false);
            }
        };
        fetchCylinders();
    },[]);

    const openCreateModal = () =>{
        setCurrentCylinder({flavor:"", estimatedBalls:"", purchasePrice:""});
        setIsEditing(false);
        document.getElementById("cylinder_modal").showModal();
    };

    const openEditModal = (cylinder) =>{
        setCurrentCylinder(cylinder);
        setIsEditing(true);
        document.getElementById("cylinder_modal").showModal();
    };

    const handleSubmit = async (e) =>{
        e.preventDefault();
        try{
            await saveCylinder(currentCylinder);
            const updated = await getCylinder();
            setCylinders(updated);
            document.getElementById("cylinder_modal").close();
            setCurrentCylinder({flavor:"", estimatedBalls:"", purchasePrice:""});
        }catch(err){
            console.log("error",err);
        }
    };

    const openConfirmDelete = (id) => {
        setConfirmDeleteId(id);
        document.getElementById("delete_modal").showModal();
    }

    const confirmDelete = async () => {
          try {
            await deleteCylinder(confirmDeleteId);
            const updated = await getCylinder();
            setCylinders(updated);
            setConfirmDeleteId(null);
            document.getElementById("delete_modal").close();
          } catch (err) {
            console.error("Error al eliminar cylinder:", err);
          }
        };

    if(loading) return <p className='text-center mt-10'>Cagando Cylinders</p>
    if(error) return <p className='text-center mt-10 text-red-500'>{error}</p>

  
return (
  <div className="w-full min-w-0 px-3 py-4 sm:px-5 sm:py-6 lg:px-8 lg:py-8">

    {/* Encabezado */}
    <div className="mb-5">
      <h1 className="text-xl sm:text-2xl font-bold text-center sm:text-left">
        CILINDROS DE HELADO
      </h1>
    </div>

    {/* Tabla */}
    <div className="w-full min-w-0 overflow-x-auto">
      <PaginatedTable
        columns={[
          'ID',
          'SABOR',
          'PROMEDIO DE BOLAS',
          'PRECIO COMPRA',
          'ACCIONES'
        ]}
        data={cylinders}
        renderRow={(cylinder) => (
          <tr key={cylinder.id} className="hover:bg-base-300">
            <td className="text-center">{cylinder.id}</td>
            <td className="text-center">{cylinder.flavor}</td>
            <td className="text-center">{cylinder.estimatedBalls}</td>
            <td className="text-center">
              {cylinder.purchasePrice == null
                ? '—'
                : `$ ${cylinder.purchasePrice}`}
            </td>

            <td>
              <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
                <button
                  className="btn btn-outline btn-warning btn-sm w-full sm:w-auto"
                  onClick={() => openEditModal(cylinder)}
                >
                  <EditIcon className="w-5 h-5 text-current" />
                  Editar
                </button>

                <button
                  className="btn btn-outline btn-error btn-sm w-full sm:w-auto"
                  onClick={() => openConfirmDelete(cylinder.id)}
                >
                  <DeleteIcon className="w-5 h-5 text-current" />
                  Eliminar
                </button>
              </div>
            </td>
          </tr>
        )}
        extraAction={
          <button
            className="btn btn-outline btn-primary w-full sm:w-auto"
            onClick={openCreateModal}
          >
            <AddIcon className="w-5 h-5 text-current" />
            CREAR CILINDRO
          </button>
        }
        filasPorPagina={10}
        defaultSort={{ key: 'id', direction: 'desc' }}
        sortConfig={[
          { label: 'ID', key: 'id', type: 'number' },
          { label: 'SABOR', key: 'flavor', type: 'string' },
          { label: 'PROMEDIO DE BOLAS', key: 'estimatedBalls', type: 'number' },
          { label: 'PRECIO COMPRA', key: 'purchasePrice', type: 'number' }
        ]}
      />
    </div>

    {/* Modal crear / editar cilindro */}
    <dialog id="cylinder_modal" className="modal modal-middle">
      <div className="modal-box w-11/12 max-w-lg max-h-[90vh] overflow-y-auto">

        <h3 className="font-bold text-lg sm:text-xl">
          {isEditing ? "Editar Cilindro" : "Crear Cilindro"}
        </h3>

        <form
          className="mt-4 space-y-3"
          onSubmit={handleSubmit}
        >
          <div>
            <label className="label">
              <span className="label-text">Sabor</span>
            </label>
            <input
              type="text"
              placeholder="Ingrese el sabor"
              className="input input-bordered w-full"
              value={currentCylinder.flavor}
              onChange={(e) =>
                setCurrentCylinder({
                  ...currentCylinder,
                  flavor: e.target.value
                })
              }
              required
            />
          </div>

          <div>
            <label className="label">
              <span className="label-text">Precio de compra</span>
            </label>
            <input
              type="number"
              min="0"
              step="0.01"
              required
              placeholder="Precio de compra"
              className="input input-bordered w-full"
              value={currentCylinder.purchasePrice ?? ''}
              onChange={(e) =>
                setCurrentCylinder({
                  ...currentCylinder,
                  purchasePrice: e.target.value
                })
              }
            />
          </div>

          <div>
            <label className="label">
              <span className="label-text">Estimado de bolas</span>
            </label>
            <input
              type="number"
              min="0"
              placeholder="Estimado de bolas"
              className="input input-bordered w-full"
              value={currentCylinder.estimatedBalls}
              onChange={(e) =>
                setCurrentCylinder({
                  ...currentCylinder,
                  estimatedBalls: e.target.value
                })
              }
            />
          </div>

          <div className="modal-action flex flex-col-reverse sm:flex-row">
            <button
              type="button"
              className="btn w-full sm:w-auto"
              onClick={() =>
                document.getElementById("cylinder_modal").close()
              }
            >
              Cancelar
            </button>

            <button
              type="submit"
              className="btn btn-success w-full sm:w-auto"
            >
              {isEditing ? "Actualizar" : "Guardar"}
            </button>
          </div>
        </form>
      </div>
    </dialog>

    {/* Modal confirmar eliminación */}
    <dialog id="delete_modal" className="modal modal-middle">
      <div className="modal-box w-11/12 max-w-md">

        <h3 className="font-bold text-lg text-red-500">
          Confirmar eliminación
        </h3>

        <p className="py-4">
          ¿Está seguro de que desea eliminar este cilindro?
        </p>

        <div className="modal-action flex flex-col-reverse sm:flex-row">
          <button
            className="btn w-full sm:w-auto"
            onClick={() => {
              setConfirmDeleteId(null);
              document.getElementById("delete_modal").close();
            }}
          >
            Cancelar
          </button>

          <button
            className="btn btn-error w-full sm:w-auto"
            onClick={confirmDelete}
          >
            Eliminar
          </button>
        </div>
      </div>
    </dialog>

  </div>
);

};
export default Cylinders