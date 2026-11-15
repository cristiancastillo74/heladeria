import axios from 'axios';
import { API_URL } from '../config/api';

const API_ENDPOINT = `${API_URL}/helados/cylinder`;

export const getCylinder = async () => {
  try {
    const response = await axios.get(API_ENDPOINT);
    return response.data;
  } catch (error) {
    console.error('error', error);
    throw error;
  }
};

export const saveCylinder = async (cylinder) => {
  try {
    const response = await axios.post(API_ENDPOINT, cylinder);
    return response;
  } catch (error) {
    console.error('error', error);
    throw error;
  }
};

export const deleteCylinder = async (id) => {
  try {
    await axios.delete(`${API_ENDPOINT}/${id}`);
  } catch (error) {
    console.log('error', error);
    throw error;
  }
};