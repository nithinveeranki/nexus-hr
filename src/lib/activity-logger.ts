import { toast } from 'sonner';

const DEMO_MODE = true;
const DEMO_ERROR_MESSAGE = '🔒 Demo Mode — You do not have permission to modify data.';

/**
 * Blocks all write operations in demo mode.
 * When DEMO_MODE is true, immediately rejects with a permission error
 * instead of sending the request to Supabase at all.
 */
export async function guardedMutation<T>(
  _operation: () => Promise<{ data: T | null; error: { message: string; code?: string } | null }>
): Promise<{ data: T | null; error: { message: string } | null }> {
  if (DEMO_MODE) {
    toast.error(DEMO_ERROR_MESSAGE);
    return { data: null, error: { message: DEMO_ERROR_MESSAGE } };
  }

  const result = await _operation();
  return result;
}

export const logActivity = async (
  _actorId: string | null,
  _action: string,
  _targetType: 'employee' | 'department' | 'designation',
  _targetId: string,
  _metadata?: object
) => {
  // In demo mode, skip all activity logging
  if (DEMO_MODE) return;
};
