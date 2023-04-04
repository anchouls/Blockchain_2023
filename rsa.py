import random
from math import gcd
from hashlib import sha256
import sympy


class RSA:

    def __init__(self):
        self.e, self.d, self.n = 0, 0, 0
        self.hash_fun = sha256()

    def key_gen(self, bits=15):
        primes = list(sympy.primerange(2 ** (bits - 1) + 1, 2 ** bits))
        p, q = random.sample(primes, 2)
        self.n = p * q
        phi_n = (p - 1) * (q - 1)

        for i in primes:
            if i != p and i != q and gcd(i, phi_n) == 1:
                self.e = i
                break

        self.d = self.e + 1
        while (self.e * self.d) % phi_n != 1:
            self.d += 1

    def encrypt(self, message):
        self.hash_fun.update(message.encode())
        hash_message = int.from_bytes(self.hash_fun.digest(), byteorder='big') % self.n
        return pow(hash_message, self.e, self.n)

    def decrypt(self, ciphertext):
        return pow(ciphertext, self.d, self.n)
