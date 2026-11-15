import axios from 'axios';
import { API_URL } from '../config/api';

const API_ENDPOINT = `${API_URL}/status/all`;

export const getStatus = async () => {
  try {
    const response = await axios.get(API_ENDPOINT);
    return response.data;
  } catch (error) {
    console.error("Error al obtener status", error);
    throw error;
  }
};