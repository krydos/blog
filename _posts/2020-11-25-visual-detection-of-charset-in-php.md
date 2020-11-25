---
layout: post
title: "PHP: visual charset detection of a string"
comments: true
description: mb_convert_encoding manually detect charset
---

Sometimes in `mb_convert_encoding($str, 'UTF-8', 'auto')` that latest `auto` argument won't work.

To find what charset the string is using you can get all possible charsets, convert your `$str` into that charset and print it:

```php
foreach(mb_list_encodings() as $charset) {
    echo mb_convert_encoding($str, 'UTF-8', $charset) . ' ----- ' . $chr . "\n";                                                                                                2              }
}
```

This code may not work for some charsets returned by `mb_list_encodings()`. You can ignore some of them like this:


```php
foreach(mb_list_encodings() as $charset) {
    if (in_array($chr, ['pass', 'wchar', 'byte2be', 'byte2le', 'byte4be', 'byte4le', 'BASE64', 'UUENCODE', 'HTML-ENTITIES', 'Quoted-Printable', '7bit', '8bit'])) {
        continue;
    }
    echo mb_convert_encoding($str, 'UTF-8', $charset) . ' ----- ' . $chr . "\n";                                                                                                2              }
}
```

Of course it's only applicable if you know that `$str` will always be in the charset you found.
