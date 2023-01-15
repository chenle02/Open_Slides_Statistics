from scipy.stats import binom
import matplotlib.pyplot as plt
plt.style.use('dark_background')
fig, ax = plt.subplots(1, 1)
n, p = 100, .5
x = range(100)
# Now plot the first figure
ax.plot(x, binom.pmf(x, n, p), 'w_')
ax.vlines(x, 0, binom.pmf(x, n, p), colors='w', lw=2, alpha=0.5)
ax.legend(loc='best', frameon=False)
ax.set_xlabel('Number of Correct Guesses')
ax.set_ylabel('Probability')
plt.savefig("Binomial_Jory.png", bbox_inches='tight')
plt.close()
# plt.show()
# Now plot the second figure
# Now plot the red part.


def Guess(guess, n, p):
    fig, ax = plt.subplots(1, 1)
    # Plot the left tail
    x = range(guess)
    TailProb = round(1-binom.cdf(guess-1, n, p), 4)
    ax.plot(x, binom.pmf(x, n, p), 'w_')
    ax.vlines(x, 0, binom.pmf(x, n, p), colors='w', lw=2, alpha=0.5)
    # Plot the right tail
    x = range(guess, 100)
    ax.plot(x, binom.pmf(x, n, p), 'r_')
    ax.vlines(x, 0, binom.pmf(x, n, p), colors='r', lw=2, alpha=0.5)
    # Plot the legend
    ax.legend(loc='best', frameon=False)
    ax.set_xlabel('No. of Correct Guesses >= ' + str(guess))
    ax.set_ylabel('Probability')
    ax.set_title(str(TailProb), color='r')
    # plt.show()
    # Save the image file
    plt.savefig("Binomial_Jory_"+str(guess)+".png", bbox_inches='tight')
    plt.close()
    # The tail probability is


Guess(60, n, p)
Guess(54, n, p)


binom.ppf(0.05, n, p)
binom.ppf(0.95, n, p)


round(1-binom.cdf(binom.ppf(0.95, n, p), n, p), 4)
