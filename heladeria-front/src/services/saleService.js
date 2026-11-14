import axios from "axios";

const API_URL = "http://localhost:8080/helados/sale"


export const saveSales = async (sale, branchId) => {
    try{
        console.log("Datos enviados para guardar la pinta:", sale);
        console.log("Sucursal:", branchId);
        const response = await axios.post(API_URL, sale, {
            params: {
                ...(branchId ? { branchId } : {})
            }
        });
        return response.data;
    }catch(error){
        console.error("Error al guardar la pinta:");
        console.error("Status:", error.response?.status);
        console.error("Mensaje:", error.response?.data);
        console.error("Payload:", error.config?.data);
        throw error;
    }
};

export const getSalesHistory = async (branchId) => {
    const response = await axios.get(API_URL, {
        params: branchId ? { branchId } : {}
    });
    return response.data;
};

export const deleteSale = async (saleId) => axios.delete(`${API_URL}/${saleId}`);