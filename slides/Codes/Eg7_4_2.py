import numpy as np
import scipy.stats as st

data = np.array([59, 65, 69, 53, 60, 53, 58, 64, 46, 67,  51, 59])
alpha = 5
mean, sem = np.mean(data), st.sem(data)
n = len(data)
s = sem * np.sqrt(n)
cv = st.t.ppf(1-alpha/200., len(data)-1)
tRatio = (mean-62)/sem


print("""\

      n={n}, sample mean={mean:.3f}, s={s:.3f}, t Ratio={tRatio:.2f}, Critical values={cv:.4f}
      """.format(**locals()))
