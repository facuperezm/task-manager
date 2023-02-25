import "@/styles/globals.css";
import Glasspane from "@/components/GlassPane";
import { Inter } from "@next/font/google";

const inter = Inter({
  variable: "--font-inter",
});
interface Props {
  children: React.ReactNode;
}

export default function AuthRootLayout({ children }: Props) {
  return (
    <html lang="en" className={inter.variable}>
      <head />
      <body className="h-screen w-screen rainbow-mesh p-6">
        <Glasspane className="w-full h-full flex item-center justify-center">
          {children}
        </Glasspane>
      </body>
    </html>
  );
}
