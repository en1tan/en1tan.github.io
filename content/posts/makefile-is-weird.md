---
title: "Makefile Is Weird"
date: 2022-02-21T22:20:57+01:00
---

Hello :heart:

```go {lineos=table}
func main() {
  fmt.Println("Hello World")
}
```

```mk
SHELL := /bin/bash
.POSIX

DATEOF:=$(shell date +%FT%T)
```
