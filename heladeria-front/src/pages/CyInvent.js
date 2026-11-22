import React, { useEffect, useState } from 'react'
import { deleteCyInvent, getCyInvent, saveInvent } from '../services/cyInventService';
import PaginatedTable from '../component/PaginatedTable';
import { AddIcon, DeleteIcon, EditIcon, SaveIcon } from '../assets/icons';
import { getStatus } from '../services/statusService';
import { getCylinder } from '../services/cylinderService';
import { useAuth } from '../context/AuthContext';
import { getCylinderTypes } from '../services/adminConfigService';
import { getUserBranches } from '../services/userService';


  const CyInvent = () => {

    const [cyInvents, setCyInvents]             = useState([]);
    const [statusOptions, setStatusOptions]     = useState([]);
    const [cylinders, setCylinders]             = useState([]);
    const [branches, setBranches]               = useState([]);
    const [cylinderTypes, setCylinderTypes]     = useState([]);
    const [loading, setLoading]                 = useState(true);
    const [error,   setError]                   = useState(null);
    const [currentCyInvent, setCurrentInvent]   = useState({ fraction:"", status:"", branch:null, cylinder:null});
    const [isEditing, setIsEditing]             = useState(false);
    const { currentUser, currentBranch }        = useAuth();
    const canManageInventory = ['ADMIN_GLOBAL', 'ADMIN_BRANCH'].includes(currentUser?.role);
    const [confirmDeleteId, setConfirmDeleteId] = useState(null);
    

    useEffect(() =>{
      const fetchCylinder = async () =>{
        try{
          const data = await getCylinder();
          setCylinders(data);
        }catch(error){
          setError("error")
          console.log('error',error);
        }
      };
      fetchCylinder();
    },[]);

    useEffect(() => {
      const fetchStatus = async () =>{
        try{
          const data = await getStatus();
          setStatusOptions(data);
          //console.log(data);
        }catch(err){
          setError("error");
          console.log(err);
        }
      };
      fetchStatus();
    }, []);

    useEffect(() => {
      getCylinderTypes().then(setCylinderTypes).catch((err) => {
        setError('No se pudieron cargar los tipos de cilindro');
        console.error(err);
      });
    }, []);

    useEffect(() => {
      getUserBranches().then(setBranches).catch((err) => {
        setError('No se pudieron cargar las sucursales');
        console.error(err);
      });
    }, []);

    useEffect (() =>{
    const fetchCyInvents = async () =>{
        try{
          const data = await getCyInvent();
          setCyInvents(data);
          console.log(data);
        }catch(err){
          setError("error");
          console.log(err);
        } finally{
          setLoading(false);
        }
      };
      fetchCyInvents();
    },[]);

    const openCreateModal = () =>{
      setCurrentInvent({ fraction:"", status:"" ,user: currentUser,branch: currentBranch || null,cylinder:null});
        setIsEditing(false);
        document.getElementById("cyInvent_modal").showModal();
    };

    const openEditModal = (cyInvent) =>{
      setCurrentInvent({...cyInvent,user: currentUser,branch: cyInvent.branch || currentBranch || null});
      setIsEditing(true);
      document.getElementById('cyInvent_modal').showModal();
    };

    const openDeleteModal = (id) => {
      setConfirmDeleteId(id);
      document.getElementById('delete_modal').showModal();
    };


    const handleSubmit = async (e) =>{
            e.preventDefault();
            if (!currentCyInvent.cylinder?.id || !currentCyInvent.branch?.id) return;
            try{
                const inventoryToSave = {
                  ...(currentCyInvent.id ? { id: currentCyInvent.id } : {}),
                  cylinder: { id: currentCyInvent.cylinder.id },
                  branch: { id: Number(currentCyInvent.branch.id) },
                  user: currentUser ? { idUser: currentUser.id } : null,
                  status: currentCyInvent.status,
                  fraction: Number(currentCyInvent.fraction)
                };
                await saveInvent(inventoryToSave);
                const updated = await getCyInvent();
                setCyInvents(updated);
                document.getElementById("cyInvent_modal").close();
                setCurrentInvent({ fraction:"", status:"",user: null,branch:null, cylinder:null});
            }catch(err){
                console.error("Error al guardar inventario de cilindro:", err.response?.data || err.message);
            }
        };

    const confirmDelete = async () => {
      try{
        await deleteCyInvent(confirmDeleteId);
        const update = await getCyInvent();
        setCyInvents(update);
        setConfirmDeleteId(null);
        document.getElementById('delete_modal').close();
      }catch(err){
        console.error('error al eliminar',err);
      }
    };


    if(loading) return <p className='text-center mt-10'>Cargando Inventario de Cilindros</p>
    if(error) return <p className='text-center mt-10 text-red-500'>{error}</p>


  
return (
  <div className="w-full min-w-0 px-3 py-4 sm:px-5 sm:py-6 lg:px-8 lg:py-8">

    {/* Encabezado */}
    <div className="flex flex-col gap-3 mb-5 sm:flex-row sm:items-center sm:justify-between">
      <div>
        <h1 className="text-xl sm:text-2xl font-bold text-center sm:text-left">
          Inventario de helados
        </h1>
        <p className="text-sm text-gray-500 text-center sm:text-left mt-1">
          Administración del inventario de cilindros por sucursal
        </p>
      </div>
    </div>

    {/* Tabla */}
    <div className="w-full min-w-0 overflow-x-auto">
      <PaginatedTable
        columns={[
          'ID',
          'SABOR',
          'ESTADO',
          'USO %',
          'SUCURSAL',
          'FECHA DE COMPRA',
          'REGISTRADO/EDITADO',
          'ACCIONES'
        ]}
        data={cyInvents}
        renderRow={(cyInvent) => (
          <tr key={cyInvent.id} className="hover:bg-base-300">
            <td className="text-center">{cyInvent.id}</td>
            <td className="text-center">{cyInvent.cylinder.flavor}</td>
            <td className="text-center">{cyInvent.status}</td>
            <td className="text-center">
              {cyInvent.fraction * 100} %
            </td>
            <td className="text-center">
              {cyInvent.branch?.name || 'Sin sucursal'}
            </td>
            <td className="text-center whitespace-nowrap">
              {new Date(cyInvent.createdAt).toLocaleDateString()}
            </td>
            <td className="text-center whitespace-nowrap">
              {cyInvent.user?.firstName} {cyInvent.user?.lastName}
            </td>
            <td>
              <div className="flex flex-col sm:flex-row gap-2 justify-center min-w-[150px]">
                {canManageInventory && (
                  <button
                    className="btn btn-outline btn-warning btn-sm"
                    onClick={() => openEditModal(cyInvent)}
                  >
                    <EditIcon className="w-5 h-5" />
                    Editar
                  </button>
                )}

                {canManageInventory && (
                  <button
                    className="btn btn-outline btn-error btn-sm"
                    onClick={() => openDeleteModal(cyInvent.id)}
                  >
                    <DeleteIcon className="w-5 h-5" />
                    Eliminar
                  </button>
                )}
              </div>
            </td>
          </tr>
        )}
        extraAction={
          canManageInventory && (
            <button
              className="btn btn-outline btn-primary w-full sm:w-auto"
              onClick={openCreateModal}
            >
              <AddIcon className="w-5 h-5" />
              Registrar Inventario
            </button>
          )
        }
        filasPorPagina={10}
        defaultSort={{ key: 'id', direction: 'desc' }}
        sortConfig={[
          { label: 'ID', key: 'id', type: 'number' },
          { label: 'SABOR', key: 'name', type: 'string' },
          { label: 'ESTADO', key: 'code', type: 'string' },
          { label: 'FECHA DE CREACIÓN', key: 'createdAt', type: 'date' },
          { label: 'FECHA DE MODIFICACIÓN', key: 'updatedAt', type: 'date' },
          { label: 'FECHA DE COMPRA', key: 'createdAt', type: 'date' },
        ]}
      />
    </div>

    {/* Modal de registro y edición */}
    <dialog className="modal modal-middle" id="cyInvent_modal">
      <div className="modal-box w-11/12 max-w-lg max-h-[90vh] overflow-y-auto">

        <h3 className="font-bold text-lg sm:text-xl">
          {isEditing
            ? "Editar Inventario"
            : "Registrar Inventario de Cilindros"}
        </h3>

        <form className="mt-4 space-y-4" onSubmit={handleSubmit}>

          <div>
            <label className="label">
              <span className="label-text font-medium">Sabor de helado</span>
            </label>
            <select
              className="select select-bordered w-full"
              required
              value={currentCyInvent.cylinder?.id || ""}
              onChange={(e) => {
                const selectedId = parseInt(e.target.value);
                const selectedCylinder =
                  cylinders.find(c => c.id === selectedId) || null;

                setCurrentInvent({
                  ...currentCyInvent,
                  cylinder: selectedCylinder
                });
              }}
            >
              <option value="">--Seleccione un sabor de Helado--</option>
              {cylinders.map((cylinder) => (
                <option key={cylinder.id} value={cylinder.id}>
                  {cylinder.flavor}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="label">
              <span className="label-text font-medium">Sucursal</span>
            </label>
            <select
              className="select select-bordered w-full"
              required
              value={currentCyInvent.branch?.id || ""}
              onChange={(e) => {
                const selectedBranch =
                  branches.find(
                    branch => branch.id === Number(e.target.value)
                  ) || null;

                setCurrentInvent({
                  ...currentCyInvent,
                  branch: selectedBranch
                });
              }}
            >
              <option value="" disabled>-- Selecciona una sucursal --</option>
              {branches.map((branch) => (
                <option key={branch.id} value={branch.id}>
                  {branch.name}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="label">
              <span className="label-text font-medium">Estado</span>
            </label>
            <select
              className="select select-bordered w-full"
              required
              value={currentCyInvent.status}
              onChange={(e) =>
                setCurrentInvent({
                  ...currentCyInvent,
                  status: e.target.value
                })
              }
            >
              <option value="">-- Selecciona un estado --</option>
              {statusOptions.map((status) => (
                <option key={status} value={status}>
                  {status}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="label">
              <span className="label-text font-medium">Tipo de cilindro</span>
            </label>
            <select
              className="select select-bordered w-full"
              required
              value={currentCyInvent.fraction}
              onChange={(e) =>
                setCurrentInvent({
                  ...currentCyInvent,
                  fraction: e.target.value
                })
              }
            >
              <option value="">-- Selecciona el tipo de cilindro --</option>
              {cylinderTypes.map((type) => (
                <option key={type.id} value={type.fraction}>
                  {type.name}
                </option>
              ))}
            </select>
          </div>

          {/* Información del usuario */}
          <div className="bg-base-200 rounded-lg p-3 text-sm space-y-2">
            <p>
              <strong>Usuario:</strong>{' '}
              {currentUser?.firstName} {currentUser?.lastName}
            </p>
            <p>
              <strong>Sucursal seleccionada:</strong>{' '}
              {currentCyInvent.branch?.name || 'Selecciona una sucursal'}
            </p>
          </div>

          {/* Acciones */}
          <div className="flex flex-col-reverse sm:flex-row sm:justify-end gap-2 pt-2">
            <button
              type="button"
              className="btn w-full sm:w-auto"
              onClick={() =>
                document.getElementById("cyInvent_modal").close()
              }
            >
              Cancelar
            </button>

            <button
              type="submit"
              className="btn btn-success w-full sm:w-auto"
            >
              {isEditing ? "Editar" : "Guardar"}
            </button>
          </div>

        </form>
      </div>
    </dialog>

    {/* Modal de eliminación */}
    <dialog className="modal modal-middle" id="delete_modal">
      <div className="modal-box w-11/12 max-w-md">

        <h3 className="font-bold text-lg text-red-500">
          Confirmar eliminación
        </h3>

        <p className="py-4 text-sm sm:text-base">
          ¿Está seguro de que desea eliminar este cilindro del inventario?
        </p>

        <div className="flex flex-col-reverse sm:flex-row sm:justify-end gap-2">
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

}

export default CyInvent