import resolveConfig from 'tailwindcss/resolveConfig'
import tailwindConfig from "../../../../tailwind.config.js"; // Your tailwind config
// import {Config, ScreensConfig} from "tailwindcss/types/config";

// https://tailwindcss.com/docs/configuration#using-esm-or-type-script
// 因为tailwindcss/resolveConfig 是js实现的，没有提供ts版本的接口，github上没找到源码，
// 只能从npm里看

const fullConfig=resolveConfig(tailwindConfig);
console.log(`ccc ${fullConfig.theme.width[4]}`);

fullConfig.theme.width[4]
// => '1rem'

fullConfig.theme.screens.md
// => '768px'

fullConfig.theme.boxShadow['2xl']
