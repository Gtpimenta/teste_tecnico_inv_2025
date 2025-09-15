# %%
# Questão 6:

x = [print(i) for i in range(10) if i % 2 == 0]

'''
A compreensão de lista cima itera pelos números de 0 a 9.
Se for par (resto da divisão igual a zero), o número é printado. Caso contrário, nada ocorrerá.
'''
# %%
print(x)
'''
Apesar do código ter como output os números 0, 2, 4, 6 e 8, a função print() não retorna nenhum valor (None).
Portanto, a lista x é preenchida com um "None" para cada iteração: [None, None, None, None, None]
'''
