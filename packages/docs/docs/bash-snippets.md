---
id: bash-snippets
title: Snippets (bash)
sidebar_label: Bash Snippets
---

##### Looping

```sh
for _BUILDABLE_PACKAGE in "${PARTRIDGE_SPLITTABLE_PACKAGES[@]}";
do
    [ -z "${_BUILDABLE_PACKAGE}" ] && continue
    ...
done

```



#### Empty tests

```bash
# empty string..
if [ -z ]; then
fi

# non-empty string..
if [ -n ]; then
fi
```



Tests

```bash
man test
```
