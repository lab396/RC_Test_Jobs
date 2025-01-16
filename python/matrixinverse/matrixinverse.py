
import numpy as np

N = 8
X = np.random.randn(N, N)
print("X =\n", X)
print("Inverse(X) =\n", np.linalg.inv(X))
