import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { AuthProvider } from "@/lib/auth-context";
import { ThemeProvider } from "@/lib/theme-context";
import { ErrorBoundary } from "@/components/ErrorBoundary";
import DashboardLayout from "@/components/DashboardLayout";
import DashboardPage from "@/pages/Dashboard";
import EmployeesPage from "@/pages/Employees";
import DepartmentsPage from "@/pages/Departments";
import DesignationsPage from "@/pages/Designations";
import ReportsPage from "@/pages/Reports";
import ActivityLogPage from "@/pages/ActivityLog";
import SettingsPage from "@/pages/Settings";
import NotFound from "@/pages/NotFound";

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: 1,
      refetchOnWindowFocus: false,
      staleTime: 5 * 60 * 1000,
    },
  },
});

const App = () => (
  <ErrorBoundary>
    <QueryClientProvider client={queryClient}>
      <ThemeProvider>
        <AuthProvider>
          <TooltipProvider>
            <Sonner />
            <BrowserRouter>
              <Routes>
                <Route element={<DashboardLayout />}>
                  <Route path="/" element={<DashboardPage />} />
                  <Route path="/employees" element={<EmployeesPage />} />
                  <Route path="/departments" element={<DepartmentsPage />} />
                  <Route path="/designations" element={<DesignationsPage />} />
                  <Route path="/reports" element={<ReportsPage />} />
                  <Route path="/activity" element={<ActivityLogPage />} />
                  <Route path="/settings" element={<SettingsPage />} />
                </Route>
                <Route path="*" element={<NotFound />} />
              </Routes>
            </BrowserRouter>
          </TooltipProvider>
        </AuthProvider>
      </ThemeProvider>
    </QueryClientProvider>
  </ErrorBoundary>
);

export default App;
