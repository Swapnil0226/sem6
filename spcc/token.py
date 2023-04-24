# Swapnil Sawant
# TE4_47_C

import re
file = open("token.txt")
operators = {'=': 'Assignment operator', '+': 'Addition operator', '-': 'Subtraction operator',
             '/': 'Division operator', '*': 'Multiplication operator', '<': 'Less than operator', '>': 'Greater than operator'}
operators_key = operators.keys()
data_type = {'int': 'Integer type', 'float': 'Floating point',
             'char': 'Character type', 'long': 'Long int'}
data_type_key = data_type.keys()
punctuation_symbol = {':': 'Colon',
                      ';': 'Semi-colon', '.': 'Dot', ',': 'Comma'}
punctuation_symbol_key = punctuation_symbol.keys()
identifier = {'a': 'id', 'b': 'id', 'c': 'id', 'd': 'id'}
identifier_key = identifier.keys()

a = file.read()
count = 0
program = a.split("\n")
for line in program:
    count = count + 1
    print("Line #", count, ":", line)
    tokens = line.strip().split(' ')
    if tokens != ['']:
        print("Tokens are ", tokens)
        print("\nLine #", count, "Tokens:")
        for token in tokens:
            if token in operators_key:
                print(token, ": Operator -", operators[token])
            if token in data_type_key:
                print(token, ": Datatype -", data_type[token])
            if token in punctuation_symbol_key:
                print(token, ": Separators -", punctuation_symbol[token])
            if token in identifier_key:
                print(token, ": Identifier -", identifier[token])
    else:
        print("No Tokens\n")
    print("----------------------------------\n")
