import axios from 'axios';
import { API_URL } from '../config/api';

const API_ENDPOINT = `${API_URL}/helados/productInventory`;

export const getProInvents = async () => {
  try {
    const response = await axios.get(API_ENDPOINT);
    return response.data;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export const getSaleProInvents = async (branchId) => {
  const response = await axios.get(
    `${API_URL}/helados/sale/inventory/products`,
    {
      params: branchId ? { branchId } : {}
    }
  );

  return response.data;
};

export const saveProInvent = async (proInvent) => {
  try {
    const response = await axios.post(API_ENDPOINT, proInvent);
    return response.data;
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export const deleteProInvent = async (id) => {
  try {
    await axios.delete(`${API_ENDPOINT}/${id}`);
  } catch (error) {
    console.log(error);
    throw error;
  }
};