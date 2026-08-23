(comment) @comment

[
  (environment_variable)
  (placeholder)
] @identifier.constant

[
  (network_address)
  (ip_address_or_cidr)
  (path)
  (path_matcher)
] @markup.link

[
  (snippet_name)
  (named_route_identifier)
  (site_address)
] @identifier.type

;; Primary directives
[
  (matcher_directive_name)
] @keyword

; Only the directive name should be a keyword
(directive name:(directive_name) @keyword)

;; Directive arguments
(directive 
  name: (directive_name) @_dir
  (argument) @identifier.argument
  (#not-match? @_dir "^(handle_errors)$")
)
;; Specifically break out error handling to mark its arguments as numbers
;; TODO: Mark things in handle_errors that aren't numbers as errors?
(((directive
  name: (directive_name) @_dir
      (argument)) @value.number
  )
  (#match? @_dir "^(handle_errors)$")
)

; declaration of a named matcher
(named_matcher (matcher_identifier (matcher_name)) @definition.function )

; reference to a named matcher
(matcher 
  (matcher_identifier (matcher_name)) @function.name
)

; directive within a named matcher declaration
(matcher_directive (matcher_directive_name) @function.method)

; any other matcher (wildcard and path)
(matcher) @function.macro

[
  (interpreted_string_literal)
  (raw_string_literal)
  (heredoc)
  (cel_expression)
] @string
(escape_sequence) @escape

[
  (duration_literal)
  (int_literal)
  (status_code_fallback)
] @value.number

[
  "{"
  "}"
] @bracket