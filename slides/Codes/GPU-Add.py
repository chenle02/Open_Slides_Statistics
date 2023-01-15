# Inspired by the following youtube video
# Adapted to Python3 and numba instead of numbapro.
# https://www.youtube.com/watch?v=dPQnFXD7DxM&t=10s
import numpy as np
from timeit import default_timer as timer
from numba import vectorize, float32


@vectorize([float32(float32, float32)])
def VectorAddGPU(a, b):
    return a + b


def VectorAdd(a, b, c):
    for i in range(a.size):
        c[i] = a[i] + b[i]


def main():
    N = 320000000

    A = np.ones(N, dtype=np.float32)
    B = np.ones(N, dtype=np.float32)
    C = np.zeros(N, dtype=np.float32)

    start = timer()
    VectorAdd(A, B, C)
    vectadd_time = timer() - start

    print("C[:5] = " + str(C[:5]))
    print("C[-5:] = " + str(C[-5:]))

    print("VectorAdd took %f seconds" % vectadd_time)

    start = timer()
    C = VectorAddGPU(A, B)
    vectadd_time = timer() - start

    print("C[:5] = " + str(C[:5]))
    print("C[-5:] = " + str(C[-5:]))

    print("VectorAddGPU took %f seconds" % vectadd_time)


if __name__ == '__main__':
    main()
