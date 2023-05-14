---
layout: post
title: JSON to CSV with BASH
description: BASH parse JSON to CSV
tags: bash json csv
---

Hey, recently I've posted about [jq]({% post_url 2018-03-23-format-curl-json %}) and today I'm going
to explain how I used it to parse JSON from web (retrieved with CURL) and turn it to CSV.

First of all let's see what JSON we have:

```javascript
{
  "data": [
    {
      "short_data": {
        "name": "value1",
        "link": "value2"
      },
      "long_data": {
        "company_name" "value3",
        "company_position" "value4"
      }
    },
    {/*...*/},
    {/*...*/},
    {/*...*/}
  ]
}
```
<br/>

Ok, the CSV we want to get is:

```
name,link,company_name,company_position
value1,value2,value3,value4
value1,value2,value3,value4
...
```
<br/>

And here is how simple it is:

```bash
jq -r '.data | map(.short_data.name), map(.short_data.link), map(.long_data.company_name), map(.long_data.company_position) | @csv' <<< $OUTPUT
```
<br/>

`$OUTPUT` - is variable containing the JSON string (retrieved with CURL in my case)

As you can see jq has it's own pipe and we can fetch values from json "path" and pass it to `@csv` handler.

Looks great but the result is a bit different from what we were expected:

```
value1,value1,value1,value1
value2,value2,value2,value2
value3,value3,value3,value3
value4,value4,value4,value4
...
```
<br/>

What do we need is transpose the output. [csvtool](https://github.com/Chris00/ocaml-csv) is great package that allow us to do it.
We can pipe our csv to `<csv> | csvtool transpose -` and get result we need.

And final command:

```bash
jq -r '.data | map(.short_data.name), map(.short_data.link), map(.long_data.company_name), map(.long_data.company_position) | @csv' <<< $OUTPUT | csvtool transpose -
```
<br/>

leads to result:

```
value1,value2,value3,value4
value1,value2,value3,value4
...
```
<br/>
exactly what we need.
