import axios from 'axios';
import { API_URL } from '../config/api';

const API_ENDPOINT = `${API_URL}/helados/product`;

export const getProducts = async () => {
  try {
    const response = await axios.get(API_ENDPOINT);
    return response.data;
  } catch (error) {
    console.error('error al obtener los productos', error);
    throw error;
  }
};

export const saveProduct = async (product) => {
  try {
    const response = await axios.post(API_ENDPOINT, product);
    return response.data;
  } catch (error) {
    console.error('error al guardar producto', error);
    throw error;
  }
};

export const deleteProduct = async (id) => {
  try {
    await axios.delete(`${API_ENDPOINT}/${id}`);
  } catch (error) {
    console.error('Error al eliminar producto', error);
    throw error;
  }
};