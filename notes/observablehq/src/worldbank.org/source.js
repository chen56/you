import * as d3 from 'd3';

export function source() {
    return d3.json("https://api.worldbank.org/v2/source?format=json");
}
