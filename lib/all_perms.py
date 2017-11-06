import numpy as np

def gen(size = 8):
    return np.random.randint(2, size=size)

def rot(a):
    size = a.size
    mat = np.tile(a, (size, 1))
    for i in range(size):
        mat[i] = np.roll(mat[i], i)
    return mat[1:]

def distance(original, matrix):
    bool = np.logical_and(original, matrix) * 1
    return bool.sum(1)

class Perms:
    def __init__(self):
        self.array = gen()
        self.__calc()
    def __calc(self):
        self.rots = rot(self.array)
        self.distance = distance(self.array, self.rots)
        self.index = np.argmax(self.distance)
        self.best = self.rots[self.index]
