define nl /[\r\n]/
define ws /\s+/
define fieldname /[\w ]+/
define value /[^\r\n,]+/
define field_end /[\r\n,] */

grammar user:
    match 'Name:' ws value field_end:
        out.add_attribute('.', 'firstname', '$2')
    match 'Lastname:' ws value field_end:
        out.add_attribute('.', 'lastname', '$2')
    match fieldname ':' ws value field_end:
        out.add('$0', '$3')
    match nl:
        do.return()

# The grammar named "input" is the entry point for the converter.
grammar input:
    match 'User' nl '----' nl:
        out.open('user')
    user()

