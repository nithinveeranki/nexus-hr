import { supabase } from '@/integrations/supabase/client';
import { toast } from 'sonner';

const DEMO_ERROR_MESSAGE = '🔒 Demo Mode — You do not have permission to modify data.';

/**
 * Wraps a Supabase mutation and intercepts RLS permission errors
 * with a clean user-facing message.
 */
export async function guardedMutation<T>(
  operation: () => Promise<{ data: T | null; error: { message: string; code?: string } | null }>
): Promise<{ data: T | null; error: { message: string } | null }> {
  const result = await operation();

  if (result.error) {
    const msg = result.error.message?.toLowerCase() || '';
    if (
      msg.includes('row-level security') ||
      msg.includes('policy') ||
      msg.includes('permission denied') ||
      msg.includes('insufficient_privilege') ||
      result.error.code === '42501'
    ) {
      toast.error(DEMO_ERROR_MESSAGE);
      return { data: null, error: { message: DEMO_ERROR_MESSAGE } };
    }
  }

  return result;
}

export const logActivity = async (
  actorId: string | null,
  action: string,
  targetType: 'employee' | 'department' | 'designation',
  targetId: string,
  metadata?: object
) => {
  // In demo/read-only mode, silently skip activity logging
  // since inserts will be denied by RLS anyway
  try {
    await supabase.from('activity_logs').insert({
      actor_id: actorId,
      action,
      target_type: targetType,
      target_id: targetId,
      metadata: (metadata as Record<string, unknown>) || {}
    });
  } catch {
    // Silently ignore — activity logging is non-critical
  }
};
