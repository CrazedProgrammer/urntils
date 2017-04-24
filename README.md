# urntils
A general utility library and bindings for urn  


# Generating bindings
The native bindings that this repo contains are hand-written.  
If you want to generate your own bindings, you can do that easily:  

### .lua (native) bindings
`urn gen-bindings.lisp --run -- <library name> <output lua file>`  
For example:  
`urn gen-bindings.lisp --run -- luv bindings/luv.lua`  

### .lisp bindings
`urn gen-bindings.lisp --run -- <input lua file>`  
For example:  
`urn gen-bindings.lisp --run -- bindings/luv.lua`  
This generates a bindings/luv.lisp file, with all the `define-native` declarations.
