import * as d3 from "d3";

process.stdout.write(await d3.text("https://api.worldbank.org/v2/sources/2/country?format=json&per_page=10000"));
