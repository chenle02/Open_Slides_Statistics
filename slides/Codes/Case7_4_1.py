# https://stackoverflow.com/questions/28242593/correct-way-to-obtain-confidence-interval-with-scipy
import numpy as np
import scipy.stats as st


# returns confidence interval of mean
def confIntMean(a, conf=0.95):
    mean, sem, m = np.mean(a), st.sem(a), st.t.ppf((1+conf)/2., len(a)-1)
    return mean - m*sem, mean + m*sem


def main():
    alpha = 5
    data = np.array([62, 52, 68, 23, 34, 45, 27, 42, 83, 56, 40])
    lower, upper = confIntMean(data, 1-alpha/100)
    print("""\

    The {alpha}% confidence interval is ({lower:.2f},{upper:.2f})

        """.format(**locals()))


if __name__ == "__main__":
    main()
