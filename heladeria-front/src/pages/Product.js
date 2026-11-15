import React, { useEffect, useState } from 'react'
import { deleteProduct, getProducts, saveProduct } from '../services/productService';
import PaginatedTable from '../component/PaginatedTable';
import { getCategories } from "../services/categoryService";
import { getProductStatuses } from '../services/adminConfigService';
import { EditIcon, DeleteIcon, SaveIcon, AddIcon} from '../assets/icons';

const Products = () => {
    const [products, setProducts]               = useState([]);
    const [loading, setLoading]                 = useState(true);
    const [error, setError]                     = useState(null);
    const [categories, setCategories]           = useState([]);
    const [productStatuses, setProductStatuses] = useState([]);
    const [currentProduct, setCurrentProduct]   = useState({ name: "", category: "", price: "", purchasePrice: "", isIceCream: false, ballsPerUnit: "" });
    const [isEditing, setIsEditing]             = useState(false); // false = crear, true = editar
    const [confirmDeleteId, setConfirmDeleteId] = useState(null);




    useEffect(() => {
        const fetchProducts = async () => {
            try{
                const data = await getProducts();
                setProducts(data);
                //console.log(data);
            } catch (err) {
                setError('error al obtenre los productos');
                console.error(err);
            } finally {
                setLoading(false)
            }
        };
        fetchProducts();
    }, []);

    useEffect(() => {
      getProductStatuses().then(setProductStatuses).catch((err) => console.error('Error al obtener estados:', err));
    }, []);

    // traer categorías
    useEffect(() => {
      const fetchCategories = async () => {
        try {
          const data = await getCategories();
          //console.log("categorías desde backend:", data);
          setCategories(data); 
        } catch (err) {
          console.error("Error al obtener categorías:", err);
        }
      };
      fetchCategories();
    }, []);


    const openCreateModal = () => {
      setCurrentProduct({ name: "",code: "", category: "", status: productStatuses[0] || 'ACTIVO', price: "", purchasePrice: "", isIceCream: false, ballsPerUnit: "" });
      setIsEditing(false);
      document.getElementById("product_modal").showModal();
    };

    const openEditModal = (product) => {
      setCurrentProduct(product);
      setIsEditing(true);
      document.getElementById("product_modal").showModal();
    };

    const handleSubmit = async (e) => {
      e.preventDefault();
      try {
        await saveProduct(currentProduct); // tu backend decide si es update o create según tenga id
        const updated = await getProducts();
        setProducts(updated);
        document.getElementById("product_modal").close();
        setCurrentProduct({ name: "",code: "", category: "", status: productStatuses[0] || 'ACTIVO', price: "", purchasePrice: "", ballsPerUnit: "" });
      } catch (err) {
        console.error("Error al guardar producto:", err);
      }
    };

    const openConfirmDelete = (id) => {
      setConfirmDeleteId(id);
      document.getElementById("confirm_delete_modal").showModal();
    };

    const confirmDelete = async () => {
      try {
        await deleteProduct(confirmDeleteId);
        const updated = await getProducts();
        setProducts(updated);
        setConfirmDeleteId(null);
        document.getElementById("confirm_delete_modal").close();
      } catch (err) {
        console.error("Error al eliminar producto:", err);
      }
    };

    if(loading) return <p className='text-center mt-10'>Cargando Productos..</p>
    if(error)   return <p className='text-center mt-10 text-red-500'>{error}</p>

  
return (
  <div className="w-full min-w-0 px-3 py-4 sm:px-5 sm:py-6 lg:px-8 lg:py-8">

    {/* Encabezado */}
    <div className="flex flex-col gap-3 mb-5 sm:flex-row sm:items-center sm:justify-between">
      <h1 className="text-xl sm:text-2xl font-bold text-center sm:text-left">
        PRODUCTOS
      </h1>
    </div>

    {/* Tabla */}
    <div className="w-full min-w-0 overflow-x-auto">
      <PaginatedTable
        columns={[
          'ID',
          'PRODUCTO',
          'CODIGO',
          'ESTADO',
          '¿ES HELADO?',
          'CATEGORIA',
          'PRECIO VENTA',
          'PRECIO COMPRA',
          'BOLAS POR UNI',
          'ACCIONES'
        ]}
        data={products}
        renderRow={(product) => (
          <tr key={product.id} className="hover:bg-base-300">
            <td className="text-center">{product.id}</td>
            <td className="text-center">{product.name}</td>
            <td className="text-center">{product.code}</td>
            <td className="text-center">{product.status || 'ACTIVO'}</td>
            <td className="text-center">
              {product.isIceCream ? "Sí" : "No"}
            </td>
            <td className="text-center">{product.category}</td>
            <td className="text-center">$ {product.price}</td>
            <td className="text-center">
              {product.purchasePrice == null
                ? '—'
                : `$ ${product.purchasePrice}`}
            </td>
            <td className="text-center">{product.ballsPerUnit}</td>

            <td>
              <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
                <button
                  className="btn btn-outline btn-warning btn-sm w-full sm:w-auto"
                  onClick={() => openEditModal(product)}
                >
                  <EditIcon className="w-5 h-5 text-current" />
                  Editar
                </button>

                <button
                  className="btn btn-outline btn-error btn-sm w-full sm:w-auto"
                  onClick={() => openConfirmDelete(product.id)}
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
            CREAR PRODUCTO
          </button>
        }
        filasPorPagina={10}
      />
    </div>

    {/* Modal crear / editar producto */}
    <dialog id="product_modal" className="modal modal-middle">
      <div className="modal-box w-11/12 max-w-lg max-h-[90vh] overflow-y-auto">
        <h3 className="font-bold text-lg sm:text-xl">
          {isEditing ? "Editar Producto" : "Nuevo Producto"}
        </h3>

        <form
          className="mt-4 space-y-3"
          onSubmit={handleSubmit}
        >
          <div>
            <label className="label">
              <span className="label-text">Nombre del producto</span>
            </label>
            <input
              type="text"
              placeholder="Nombre"
              className="input input-bordered w-full"
              value={currentProduct.name}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  name: e.target.value
                })
              }
              required
            />
          </div>

          <div>
            <label className="label">
              <span className="label-text">Código</span>
            </label>
            <input
              type="text"
              placeholder="Código"
              className="input input-bordered w-full"
              value={currentProduct.code}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  code: e.target.value
                })
              }
            />
          </div>

          <div>
            <label className="label">
              <span className="label-text">Categoría</span>
            </label>
            <select
              className="select select-bordered w-full"
              value={currentProduct.category}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  category: e.target.value
                })
              }
              required
            >
              <option value="">Seleccione Categoría</option>
              {categories.map((cat) => (
                <option key={cat} value={cat}>
                  {cat}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="label">
              <span className="label-text">Estado</span>
            </label>
            <select
              className="select select-bordered w-full"
              value={currentProduct.status || 'ACTIVO'}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  status: e.target.value
                })
              }
              required
            >
              {productStatuses.map((status) => (
                <option key={status} value={status}>
                  {status}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="label">
              <span className="label-text">Precio de venta</span>
            </label>
            <input
              type="number"
              min="0"
              step="0.01"
              placeholder="Precio de venta"
              className="input input-bordered w-full"
              value={currentProduct.price}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  price: e.target.value
                })
              }
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
              placeholder="Precio de compra"
              className="input input-bordered w-full"
              required
              value={currentProduct.purchasePrice ?? ''}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  purchasePrice: e.target.value
                })
              }
            />
          </div>

          <div>
            <label className="label">
              <span className="label-text">Bolas por unidad</span>
            </label>
            <input
              type="number"
              min="0"
              placeholder="Bolas por unidad"
              className="input input-bordered w-full"
              value={currentProduct.ballsPerUnit}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  ballsPerUnit: e.target.value
                })
              }
            />
          </div>

          <label className="flex items-center gap-3 cursor-pointer py-2">
            <input
              type="checkbox"
              className="checkbox"
              checked={currentProduct.isIceCream}
              onChange={(e) =>
                setCurrentProduct({
                  ...currentProduct,
                  isIceCream: e.target.checked
                })
              }
            />
            <span className="label-text">¿Es helado?</span>
          </label>

          <div className="modal-action flex flex-col-reverse sm:flex-row">
            <button
              type="button"
              className="btn w-full sm:w-auto"
              onClick={() =>
                document.getElementById("product_modal").close()
              }
            >
              Cancelar
            </button>

            <button type="submit" className="btn btn-success w-full sm:w-auto">
              {isEditing ? "Actualizar" : "Guardar"}
            </button>
          </div>
        </form>
      </div>
    </dialog>

    {/* Modal confirmar eliminación */}
    <dialog id="confirm_delete_modal" className="modal modal-middle">
      <div className="modal-box w-11/12 max-w-md">
        <h3 className="font-bold text-lg text-red-500">
          Confirmar eliminación
        </h3>

        <p className="py-4">
          ¿Está seguro de que desea eliminar este producto?
        </p>

        <div className="modal-action flex flex-col-reverse sm:flex-row">
          <button
            className="btn w-full sm:w-auto"
            onClick={() => {
              setConfirmDeleteId(null);
              document.getElementById("confirm_delete_modal").close();
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
export default Products;
