const API_HOST = process.env.REACT_APP_API_URL ||
  `http://${window.location.hostname}:8080`;

export const API_URL = API_HOST;

export const ADMIN_URL = `${API_URL}/api/admin`;
export const CATALOG_URL = `${API_URL}/api/catalog`;
export const AUTH_URL = `${API_URL}/api/auth`;