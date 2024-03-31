/** @type {import('tailwindcss').Config} */

import daisyui from 'daisyui'
import tailWindTypography from '@tailwindcss/typography'


export default {
    content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
    theme: {
        extend: {},
    },
    plugins: [
        daisyui,
        /*tailwind 会破坏原有的markdown样式，所以要包一层:
        * 1. pnpm install -D @tailwindcss/typography
        * 2. tailwind.config.mjs 增加 plugins[require('@tailwindcss/typography')]
        * 3. 用一个特殊layout包住所有markdown: <div class="prose prose-stone lg:prose"><slot/></div>
        * */
        tailWindTypography
    ],
}
