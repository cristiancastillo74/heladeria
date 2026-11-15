import React, { useEffect, useState } from 'react'
import { deleteExpense, getExpenses, getTypeExpenses, saveExpense } from '../services/expenseService';
import PaginatedTable from '../component/PaginatedTable';
import { AddIcon, DeleteIcon, SaveIcon } from '../assets/icons';
import { useAuth } from '../context/AuthContext';
import { getUserBranches } from '../services/userService';

const Expenses = () => {
    const [expense,     setExpense]                     = useState([]);
    const [isLoading, setIsLoading]                     = useState(true);
    const [isError,     setIsError]                     = useState(null);
    const [confirmDeleteId, setconfirmDeleteId]         = useState(null);
    const [confirmDeleteDesc, setConfirmDeleteDesc]     = useState('');
    const [currentExpense, setCurrentExpense]           = useState({descripcion:'', amount:0, user:null, branch:null});
    const [isEditing, setIsEditing]                     = useState(false);
    const [saveError, setSaveError]                     = useState('');
    const { currentUser, currentBranch }                = useAuth();
    const canManageExpenses = ['ADMIN_GLOBAL', 'ADMIN_BRANCH'].includes(currentUser?.role);
    const [typeExpenseOptions, setTypeExpenseOptions]   = useState([]);
    const [branches, setBranches]                     = useState([]);

    useEffect(() => {
        const fetchExpenses = async () =>{
            try{
                const data = await getExpenses();
                setExpense(data);
                console.log(data);
            }catch(err){
                setIsError('error');
                console.log(err);
            }finally{
                setIsLoading(false);
            }
        };
        fetchExpenses();
    },[]);

    useEffect(() => {
          const fetchTypeExpenses = async () =>{
            try{
              const data = await getTypeExpenses();
              setTypeExpenseOptions(data);
              //console.log(data);
            }catch(err){
              setIsError("error");
              console.log(err);
            }
          };
          fetchTypeExpenses();
        }, []);

        useEffect(() => {
            getUserBranches().then(setBranches).catch((err) => {
                setIsError('No se pudieron cargar las sucursales');
                console.error(err);
            });
        }, []);

    const openCreateModal = () => {
        setCurrentExpense({
            descripcion: '',
            amount: '',
            typeExpense: '',
            user: currentUser,
            branch: currentBranch || (branches.length === 1 ? branches[0] : null)
        });
        setSaveError('');
        setIsEditing(false);
        document.getElementById('save_modal').showModal();
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setSaveError('');
        try{
            const expenseToSave = {
                ...(currentExpense.id ? { id: currentExpense.id } : {}),
                descripcion: currentExpense.descripcion.trim(),
                amount: Number(currentExpense.amount),
                typeExpense: currentExpense.typeExpense,
                user: currentUser ? { idUser: currentUser.id } : null,
                branch: currentExpense.branch ? { id: Number(currentExpense.branch.id) } : null
            };
            await saveExpense(expenseToSave);
            const update = await getExpenses();
            setExpense(update);
            document.getElementById('save_modal').close();
            setCurrentExpense({descripcion:'', amount:'', typeExpense:'', user: currentUser, branch: currentBranch});
        }catch(error){
            console.error('Error al registrar gasto:', error.response?.data || error.message);
            const responseMessage = error.response?.data;
            setSaveError(typeof responseMessage === 'string'
                ? responseMessage
                : 'No se pudo registrar el gasto. Verifica los datos e inténtalo nuevamente.');
        }
    };

    const openDeleteModal = (id, desc) => {
        setconfirmDeleteId(id);
        setConfirmDeleteDesc(desc);
        document.getElementById('delete_modal').showModal();
    };

    const confirmDelete = async () => {
        try{
            await deleteExpense(confirmDeleteId);
            const update = await getExpenses();
            setExpense(update);
            setconfirmDeleteId(null);
            document.getElementById('delete_modal').close();
        }catch(err){
            console.log(err);
        }
    }

    if(isLoading) return <p className='text-center mt-10'>Cargando Productos..</p>
    if(isError)   return <p className='text-center mt-10 text-red-500'>{isError}</p>
    
return (
  <div className="w-full min-w-0 px-3 py-4 sm:px-5 sm:py-6 lg:px-8 lg:py-8">

    {/* Encabezado */}
    <div className="mb-5">
      <h1 className="text-xl sm:text-2xl font-bold text-center sm:text-left">
        REGISTRO DE GASTOS
      </h1>
    </div>

    {/* Tabla */}
    <div className="w-full min-w-0 overflow-x-auto">
      <PaginatedTable
        columns={canManageExpenses
          ? [
              'ID',
              'GASTO',
              'MONTO',
              'TIPO',
              'SUCURSAL',
              'QUIEN REALIZÓ EL GASTO',
              'FECHA REGISTRO',
              'FECHA MODIFICACIÓN',
              'ACCIONES'
            ]
          : [
              'ID',
              'GASTO',
              'MONTO',
              'TIPO',
              'SUCURSAL',
              'QUIEN REALIZÓ EL GASTO',
              'FECHA REGISTRO',
              'FECHA MODIFICACIÓN'
            ]}
        data={expense}
        renderRow={(ex) => (
          <tr key={ex.id} className="hover:bg-base-300">
            <td className="text-center">{ex.id}</td>
            <td className="text-center">{ex.descripcion}</td>
            <td className="text-center">$ {ex.amount}</td>
            <td className="text-center">{ex.typeExpense}</td>
            <td className="text-center">
              {ex.branch?.name || 'Sin sucursal'}
            </td>
            <td className="text-center">
              {ex.user?.firstName} {ex.user?.lastName}
            </td>
            <td className="text-center">{ex.createdAt}</td>
            <td className="text-center">{ex.updatedAt}</td>

            {canManageExpenses && (
              <td>
                <div className="flex justify-center">
                  <button
                    className="btn btn-outline btn-error btn-sm w-full sm:w-auto"
                    onClick={() => openDeleteModal(ex.id, ex.descripcion)}
                  >
                    <DeleteIcon className="w-5 h-5 text-current" />
                    Eliminar
                  </button>
                </div>
              </td>
            )}
          </tr>
        )}
        extraAction={
          <button
            className="btn btn-outline btn-primary w-full sm:w-auto"
            onClick={openCreateModal}
          >
            <AddIcon className="w-5 h-5 text-current" />
            Registrar Gasto
          </button>
        }
        filasPorPagina={10}
      />
    </div>

    {/* Modal registrar gasto */}
    <dialog id="save_modal" className="modal modal-middle">
      <div className="modal-box w-11/12 max-w-lg max-h-[90vh] overflow-y-auto">

        <h3 className="font-bold text-lg sm:text-xl text-yellow-500 text-center">
          {isEditing ? 'Editando el Gasto' : 'Registrando un Nuevo Gasto'}
        </h3>

        <form
          className="mt-4 space-y-3"
          onSubmit={handleSubmit}
        >
          <div>
            <label className="label">
              <span className="label-text">Descripción del gasto</span>
            </label>
            <textarea
              required
              placeholder="Descripción del gasto"
              className="textarea textarea-bordered w-full min-h-24"
              value={currentExpense.descripcion}
              onChange={(e) =>
                setCurrentExpense({
                  ...currentExpense,
                  descripcion: e.target.value
                })
              }
            />
          </div>

          <div>
            <label className="label">
              <span className="label-text">Tipo de gasto</span>
            </label>
            <select
              className="select select-bordered w-full"
              required
              value={currentExpense.typeExpense}
              onChange={(e) =>
                setCurrentExpense({
                  ...currentExpense,
                  typeExpense: e.target.value
                })
              }
            >
              <option value="">-- Selecciona un tipo de gasto --</option>
              {typeExpenseOptions.map((type) => (
                <option key={type} value={type}>
                  {type}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="label">
              <span className="label-text">Monto del gasto</span>
            </label>
            <input
              type="number"
              required
              min="0.01"
              step="0.01"
              placeholder="Monto del gasto"
              className="input input-bordered w-full"
              value={currentExpense.amount}
              onChange={(e) =>
                setCurrentExpense({
                  ...currentExpense,
                  amount: e.target.value
                })
              }
            />
          </div>

          <div>
            <label className="label">
              <span className="label-text">Sucursal</span>
            </label>
            <select
              className="select select-bordered w-full"
              required
              value={currentExpense.branch?.id || ''}
              onChange={(e) => {
                const selectedBranch = branches.find(
                  (branch) => branch.id === Number(e.target.value)
                ) || null;

                setCurrentExpense((current) => ({
                  ...current,
                  branch: selectedBranch
                }));
              }}
            >
              <option value="" disabled>
                -- Selecciona una sucursal --
              </option>

              {branches.map((branch) => (
                <option key={branch.id} value={branch.id}>
                  {branch.name}
                </option>
              ))}
            </select>
          </div>

          {saveError && (
            <p className="text-sm text-error" role="alert">
              {saveError}
            </p>
          )}

          {/* Información del usuario */}
          <div className="rounded-lg bg-base-200 p-3 text-sm space-y-1">
            <p>
              <strong>Usuario:</strong>{' '}
              {currentUser?.firstName} {currentUser?.lastName}
            </p>
            <p>
              <strong>Sucursal seleccionada:</strong>{' '}
              {currentExpense.branch?.name || 'Selecciona una sucursal'}
            </p>
          </div>

          <div className="modal-action flex flex-col-reverse sm:flex-row">
            <button
              type="button"
              className="btn w-full sm:w-auto"
              onClick={() =>
                document.getElementById('save_modal').close()
              }
            >
              Cancelar
            </button>

            <button
              type="submit"
              className="btn btn-success w-full sm:w-auto"
            >
              {isEditing ? 'Actualizar' : 'Registrar'}
            </button>
          </div>
        </form>
      </div>
    </dialog>

    {/* Modal confirmar eliminación */}
    <dialog id="delete_modal" className="modal modal-middle">
      <div className="modal-box w-11/12 max-w-md">

        <h3 className="font-bold text-lg text-red-500">
          Eliminar el Gasto Registrado
        </h3>

        <p className="py-4 break-words">
          ¿Estás seguro de eliminar el gasto?
          <strong className="block mt-2">{confirmDeleteDesc}</strong>
        </p>

        <div className="modal-action flex flex-col-reverse sm:flex-row">
          <button
            className="btn w-full sm:w-auto"
            onClick={() => {
              setconfirmDeleteId(null);
              setConfirmDeleteDesc('');
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

};

export default Expenses