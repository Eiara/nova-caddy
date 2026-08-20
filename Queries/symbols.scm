; Globals
; Don't get parsed into a sub-tree because I cannot
; figure out how to create a "globals" section in the symbol tree here.
; (global_options
;   (directive
;     name: (directive_name) @_dir @name
;     [
;       (placeholder)
;       (argument)
;     ]? @name
;   ) @subtree
;   (#set! role constant)
;   (#prefix! @name "global:: ")
; )

; Snippets are classes that get imported
((snippet_definition
  name: (snippet_name) @name)
  (#set! role class)
  (#replace! @name "[\\(|\\)]" "")
) @subtree

; Site blocks are ... types?
(
  (site_block 
    name: (site_address) @name
  )
  (#set! role type)
) @subtree

; Named matchers exist inside of either sites or snippets
((named_matcher 
  (matcher_identifier 
    name: (matcher_name) @name)
  (#prefix! @name "@")
  (#set! role function)
)) @subtree

; Mark the main `handle` directives.
; handle & handle_path directives that have matchers included
(((directive 
  name: (directive_name) @_dir @name
    [
      (matcher)
      (network_address)
    ] @name)
  )
  (#match? @_dir "^(handle|handle_path|reverse_proxy)$")
  (#set! role method)
) @subtree

; Select only handle/handle_path that are unqualified, as those default to
;   handling everything else
(((directive 
  name: (directive_name) @_dir @name
  .
  (block "{")) 
  )
  (#match? @_dir "^(handle|handle_path|handle_errors)$")
  ; add a '*' for visual clarity
  (#append! @name " *")
  (#set! role method)
) @subtree

; Log directives that have arguments/placeholders
(((directive
  name: (directive_name) @_dir @name
    [
      (placeholder)
      (argument)
    ] @name)
  )
  (#match? @_dir "^(log|handle_errors)$")
  (#set! role method)
) @subtree