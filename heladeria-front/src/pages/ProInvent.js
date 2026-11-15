import React, { useEffect, useState } from 'react'
import { deleteProInvent, getProInvents, saveProInvent } from '../services/proInventService';
import PaginatedTable from '../component/PaginatedTable';
import { AddIcon, DeleteIcon, EditIcon, SaveIcon } from '../assets/icons';
import { getProducts } from '../services/productService';
import { getUserBranches } from '../services/userService';
import { useAuth } from '../context/AuthContext';

const ProInvent = () => {

    const [proInvents, setProInvents]                   = useState([]);
    const [products, setProducts]                       = useState([]);
    const [branches, setBranches]                       = useState([]);
    const [loading, setLoading]                         = useState(true);
    const [error, setError]                             = useState(null);
    const [isEditing, setIsEditing]                     = useState(false);
    const [currentProInvent, setCurrentProInvent]       = useState({ product: null, stock: "" ,user:null, branch:null});
    const {currentUser, currentBranch}                  = useAuth();
    const canManageInventory = ['ADMIN_GLOBAL', 'ADMIN_BRANCH'].includes(currentUser?.role);
    const [confirmDeleteId, setConfirmDeleteId]         = useState(null);

    useEffect(() => {
        const fetchProInvents = async () =>{
            try{
                const data = await getProInvents();
                console.log(data);
                setProInvents(data);
            }catch(err){
                console.log(err);
            }finally{
                setLoading(false);
            }
        };
        fetchProInvents();
    }, []);

    useEffect(() => {
        const fetchProducts = async () => {
            try{
            const datapro = await getProducts();
            console.log(datapro);
            setProducts(datapro);
        }catch(err){
            console.log(err);        
        }
        };fetchProducts();
    },[]);

    useEffect(() => {
        getUserBranches().then(setBranches).catch((err) => {
            console.error('Error al cargar sucursales:', err);
            setError('No se pudieron cargar las sucursales');
        });
    }, []);

    const openCreateModal = () => {
        setCurrentProInvent({ product: null, stock: "", branch: currentBranch || null });
        setIsEditing(false);
        document.getElementById("pro_invent_modal").showModal();
    };

    const openEditModal = (proInvents) => {
        setCurrentProInvent({
            ...proInvents,
            branch: proInvents.branch || currentBranch || null
        });
        setIsEditing(true);
        document.getElementById("pro_invent_modal").showModal();

    }

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!currentProInvent.product?.id || !currentProInvent.branch?.id) return;
        try{
            await saveProInvent({
                ...(currentProInvent.id ? { id: currentProInvent.id } : {}),
                product: { id: currentProInvent.product.id },
                branch: { id: Number(currentProInvent.branch.id) },
                stock: Number(currentProInvent.stock)
            });
            const update = await getProInvents();
            setProInvents(update);
            document.getElementById("pro_invent_modal").close();
            setCurrentProInvent({ product: null, stock: "" ,user:null, branch:null })
        }catch(err){
            console.log(err);
        }
    }

    const openDeleteModal = (id) => {
        setConfirmDeleteId(id);
        document.getElementById('delete_modal').showModal();    
    }

    const confirmDelete = async () => {
        try{
            await deleteProInvent(confirmDeleteId);
            const update = await getProInvents();
            setProInvents(update);
            setConfirmDeleteId(null);
            document.getElementById('delete_modal').close();
        }catch(err){
            console.log(err);
        }
    }

    if(loading) return <p className='text-center mt-10'>Cargando Productos..</p>
    if(error)   return <p className='text-center mt-10 text-red-500'>{error}</p>

  
return (
  <div className="w-full min-w-0 px-3 py-4 sm:px-5 sm:py-6 lg:px-8 lg:py-8">

    {/* Encabezado */}
    <div className="mb-5">
      <h1 className="text-xl sm:text-2xl font-bold text-center sm:text-left">
        Inventario de productos
      </h1>
      <p className="text-sm text-gray-500 text-center sm:text-left mt-1">
        Administración de existencias de productos por sucursal
      </p>
    </div>

    {/* Tabla */}
    <div className="w-full min-w-0 overflow-x-auto">
      <PaginatedTable
        columns={['ID', 'PRODUCTO', 'EXISTENCIA', 'SUCURSAL', 'ACCIONES']}
        data={proInvents}
        renderRow={(proInvent) => (
          <tr key={proInvent.id} className="hover:bg-base-300">
            <td className="text-center">{proInvent.id}</td>

            <td className="text-center">
              {proInvent.product?.name || 'Producto no asignado'}
            </td>

            <td className="text-center">
              {proInvent.stock}
            </td>

            <td className="text-center">
              {proInvent.branch?.name || 'Sin sucursal'}
            </td>

            <td>
              <div className="flex flex-col sm:flex-row gap-2 justify-center min-w-[150px]">
                {canManageInventory && (
                  <button
                    className="btn btn-outline btn-warning btn-sm"
                    onClick={() => openEditModal(proInvent)}
                  >
                    <EditIcon className="w-5 h-5" />
                    Editar
                  </button>
                )}

                {canManageInventory && (
                  <button
                    className="btn btn-outline btn-error btn-sm"
                    onClick={() => openDeleteModal(proInvent.id)}
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
      />
    </div>

    {/* Modal de registro y edición */}
    <dialog id="pro_invent_modal" className="modal modal-middle">
      <div className="modal-box w-11/12 max-w-lg max-h-[90vh] overflow-y-auto">

        <h3 className="font-bold text-lg sm:text-xl mb-4">
          {isEditing
            ? "Editar Inventario de un Producto"
            : "Registrar compra de un producto"}
        </h3>

        <form className="mt-4 space-y-4" onSubmit={handleSubmit}>

          {/* Producto */}
          <div>
            <label className="label">
              <span className="label-text font-medium">Producto</span>
            </label>

            <select
              className="select select-bordered w-full"
              required
              value={currentProInvent.product?.id || ''}
              onChange={(e) => {
                const selectedId = Number(e.target.value);
                const selectedProduct =
                  products.find(p => p.id === selectedId) || null;

                setCurrentProInvent(prev => ({
                  ...prev,
                  product: selectedProduct
                }));
              }}
            >
              <option value="" disabled>
                Selecciona un producto
              </option>

              {products.map((product) => (
                <option key={product.id} value={product.id}>
                  {product.name}
                </option>
              ))}
            </select>
          </div>

          {/* Sucursal */}
          <div>
            <label className="label">
              <span className="label-text font-medium">Sucursal</span>
            </label>

            <select
              className="select select-bordered w-full"
              required
              value={currentProInvent.branch?.id || ''}
              onChange={(e) => {
                const selectedBranch =
                  branches.find(
                    branch => branch.id === Number(e.target.value)
                  ) || null;

                setCurrentProInvent(current => ({
                  ...current,
                  branch: selectedBranch
                }));
              }}
            >
              <option value="" disabled>
                Selecciona una sucursal
              </option>

              {branches.map((branch) => (
                <option key={branch.id} value={branch.id}>
                  {branch.name}
                </option>
              ))}
            </select>
          </div>

          {/* Cantidad */}
          <div>
            <label className="label">
              <span className="label-text font-medium">Cantidad</span>
            </label>

            <input
              type="number"
              min="0"
              step="1"
              required
              className="input input-bordered w-full"
              placeholder="Ingresa la cantidad"
              value={currentProInvent.stock}
              onChange={(e) =>
                setCurrentProInvent({
                  ...currentProInvent,
                  stock: e.target.value
                })
              }
            />
          </div>

          {/* Información del usuario */}
          <div className="bg-base-200 rounded-lg p-3 text-sm space-y-2">
            <p>
              <strong>Usuario:</strong>{' '}
              {currentUser?.firstName} {currentUser?.lastName}
            </p>

            <p>
              <strong>Sucursal seleccionada:</strong>{' '}
              {currentProInvent.branch?.name || 'Selecciona una sucursal'}
            </p>
          </div>

          {/* Botones */}
          <div className="flex flex-col-reverse sm:flex-row sm:justify-end gap-2 pt-2">

            <button
              type="button"
              className="btn btn-outline btn-error w-full sm:w-auto"
              onClick={() =>
                document.getElementById("pro_invent_modal").close()
              }
            >
              Cancelar
            </button>

            <button
              type="submit"
              className="btn btn-success w-full sm:w-auto"
            >
              <SaveIcon className="w-5 h-5" />
              {isEditing ? "Guardar Cambios" : "Registrar"}
            </button>

          </div>

        </form>
      </div>
    </dialog>

    {/* Modal de eliminación */}
    <dialog className="modal modal-middle" id="delete_modal">
      <div className="modal-box w-11/12 max-w-md">

        <h3 className="font-bold text-lg text-red-500 text-center">
          ¿Estás seguro de eliminar este registro?
        </h3>

        <p className="text-center text-sm sm:text-base py-3">
          Esta acción no se puede deshacer.
        </p>

        <div className="flex flex-col-reverse sm:flex-row justify-center gap-2 mt-4">

          <button
            className="btn btn-outline btn-success w-full sm:w-auto"
            onClick={() => {
              setConfirmDeleteId(null);
              document.getElementById('delete_modal').close();
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

export default ProInvent