import { createRoot } from 'react-dom/client';
import AppProvider from '@/components/layout/AppProvider';
import './index.css';

createRoot(document.getElementById('root')!).render(<AppProvider />);
