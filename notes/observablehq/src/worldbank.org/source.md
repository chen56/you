---
title: study/worldbank
---

```js echo
import * as d3 from 'd3';
```

# study worldbank api  

## sources

```js echo
const sources = await d3.json("https://api.worldbank.org/v2/sources?format=json&per_page=100");
display(sources);
display(Inputs.table(sources[1]));
```

## sources_2_country

source==2 is World Development Indicators

```js
const sources_2_country = FileAttachment("data/sources_2_country.json").json();
```

```js echo
// worldbank has cors bug, can not fetch this on browser
// const sources = await d3.json("https://api.worldbank.org/v2/sources/2/country?format=json&per_page=10000");

display(sources_2_country);
display(Inputs.table(sources_2_country.source[0].concept[0].variable));
```