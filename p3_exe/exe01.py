resultado = 0b00001001010100100100010100010001
cartao =    0b00001011010100100110010100010101
acertos = resultado & cartao

total = 0

while acertos > 0:
    if acertos & 0b111 > 0:
        total += 1
    
    acertos = acertos >> 3

print(total)

