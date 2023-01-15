# Eg_6-3-1.py
from scipy.stats import binom
n = 19
p = 0.85
rv = binom(n, p)
low = rv.ppf(0.05)
upper = rv.ppf(0.95)
left = round(rv.cdf(low), 6)
right = round(1-rv.cdf(upper), 6)
both = round(rv.cdf(low)+1-rv.cdf(upper), 6)
Results = """\
    The critical regions is less or equal to {low:.0f}, or strictly greater than {upper:.0f}.
    The size of the left tail is {left:.6f} and that of the right tail is {right:.6f}.
    Under this critical region, the level of significance is {both:.6f}
""".format(**locals())
print(Results)
