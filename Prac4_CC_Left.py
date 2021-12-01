terminals = []

nonterminals = []

productions = []

count = 0

with open('Prac4.txt','r') as f:
    lines = f.readlines()

for i in range(len(lines)):
    lines[i] = lines[i].strip()

for k in lines:
    if count == 0:
        start_symbol = k[0]
    
    for i in k:
        if(i.isupper() and i not in nonterminals):
            nonterminals.append(i)
        elif(not i.isupper() and i not in ['|','-','>','#'] and i not in terminals):
            terminals.append(i)
    
    count += 1
    
    productions.append(k)

print('Terminals :',terminals,sep=' ')
print('Non - Terminals :',nonterminals,sep=' ')
print()

production_dict = {}
for nt in nonterminals:
    production_dict[nt] = []

for production in productions:
    nonterminal_to_production = production.split("->")
    expanded = nonterminal_to_production[1].split("|")

    for ex in expanded:
        production_dict[nonterminal_to_production[0]].append(ex)

print(production_dict)

grammar,visited = {},[]

for k in production_dict.keys():
	while True:
		temp = []

		for v in production_dict[k]:
			if v[0] in visited:
				temp += [x+v[1:] for x in production_dict[v[0]]]
			else: 
				temp.append(v)

		if all([False if x[0] in visited else True for x in temp]):
			production_dict[k] = temp
			break
		production_dict[k] = temp

	present = False
	for v in production_dict[k]:
		if v[0] == k:
			print("Left recursion present in production of {0}".format(k))
			present = True
			break
	
	if present:
		temp, grammar[k+"\'"] = [],[]
		for v in production_dict[k]:
			if v[0]==k:
				grammar[k+"\'"].append(v[1:]+k+"\'") 
			else:
				temp.append(v+k+"\'")
		grammar[k+"\'"].append("#")
		production_dict[k] = temp
	visited.append(k)

print("\nGrammar after elimination of recursion : ")

for k,v in {**production_dict,**grammar}.items():print(k," -> "," | ".join(v))
print()
