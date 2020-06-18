import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

current_date = "2020-04-30"
data_url = "https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-" + current_date + ".xlsx"
data = pd.read_excel(data_url)

fig = plt.figure()
ax1 = fig.add_subplot(111)

data[(data['geoId'] == 'US') | (data['geoId'] == 'AU') | (data['geoId'] == 'CA') | (data['geoId'] == 'CN') | (data['geoId'] == 'IT') | (data['geoId'] == 'DE')].groupby('countriesAndTerritories')['cases'].sum().plot(kind='bar', ax=ax1, title='Total COVID-19 Cases Reported', label='Total Number Of Cases')
ax1.set_ylabel("Cases")

fig.subplots_adjust(wspace=0.5, hspace=0.5, left=0.15, right=0.85, top=0.90, bottom=0.25)
figManager = plt.get_current_fig_manager()
figManager.window.state('zoomed')
plt.show()