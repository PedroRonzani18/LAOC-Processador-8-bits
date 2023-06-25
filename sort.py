import random

nomes = ["Pedro", "Joao", "Marcelo", "Felipe"]
cordoes = [1, 2, 3, 4]

nomes_escolhidos = []
cordoes_escolhidos = []

escolhiddos = {}

while(len(nomes_escolhidos) < 4):
        
    pessoa = nomes[random.randint(0, 3)]
    cordao = cordoes[random.randint(0, 3)]

    if((pessoa not in nomes_escolhidos) and (cordao not in cordoes_escolhidos)):
        escolhiddos[pessoa] = cordao
        
        nomes_escolhidos.append(pessoa)
        cordoes_escolhidos.append(cordao)
    
print(escolhiddos)