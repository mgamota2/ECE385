import matplotlib.pyplot as plt; plt.rcdefaults()
import numpy as np
import matplotlib.pyplot as plt

# data to plot
n_groups = 3
ripple = (1, 1, 1)
carry = (91/79, 67.93/67.7, 105.44/105.29)
select = (84/79, 68.65/67.7, 105.15/105.29)


# create plot
fig, ax = plt.subplots()
index = np.arange(n_groups)
bar_width = 0.6
opacity = 0.8

rects1 = plt.bar(index, ripple, bar_width/2,
alpha=opacity,
color='b',
label='Ripple')

rects2 = plt.bar(index + bar_width/2, carry, bar_width/2,
alpha=opacity,
color='g',
label='Carry')

rects3 = plt.bar(index + bar_width, select, bar_width/2,
alpha=opacity,
color='y',
label='Select')


plt.title('Adder Performance')
plt.xticks(index + bar_width/2, ('Memory', 'Frequency', 'Power'))
plt.legend(loc='lower right')

plt.show()