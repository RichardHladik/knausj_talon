code.language: cplusplus
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
tag(): user.c_basic_datatypes
settings():
    user.code_private_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

action(user.code_operator_indirection): "*"
action(user.code_operator_address_of): "&"
action(user.code_operator_structure_dereference): "->"
#action(user.code_operator_lambda): "=>"
action(user.code_operator_subscript): 		
	insert("[]")
	key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
#action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " && "
action(user.code_operator_or): " || "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= " 
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_exclusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "
action(user.code_self): "this"
action(user.code_null): "nullptr"
action(user.code_is_null): " == nullptr "
action(user.code_is_not_null): " != nullptr"
action(user.code_state_if): 
	insert("if ()")
	key(left)
action(user.code_state_else_if): 
	insert("else if ()")
	key(left)
action(user.code_state_else): 
	insert("else {{\n}}\n")
	key(up )
action(user.code_state_switch):
	insert("switch ()") 
	edit.left()
action(user.code_state_case):
	insert("case \nbreak;") 
	edit.up()
action(user.code_state_for):
	"for ()"
	edit.left()
action(user.code_state_for_each): 
	insert("for (auto  : ) ")
	key(left:5)
action(user.code_state_go_to): "go to "
action(user.code_state_while): 
	insert("while()")
	edit.left()
action(user.code_type_definition): "typedef "	
#action(user.code_typedef_struct):	
#	insert("typedef struct")
#	insert("{{\n\n}}")
#	edit.up()
#	key(tab)
action(user.code_type_class): "class "
action(user.code_import): "using  "
action(user.code_from_import): "using "
action(user.code_include): "#include "
action(user.code_include_system): "#include "
action(user.code_include_local): "#include "
action(user.code_comment): "//"

#todo: figure out how to handle typing beyond "void"
action(user.code_private_function): insert("private void ")
action(user.code_public_static_function): insert("private static void ")
action(user.code_protected_function): insert("protected void ")
action(user.code_public_function): insert("public void ")


	

#directives
direct include:
    insert('#include ""')
    edit.left()
direct define: "#define "
direct undefine: "#undef "
direct if define: "#ifdef "
direct if: "#if "
direct error: "#error "
direct else if: "#elif "
direct end: "#endif "
direct pragma: "#pragma "
state comment: "//"
block comment:
    insert("/*")
    key(enter)
    key(enter)
    insert("*/")
    edit.up()
#control flow
#best used with a push like command
#the below example may not work in editors that automatically add the closing bracket
#if so uncomment the two lines and comment out the rest accordingly
push brackets|group:
	key(end)
    #insert("{")
    #key(enter)
    insert(" {}")
    edit.left()
    key(enter)
    edit.up()
	key(end)
    key(enter)
push semi:
    edit.line_end()
    insert(";")
    key(enter)
#space after parens for placement of brackets
state if: 
    insert("if () ")
    edit.left()
    edit.left()
state else:
    insert("else ")
state elsif:
    insert("else if () ")
    edit.left()
    edit.left()
state switch:
    insert("switch () ")
    edit.left() 
    edit.left() 
state case <number>:
    insert("case {number}:")
    key(enter)
state default:
    insert("default:")
    key(enter)
state break:
    insert("break;")
    key(enter)
state continue:
    insert("continue;")
    key(enter)
state for:
    insert("for () ")
    edit.left()
    edit.left()
state while:
    insert("while () ")
    edit.left()
    edit.left()
state do: "do "
state return: "return "

# Declare variables or structs etc.
# Ex. * int myList 
<user.variable> <phrase>:
    insert("{variable}")
    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))

<user.variable> <user.letter>:
    insert("{variable}{letter}")

# Ex. int * testFunction
fun <user.function> <phrase>:
    insert("{function}")
    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))
    insert("()")
    edit.left()

<user.function>:
    insert("{function}")

# Ex. (int *)
cast to <user.cast>: "{cast}"
<user.c_types>: "{c_types}"
<user.c_pointers>: "{c_pointers}"
<user.c_signed>: "{c_signed}"
#import standard libraries
include <user.library>:
    insert("#include <{library}>")
    key(enter)
void: "void"
int main:
    insert("int main()")
    edit.left()
standard: 'std::'

call method <user.text>:
    key(.)
    insert(user.formatted_text(text, "snake"))
    insert("()")
    key(left)

call [function] <user.text>:
    insert(user.formatted_text(text, "snake"))
    insert("()")
    key(left)

unique pointer:
	"std::unique_ptr<>"
	key(left)

see out: "std::cout << "
end ell: "std::endl"
