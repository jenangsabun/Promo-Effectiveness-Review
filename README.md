# Promo-Effectiveness-Review
After 3 weeks of learning about understanding how to solve problems and work on projects according to what a Reporting Engineer does at Jubelio. For the last week at the end of the fourth week, will be given a final project to implement all the knowledge that have learned before. The final project is the last step to complete the Virual Internship Experience (VIX).

# Data Entry and Reporting Engineer Task
Every 6 Months (End of Semester) Omnichannel Jubelio holds Promo Effectiveness Review, to see the effectiveness of the PROMO CODE toward total sales from one of the marketplaces. As a reporting engineer there are several tasks that you need to do.
  1. Apply the Promo Code from the Budgeting Team.
  2. Make a Table for the 3rd and 4th Quarter Special Reports.
  3. Perform Summary and Visualization of the 3rd and 4th Quarter Data Table Results.
  4. Create a Special Shipping Label for December.
 
# Solution
**For tasks 1-3 please do check on the final.sql file for the code and final.xlsx file for the visualization**

Foremost things to do is create a new DB and restore a DB given by company. Then create new table called q3_q4_review. Using the *insert into with select statement* syntax to fill the q3_q4_review table, because there were given criteria that resourced from another table, therefore using *left join* in order to meet the column criterias.

After the q3_q4_review table filled in intended data, export it, then summary and analyzed on monthly total sales activity trend after promo deducted and monthly trend comparison total ratio of using promos and those not using promos.

Using pivot table and pivot chart, these are the visualization for monthly trend comparisan total ration using promos and not using promos.

![image](https://github.com/jenangsabun/Promo-Effectiveness-Review/assets/122729198/bfcd6d84-eedb-4dda-90e0-65ab7398a518)

From the chart above it can be seen most purchased transaction using promo are in August and December, while the lowest transaction using promo are in September and Juli. Look deeper into the chart we can see that on Desember especially after the promo applied, total transaction using promo increasing about 28% compared transaction not using promo. There were also transaction using promo that are lower that transaction not using promo i.e. Oktober and November where the difference is about -0,71% and -0,34% of sales using promo compared to not. 
From the graph it can be concluded that in certain months such as the holiday season or independence day sales using promo campaign increasing. 

Another graph to show monthly total sales trend after promo applied

![image](https://github.com/jenangsabun/Promo-Effectiveness-Review/assets/122729198/58165dc7-f2bd-45bc-9a9f-0b65c63d3449)
