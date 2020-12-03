# CSV Lint Action

This action validates an CSV files with a given CSV schema using csvlint.


## Example usage

```yml
name: Lint

on: [push]

jobs:
  csv-linters:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: csv lint
      uses: ateli-development/csvlint-action@master
      env:
        MODIFIED_FILES: ${{ steps.file_changes.outputs.files}}
```
