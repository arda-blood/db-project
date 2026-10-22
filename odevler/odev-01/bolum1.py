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




# Soru 1.2 - En uzun seri
readings = [18, 21, 23, 25, 24, 26, 27, 19, 20, 22, 23, 24, 25, 26]
threshold = 22

# Koddan once tahminim: 5
current_streak = 0
max_streak = 0
for reading in readings:
    if reading >= threshold:
        current_streak += 1
        max_streak = max(max_streak, current_streak)
    else:
        current_streak = 0
print("Soru 1.2 - En uzun seri:", max_streak)