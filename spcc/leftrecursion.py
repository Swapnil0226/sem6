# Swapnil Sawant
# TE4_C_47

def removeLeftReccursion(generator, productions):
    leftReccursiveProds = []
    nonReccursiveProds = []
    for production in productions:
        if(production[0] == generator):
            leftReccursiveProds.append(production)
        else:
            nonReccursiveProds.append(production)

    if(len(leftReccursiveProds) == 0):
        prod = f'{generator}=>'
        for p in production:
            prod += p + '|'
        prod = prod[:-1]
        prod += '\n'
        print(prod)
        return

    prod = f'{generator}->'
    for p in nonReccursiveProds:
        prod += f"{p}{generator}'|"
    prod = prod[:-1]
    prod += '\n'
    print(prod)

    for p in leftReccursiveProds:
        prod = f"{generator}'->"
        prod += f"{p[1:]}{generator}'|"
        prod += '\u03f5'
        prod += '\n'
        print(prod)


def main():
    generators = []
    productions = []

    with open('left.txt', 'r') as inp:
        inputs = inp.readlines()
        for line in inputs:
            if(line.__contains__('\n')):
                line = line[:-1:]
            generators.append(line.split('->')[0])
            allProds = line.split('->')[1].split('|')
            productions.append(allProds)
    for (generator, productions) in zip(generators, productions):
        removeLeftReccursion(generator, productions)


if __name__ == '__main__':
    print("\n")
    main()
