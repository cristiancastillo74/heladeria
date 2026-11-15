
import { Link } from 'react-router-dom';
import React, { useState } from 'react';
import { useAuth } from '../context/AuthContext';

export default function Navbar() {
  const { currentUser, logout } = useAuth();
  const [menuOpen, setMenuOpen] = useState(false);
  const [reportsOpen, setReportsOpen] = useState(false);
  const [productsOpen, setProductsOpen] = useState(false);
  const [inventoryOpen, setInventoryOpen] = useState(false);

  const canManageUsers = ['ADMIN_GLOBAL', 'ADMIN_BRANCH'].includes(currentUser?.role);
  const isGlobalAdmin = currentUser?.role === 'ADMIN_GLOBAL';
  const canViewInventory =
    canManageUsers ||
    (currentUser?.role === 'EMPLOYEE' && currentUser?.canViewInventory);
  const canManageCatalogs = canManageUsers;

  const closeMenu = () => {
    setMenuOpen(false);
    setReportsOpen(false);
    setProductsOpen(false);
    setInventoryOpen(false);
  };

  const linkClass =
    'btn btn-ghost justify-start w-full lg:w-auto text-white';

  return (
    <nav className="navbar bg-blue-500 text-white shadow-md px-4 relative z-50">
      {/* Logo */}
      <div className="flex-1">
        <Link
          to="/"
          onClick={closeMenu}
          className="btn btn-ghost normal-case text-xl"
        >
          Heladería
        </Link>
      </div>

      {/* Botón móvil */}
      <button
        type="button"
        className="btn btn-ghost btn-square lg:hidden"
        onClick={() => setMenuOpen(!menuOpen)}
        aria-label={menuOpen ? 'Cerrar menú' : 'Abrir menú'}
        aria-expanded={menuOpen}
      >
        {menuOpen ? (
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth="2"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        ) : (
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth="2"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M4 6h16M4 12h16M4 18h16"
            />
          </svg>
        )}
      </button>

      {/* Menú */}
      <div
        className={`
          ${menuOpen ? 'flex' : 'hidden'}
          lg:flex
          flex-col lg:flex-row
          items-stretch lg:items-center
          gap-2
          absolute lg:static
          top-full left-0 right-0
          bg-blue-600 lg:bg-transparent
          p-4 lg:p-0
          shadow-lg lg:shadow-none
          max-h-[calc(100vh-64px)] overflow-y-auto
          lg:overflow-visible
        `}
      >
        {isGlobalAdmin && (
          <>
            <Link
              to="/"
              onClick={closeMenu}
              className={linkClass}
            >
              Dashboard
            </Link>

            {/* Reportería */}
            <div className="relative w-full lg:w-auto">
              <button
                type="button"
                onClick={() => setReportsOpen(!reportsOpen)}
                className={`${linkClass} lg:w-auto`}
                aria-expanded={reportsOpen}
              >
                Reportería
                <span className={`ml-2 transition-transform ${reportsOpen ? 'rotate-180' : ''}`}>
                  ⌄
                </span>
              </button>

              {reportsOpen && (
                <ul
                  className="
                    relative lg:absolute
                    left-0 top-full
                    menu p-2
                    shadow-lg
                    bg-blue-700 text-white
                    rounded-box
                    w-full lg:w-60
                    mt-1
                    z-[60]
                  "
                >
                  <li>
                    <Link to="/reports/sales" onClick={closeMenu}>
                      Reporte de ventas
                    </Link>
                  </li>

                  <li>
                    <Link to="/reports/balance" onClick={closeMenu}>
                      Balance Mensual
                    </Link>
                  </li>

                  <li>
                    <Link to="/reports/products" onClick={closeMenu}>
                      Inventario de Productos
                    </Link>
                  </li>

                  <li>
                    <Link to="/reports/cylinders" onClick={closeMenu}>
                      Inventario de Helados
                    </Link>
                  </li>

                  <li>
                    <Link to="/reports/orders/products" onClick={closeMenu}>
                      Pedido de productos
                    </Link>
                  </li>

                  <li>
                    <Link to="/reports/orders/ice-creams" onClick={closeMenu}>
                      Pedido de helados
                    </Link>
                  </li>
                </ul>
              )}
            </div>

          </>
        )}

        <Link to="/sales" onClick={closeMenu} className={linkClass}>
          Registrar Venta
        </Link>

        <Link to="/sales/history" onClick={closeMenu} className={linkClass}>
          Ventas
        </Link>

        <Link to="/expenses" onClick={closeMenu} className={linkClass}>
          Gastos
        </Link>

        
        {/* Gestión de productos */}
        {canManageCatalogs && (
          <div className="relative w-full lg:w-auto">
            <button
              type="button"
              onClick={() => setProductsOpen(!productsOpen)}
              className={`${linkClass} lg:w-auto`}
              aria-expanded={productsOpen}
            >
              Gestión de productos
              <span className={`ml-2 transition-transform ${productsOpen ? 'rotate-180' : ''}`}>
                ⌄
              </span>
            </button>

            {productsOpen && (
              <ul className="
                relative lg:absolute
                left-0 top-full
                menu p-2 shadow-lg
                bg-blue-700 text-white
                rounded-box w-full lg:w-60
                mt-1 z-[60]
              ">
                <li>
                  <Link to="/cylinder" onClick={closeMenu}>
                    Cilindros
                  </Link>
                </li>
                <li>
                  <Link to="/product" onClick={closeMenu}>
                    Productos
                  </Link>
                </li>
              </ul>
            )}
          </div>
        )}

        {/* Gestión de inventarios */}
        {canViewInventory && (
          <div className="relative w-full lg:w-auto">
            <button
              type="button"
              onClick={() => setInventoryOpen(!inventoryOpen)}
              className={`${linkClass} lg:w-auto`}
              aria-expanded={inventoryOpen}
            >
              Gestión de inventarios
              <span className={`ml-2 transition-transform ${inventoryOpen ? 'rotate-180' : ''}`}>
                ⌄
              </span>
            </button>

            {inventoryOpen && (
              <ul className="
                relative lg:absolute
                left-0 top-full
                menu p-2 shadow-lg
                bg-blue-700 text-white
                rounded-box w-full lg:w-60
                mt-1 z-[60]
              ">
                <li>
                  <Link to="/cyInvent" onClick={closeMenu}>
                    Inventario de helados
                  </Link>
                </li>
                <li>
                  <Link to="/proInvent" onClick={closeMenu}>
                    Inventario de productos
                  </Link>
                </li>
              </ul>
            )}
          </div>
        )}


        {canManageUsers && (
          <Link to="/users" onClick={closeMenu} className={linkClass}>
            Usuarios
          </Link>
        )}

        {isGlobalAdmin && (
          <Link
            to="/admin/configuration"
            onClick={closeMenu}
            className={linkClass}
          >
            Configuración
          </Link>
        )}

        {/* Usuario */}
        <div className="border-t border-blue-400 lg:border-0 pt-3 lg:pt-0 lg:ml-2">
          <span className="block px-3 py-2 text-sm font-medium">
            {currentUser?.firstName || currentUser?.username}
          </span>
        </div>

        {/* Cerrar sesión */}
        <button
          type="button"
          className="btn btn-outline btn-sm text-white w-full lg:w-auto"
          onClick={() => {
            closeMenu();
            logout();
          }}
        >
          Cerrar sesión
        </button>
      </div>
    </nav>
  );
}
