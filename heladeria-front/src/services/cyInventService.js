import axios from 'axios';
import { API_URL } from '../config/api';

const API_ENDPOINT = `${API_URL}/helados/cyInventory`;

export const getCyInvent = async () => {
  try {
    const result = await axios.get(API_ENDPOINT);
    return result.data;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export const getCyInventDisponiblesCondicional = async () => {
  try {
    const result = await axios.get(`${API_ENDPOINT}/buy`);
    return result.data;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export const getSaleCyInventDisponibles = async (branchId) => {
  const result = await axios.get(
    `${API_URL}/helados/sale/inventory/cylinders/available`,
    {
      params: branchId ? { branchId } : {}
    }
  );

  return result.data;
};

export const saveInvent = async (cyInvent) => {
  try {
    const response = await axios.post(API_ENDPOINT, cyInvent);
    return response;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export const deleteCyInvent = async (id) => {
  try {
    await axios.delete(`${API_ENDPOINT}/${id}`);
  } catch (error) {
    console.log(error);
    throw error;
  }
};