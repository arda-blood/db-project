numbers = [4, 7, 2, 9, 5, 1, 8]
total = 0
result = []

for i in range(len(numbers)):
    if numbers[i] % 2 == 0:
        total = total + numbers[i]
    else:
        result.append(numbers[i])

print(total)
print(result)
# Soru 1.1 - Izleme tablosu
# i | sayi | total | result
# 0 | 4    | 4     | []
# 1 | 7    | 4     | [7]
# 2 | 2    | 6     | [7]
# 3 | 9    | 6     | [7, 9]
# 4 | 5    | 6     | [7, 9, 5]
# 5 | 1    | 6     | [7, 9, 5, 1]
# 6 | 8    | 14    | [7, 9, 5, 1]
# Beklenen cikti: 14 ve [7, 9, 5, 1]
