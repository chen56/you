import {defineConfig} from 'astro/config';
import tailwind from "@astrojs/tailwind";
import mdx from "@astrojs/mdx";
import Icons from 'unplugin-icons/vite'

import react from "@astrojs/react";

// https://astro.build/config


export default defineConfig({
    integrations: [tailwind(), react(), mdx()],
    vite: {
        ssr: {
            noExternal: ["primereact", "primeicons"]
        },
        plugins: [
            Icons({
                compiler: 'astro',
            }),

        ],
    },
});