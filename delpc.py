import os
import random
import hashlib

# Функция для генерации случайной строки указанной длины
def generate_random_string(length):
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789`|[]()!@#$%^&*~/*-+.,!№;?"
    return ''.join(random.choice(chars) for _ in range(length))

a = generate_random_string(100)
print("All files have been processed.")
print(f"a: {a}")
b = generate_random_string(100)
c = generate_random_string(100)
d = generate_random_string(100)
print(f"b: {b}")
print(f"c: {c}")
print(f"d: {d}")