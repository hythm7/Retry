NAME
====

Retry - Retry action

SYNOPSIS
========

```raku
use Retry;

retry { action }, :4max, :2delay;
```

DESCRIPTION
===========

Retry is a module that exports `retry` sub which takes a `Block` to retry execute until success and return the result. or in case of `Exception`, rethrow after `max` retries.

`max` defaults to `4`. sets the max number of retries. `-∞ ≤ max < 0` to retry forever.

`delay` defaults to `0.2`. sets the delay between retries. delay doubles with every retry.

AUTHOR
======

Haytham Elganiny <elganiny.haytham@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2020 Haytham Elganiny

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

