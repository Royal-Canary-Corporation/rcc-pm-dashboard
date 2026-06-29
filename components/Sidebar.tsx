'use client';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import {
  LayoutDashboard, FolderKanban, ListTodo, Calendar,
  FileText, Wallet, Boxes, Users, HardHat,
} from 'lucide-react';

const nav = [
  { href: '/', label: 'Dashboard', icon: LayoutDashboard },
  { href: '/projects', label: 'Projects', icon: FolderKanban },
  { href: '/tasks', label: 'Tasks (Kanban)', icon: ListTodo },
  { href: '/calendar', label: 'Calendar', icon: Calendar },
  { href: '/documents', label: 'Documents', icon: FileText },
  { href: '/budget', label: 'Budget & Cost', icon: Wallet },
  { href: '/materials', label: 'Materials', icon: Boxes },
  { href: '/team', label: 'Team', icon: Users },
];

export default function Sidebar() {
  const path = usePathname();
  return (
    <aside className="w-60 bg-[#0F1B3D] text-white flex flex-col py-5 px-3 shrink-0">
      <div className="flex items-center gap-2 px-3 mb-8">
        <HardHat className="text-[#22c55e]" size={26} />
        <span className="font-bold text-lg">RCC PM</span>
      </div>
      <nav className="flex flex-col gap-1">
        {nav.map(({ href, label, icon: Icon }) => {
          const active = path === href;
          return (
            <Link
              key={href}
              href={href}
              className={`flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm transition ${
                active ? 'bg-[#2563eb] text-white' : 'text-slate-300 hover:bg-white/10'
              }`}
            >
              <Icon size={18} />
              {label}
            </Link>
          );
        })}
      </nav>
      <div className="mt-auto px-3 text-xs text-slate-400">
        Royal Canary Corp © 2026
      </div>
    </aside>
  );
}
