def informar_numeros():
    primeiro_numero = float(input("Digite o primeiro número: "))
    segundo_numero = float(input("Digite o segundo número: "))
    return primeiro_numero, segundo_numero

def soma_numeros(a, b):
    return a + b

def main():
    largura = 30
    print("=" * largura)
    print("EXERCÍCIO 7".center(largura))
    print("SOMA DE DOIS NÚMEROS".center(largura))
    print("=" * largura)
    
    n1, n2 = informar_numeros()
    resultado = soma_numeros(n1, n2)
    print("="*largura)
    print()
    print(f"{n1:>15}")
    print(f"+{n2:>14}")
    print("-" * 15)
    print(f"{resultado:>15}")
    print()

if __name__ == "__main__":
    main()


