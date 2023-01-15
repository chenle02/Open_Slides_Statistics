from scipy.stats import norm, binom
round(1-norm.cdf(0.8), 4)
round(1-norm.cdf(2), 4)

round(1 - binom.cdf(3, 7, 0.271), 3)

from scipy import stats
stats.zscore(0.05)


from scipy import stats

scipy.stats.norm.sf(1.64)
scipy.stats.norm.cdf(1.64)
scipy.stats.norm.ppf(1-0.05)

scipy.stats.chi2.cdf(1.145,5)

scipy.stats.chi2.cdf(15.086,5)

scipy.stats.chi2.ppf(0.05,5)

scipy.stats.chi2.ppf(0.99,5)

scipy.stats.f.cdf(5.41, 3, 5)

scipy.stats.f.ppf(0.95, 3, 5)

1 - scipy.stats.t.cdf(4.541, 3)

scipy.stats.t.ppf(1-0.01, 3)


from Case7_4_1 import confIntMean

alpha = 5
data = np.array([59, 65, 69, 53, 60, 53, 58, 64, 46, 67, 51, 59])
lower, upper = confIntMean(data, 1-alpha/100)
print("""\

The {alpha}% confidence interval is ({lower:.2f},{upper:.2f})

    """.format(**locals()))

