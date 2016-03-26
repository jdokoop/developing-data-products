Predicting the Growth of Internet Access Worlwide Between 2017-2030
========================================================
author: Developing Data Products
date: March 2015

Motivation
========================================================

In a globalized world, Internet access constitutes a fundamental factor in ensuring a population's access to education, information, opportunity, and participation in society. Yet, as of 2014, only 40% of the world's population had access to the Internet, mostly in developed countries. 

Therefore, a clear visualization of the number of Internet users ny country and its expected growth provides a valuable metric of socio-economic development, as well as an important resource to inform public policy.

Description The Application
========================================================
This application strives to provide a user-friendly way to estimate and visualize the percentage of the population in any given country with access to the Internet in the period comprised between 2017 and 2030. Results can be visualized at the global or regional level. The application is constructed on World Bank data on the number of Internet users per country. This dataset, as well as many others, is publicly available at http://databank.worldbank.org/ 


Logic Behing the Application
========================================================
Calculations are performed with regression models on World Bank data on the number of Internet users between 2000-2012. For instance, the plot below shows the raw data for Antigua and Barbuda. The models are then extrapolated for the future years of interest. 
![plot of chunk unnamed-chunk-1](Pitch-figure/unnamed-chunk-1-1.png)

User Interface
========================================================
![Screenshot](Screenshot.pdf)

