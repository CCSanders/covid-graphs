import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

current_date = "2020-04-30"
data_url = "https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-" + current_date + ".xlsx"
data = pd.read_excel(data_url)

fig, ((ax1, ax2, ax3), (ax4, ax5, ax6)) = plt.subplots(2,3)

#total cases for each country
#data[(data['geoId'] == 'US') | (data['geoId'] == 'AU') | (data['geoId'] == 'CA') | (data['geoId'] == 'CN') | (data['geoId'] == 'IT') | (data['geoId'] == 'DE')].groupby('countriesAndTerritories')['cases'].sum().plot(kind='bar', ax=ax1, title='Various Countries Total Cases')

data[data['geoId'] == 'US'].plot(kind='line', x='dateRep', y='cases', ax=ax1, title='New US COVID-19 Cases Over Time, Linear Scale', label='New Cases')
data[data['geoId'] == 'CN'].plot(kind='line', x='dateRep', y='cases', ax=ax2, title='New China COVID-19 Cases Over Time, Linear Scale', label='New Cases')
data[data['geoId'] == 'CA'].plot(kind='line', x='dateRep', y='cases', ax=ax3, title='New Canada COVID-19 Cases Over Time, Linear Scale', label='New Cases')
data[data['geoId'] == 'DE'].plot(kind='line', x='dateRep', y='cases', ax=ax4, title='New Germany COVID-19 Cases Over Time, Linear Scale', label='New Cases')
data[data['geoId'] == 'AU'].plot(kind='line', x='dateRep', y='cases', ax=ax5, title='New Australia COVID-19 Cases Over Time, Linear Scale', label='New Cases')
data[data['geoId'] == 'IT'].plot(kind='line', x='dateRep', y='cases', ax=ax6, title='New Italy COVID-19 Cases Over Time, Linear Scale', label='New Cases')

ax1.set_ylabel("New Cases Reported")
ax2.set_ylabel("New Cases Reported")
ax3.set_ylabel("New Cases Reported")
ax4.set_ylabel("New Cases Reported")
ax5.set_ylabel("New Cases Reported")
ax6.set_ylabel("New Cases Reported")

#get the total number of cumulative cases over time 
data[data['geoId'] == 'US'].groupby('dateRep')['cases'].sum().cumsum().plot(kind='line', x='dateRep', y='cases', ax=ax1, secondary_y=True, label='Total Cases')
data[data['geoId'] == 'CN'].groupby('dateRep')['cases'].sum().cumsum().plot(kind='line', x='dateRep', y='cases', ax=ax2, secondary_y=True, label='Total Cases')
data[data['geoId'] == 'CA'].groupby('dateRep')['cases'].sum().cumsum().plot(kind='line', x='dateRep', y='cases', ax=ax3, secondary_y=True, label='Total Cases')
data[data['geoId'] == 'DE'].groupby('dateRep')['cases'].sum().cumsum().plot(kind='line', x='dateRep', y='cases', ax=ax4, secondary_y=True, label='Total Cases')
data[data['geoId'] == 'AU'].groupby('dateRep')['cases'].sum().cumsum().plot(kind='line', x='dateRep', y='cases', ax=ax5, secondary_y=True, label='Total Cases')
data[data['geoId'] == 'IT'].groupby('dateRep')['cases'].sum().cumsum().plot(kind='line', x='dateRep', y='cases', ax=ax6, secondary_y=True, label='Total Cases')

ax1.right_ax.set_ylabel("Total Cases")
ax2.right_ax.set_ylabel("Total Cases")
ax3.right_ax.set_ylabel("Total Cases")
ax4.right_ax.set_ylabel("Total Cases")
ax5.right_ax.set_ylabel("Total Cases")
ax6.right_ax.set_ylabel("Total Cases")

lines = ax1.get_lines() + ax1.right_ax.get_lines()
ax1.legend(lines, [line.get_label() for line in lines], loc='upper center')
lines = ax2.get_lines() + ax2.right_ax.get_lines()
ax2.legend(lines, [line.get_label() for line in lines], loc='upper center')
lines = ax3.get_lines() + ax3.right_ax.get_lines()
ax3.legend(lines, [line.get_label() for line in lines], loc='upper center')
lines = ax4.get_lines() + ax4.right_ax.get_lines()
ax4.legend(lines, [line.get_label() for line in lines], loc='upper center')
lines = ax5.get_lines() + ax5.right_ax.get_lines()
ax5.legend(lines, [line.get_label() for line in lines], loc='upper center')
lines = ax6.get_lines() + ax6.right_ax.get_lines()
ax6.legend(lines, [line.get_label() for line in lines], loc='upper center')

fig.subplots_adjust(wspace=0.5, hspace=0.5, left=0.05, right=0.95, top=0.90, bottom=0.10)
figManager = plt.get_current_fig_manager()
figManager.window.state('zoomed')
plt.show()