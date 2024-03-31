import type {Metadata} from "next";

import * as React from 'react';

import "./globals.css";

export const metadata: Metadata = {
    title: "Kou App",
    description: "make app easy",
};

export default function RootLayout({children}: Readonly<{ children: React.ReactNode }>) {
    return (
        <html lang="en">
        <body>
        {children}
        </body>
        </html>
    );
}