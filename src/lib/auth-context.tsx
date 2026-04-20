import React, { createContext, useContext } from 'react';

type AppRole = 'admin' | 'manager' | 'employee';

interface Profile {
  id: string;
  full_name: string;
  email: string;
  phone: string;
  avatar_url: string | null;
  department_id: string | null;
  designation_id: string | null;
  employee_id: string;
  status: 'active' | 'inactive' | 'on_leave';
  joining_date: string;
  salary: number | null;
}

interface AuthContextType {
  session: { access_token: string } | null;
  user: { id: string; email: string } | null;
  profile: Profile | null;
  role: AppRole;
  loading: boolean;
  signIn: (email: string, password: string) => Promise<{ error: Error | null }>;
  signOut: () => Promise<void>;
  refreshProfile: () => Promise<void>;
}

const MOCK_PROFILE: Profile = {
  id: 'mock-admin-id',
  full_name: 'Admin User',
  email: 'admin@opscore.local',
  phone: '',
  avatar_url: null,
  department_id: null,
  designation_id: null,
  employee_id: 'EMP-001',
  status: 'active',
  joining_date: new Date().toISOString().split('T')[0],
  salary: null,
};

const MOCK_CONTEXT: AuthContextType = {
  session: { access_token: 'mock-token' },
  user: { id: 'mock-admin-id', email: 'admin@opscore.local' },
  profile: MOCK_PROFILE,
  role: 'admin',
  loading: false,
  signIn: async () => ({ error: null }),
  signOut: async () => { /* no-op in demo mode */ },
  refreshProfile: async () => { /* no-op in demo mode */ },
};

const AuthContext = createContext<AuthContextType>(MOCK_CONTEXT);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  return (
    <AuthContext.Provider value={MOCK_CONTEXT}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  return useContext(AuthContext);
}
