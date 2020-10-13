# Introduction
An application for removing Latin diacritics from text.

For example, "åëí" becomes "aei".

It runs in a browser with Javascript enabled. It is programmed in Purescript, transpiled to Javascript. The Javascript is then embedded in an HTML page.

# Developer Requirements
 - Purescript compiler (purs version 0.13.8)
   - with Spago version 0.16.0 (a build system for Purescript)
 - A web browser

# How to check version numbers
At the terminal, enter: 
`$ purs --version`

Expect:

`0.13.8`

At the terminal, enter: 
`$ spago version`

Expect:
`0.16.0`

# How to make the web page
Run the following command
```
$ spago bundle-app
```

You should now have a Javascript file in the current directory. 
Now open index.html.
It should provide the interaction for a button in the HTML file "index.html".


# How this project was started
`spago init`

`spago install strings`

`spago install lists`

`spago install spec`

# How to make the Javascript Module
spago build

# How to run the tests
spago test

## About the Developer of this Latin Diacritic Removal Web Application
www.linkedin.com/in/elsanussi-mneina-57a8181b5

https://github.com/elsanussi-s-mneina