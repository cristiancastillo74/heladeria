import axios from 'axios';
import { API_URL } from '../config/api';

const API_ENDPOINT = `${API_URL}/enum/category`;

export const getCategories = async () => {
  try {
    const response = await axios.get(API_ENDPOINT);
    return response.data;
  } catch (error) {
    console.error('Error al obtener categorías', error);
    throw error;
  }
};