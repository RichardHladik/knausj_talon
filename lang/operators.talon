tag: user.code_operators
-
#pointer operators

cop dereference: user.code_operator_indirection()
cop address of: user.code_operator_address_of()
cop arrow: user.code_operator_structure_dereference()

#lambda
cop lambda: user.code_operator_lambda()

#subscript
cop subscript: user.code_operator_subscript()

#assignment
cop (equals | assign): user.code_operator_assignment()

#math operators
cop (minus | subtract): user.code_operator_subtraction()
cop (minus | subtract) equals: user.code_operator_subtraction_assignment()
cop (plus | add): user.code_operator_addition()
cop (plus | add) equals: user.code_operator_addition_assignment()
cop (times | multiply): user.code_operator_multiplication()
cop (times | multiply) equals: user.code_operator_multiplication_assignment()
cop divide: user.code_operator_division()
cop divide equals: user.code_operator_division_assignment()
cop mod: user.code_operator_modulo()
cop mod equals: user.code_operator_modulo_assignment()
(cop (power | exponent) | to the power [of]): user.code_operator_exponent()

#comparison operators
(cop | is) equal: user.code_operator_equal()
(cop | is) not equal: user.code_operator_not_equal()
(cop | is) (greater | more): user.code_operator_greater_than()
(cop | is) (less | below) [than]: user.code_operator_less_than()
(cop | is) greater [than] or equal: user.code_operator_greater_than_or_equal_to()
(cop | is) less [than] or equal: user.code_operator_less_than_or_equal_to()
(cop | is) in: user.code_operator_in()
(cop | is) not in: user.code_operator_not_in()

#logical operators
(cop | logical) and: user.code_operator_and()
(cop | logical) or: user.code_operator_or()

#bitwise operators
[op] bitwise and: user.code_operator_bitwise_and()
[op] bitwise or: user.code_operator_bitwise_or()
(op | logical | bitwise) (ex | exclusive) or: user.code_operator_bitwise_exclusive_or()
(op | logical | bitwise) (left shift | shift left): user.code_operator_bitwise_left_shift()
(op | logical | bitwise) (right shift | shift right): user.code_operator_bitwise_right_shift()
(op | logical | bitwise) (ex | exclusive) or equals: user.code_operator_bitwise_exclusive_or_equals()
[(op | logical | bitwise)] (left shift | shift left) equals: user.code_operator_bitwise_left_shift_equals()
[(op | logical | bitwise)] (left right | shift right) equals: user.code_operator_bitwise_right_shift_equals()

#tbd
(cop | pad) colon: " : "
