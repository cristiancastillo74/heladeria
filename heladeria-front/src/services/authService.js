import axios from 'axios';
import { AUTH_URL } from '../config/api';

export const requestLogin = async (username, password) => {
  const response = await axios.post(`${AUTH_URL}/login`, {
    username,
    password
  });

  return response.data;
};