import axios from 'axios';
import { API_URL } from '../config/api';

const API_ENDPOINT = `${API_URL}/helados/expenses`;

export const getExpenses = async () => {
  try {
    const response = await axios.get(API_ENDPOINT);
    return response.data;
  } catch (error) {
    console.log("we cant get expenses", error);
    throw error;
  }
};

export const saveExpense = async (expense) => {
  try {
    const response = await axios.post(API_ENDPOINT, expense);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const deleteExpense = async (id) => {
  try {
    await axios.delete(`${API_ENDPOINT}/${id}`);
  } catch (error) {
    console.log('error al eliminar');
    throw error;
  }
};

export const getTypeExpenses = async () => {
  try {
    const response = await axios.get(`${API_ENDPOINT}/typeExpenses`);
    return response.data;
  } catch (error) {
    console.log('error al obtener los tipos de gastos');
    throw error;
  }
};