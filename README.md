# Pewlett-Hackard-Analysis

## Overview of Pewlett-Hackard Analysis

As babybooms begin to retire, Pewlett-Hacker is planning for the future of the company. This analysis aims to aid decision makers at Pewlett-Hackard in planning for the large number employees who will be retiring in the near future. This analysis aims to answer the following necessary questions for effective planning:
1.	Who will be retiring in the next few years
2.	How many positions will PH need to fill
3.	Who will be eligible for the retirement package

This analysis showcases the employee database created using SQL  from the excel sheets previously used for record keeping. 

The table “total_emp” shows  240,124 employees currenrly working Pewlett-Hackard. The table “total_retirement” shows that there are 33,118 employees who are eligible to retire and eligible for the retirement package. Eligibility for retirment and retirement package is the employee's birth year (1952-1955) and hire date (1985-1988). That means approximately 13.8% of the currently employees will be aging out of the workforce and there will be 33,118 positions that will need to be filled. 

![Employee_Database_Challenge_Total_Emp](/Resources/Employee_Database_Challenge_Total_Emp.png)

![Employee_Database_Challenge_Total_Retirement](/Resources/Employee_Database_Challenge_Total_Retirement.png)


## Results
Four major tables were created to highlight the specific job titles that will need to be filled in the near future, as well as those current employees eligible to fill those open positions and eligible for mentorship:

-	The “Retirement titles” table is created to showcase the titles of the retiring employees have held throughout their employment at Pewlett-Hacker. This table was further modified into “Unique titles”.

![Employee_Database_Challenge_Retirement_Titles](/Resources/Employee_Database_Challenge_Retirement_Titles.png)

-	The “Unique titles” table shows the current job title for each retiring employee.

![Employee_Database_Challenge_Unique_Titles](/Resources/Employee_Database_Challenge_Unique_Titles.png)

-	“Retiring titles” is a table created to showcase the number of employees soon to retire by title. As the table shows, many “senior” level positions are held by retiring employees. Noteable, in engineering and staff where 29,414 and 28,254 senior positions will need to be fill, respectively. 

![Employee_Database_Challenge_Retiring_Titles](/Resources/Employee_Database_Challenge_Retiring_Titles.png)

-	“Mentorship Eligibility” is a table that features qualified near-retirement employees capable of mentoring the next generation of Pewllet-Hacker Employees. Mentorship eligibility is based on their birth year 1965. These mentorship eligible employees will fill the positions of retiring employs and can mentor the younger employees. 

![Employee_Database_Challenge_Mentorship_Eligibility](/Resources/Employee_Database_Challenge_Mentorship_Eligibility.png)

## Summary

As a significant number of employees begin to retire in the near future, where will be 33,118 roles that will need to be filled. Due to this large turn over in the forseeable future, additional tables have been created to get a deep look into how the “silver tsunami” will effect the company as a whole as well as each department. 

First, the table “mentorship title” table was created to evaluate the number of mentorship eligible employees and their title in comparison to the “Retiring titles” table, which includes the number of retiring employees by their title. As the tables indicate 29,414 Senior Engineers will be retiring in the near future while only 300 Senior Engineers are eligible for the mentorship programs. Similar disparities are seen when comparing each of the titles. Moreover, none of the mentorship eligible employees are currently managers. When comparing these two tables together it is obvious that the company will need more qualified employees to fill these senior level positions and take on a mentorship role. It is advised that the criteria for mentorship eligibility be expanded to include more people than just those born in 1965. 
  
![Employee_Database_Challenge_Retiring_Titles](/Resources/Employee_Database_Challenge_Retiring_Titles.png) ![Employee_Database_Challenge_Mentorship_Title](/Resources/Employee_Database_Challenge_Mentorship_Title.png)

Second, two tables were created to compare the number of employees retiring from each department “retirement_dept” with the number of total employees in each department “total_dept” to get a look at how each department will be impacted by the retirement surge. Overall, each department will lose about 15% of its staff. Specifically, the Customer service department will go from 17,569 employees to 14,972 employees, a decrease of ~14.78%. Development currently has 61,386 employees and will lose 9,281 to retirement, ~ 15.12% decrease. The Finance department currently has 12,437 employees and will lose 1,908, a 15.34% decrease. Human Resources will go from 12,898 employees to 10,945, a decrease of ~15.14%. Marketing will go from 14,842 employees to 12,643 employees, a decrease of 14.82%. Production will go from having 53,304 employees to 45,130, a decrease of 15.33%. Quality Management will go from 14,546 Employees to 12,312 employees, a decrease of 15.37%. Research currently has 15,441 employees and will lose 2,413, a decrease of 15.63%. Finally, Sales currently has 37,701 employees and will lose 5,860, a decrease of 15.54%. Overall, each department at Pewlett-Hacker will be lose about 15% of its department. And thousands of positions will need to be filled. 
  
![Employee_Database_Challenge_retirement_dept](/Resources/Employee_Database_Challenge_retirement_dept.png)  ![Employee_Database_Challenge_Total_Dept](/Resources/Employee_Database_Challenge_Total_Dept.png)

Overall, Pewlett-Hackard will be losing about 14% of its employees in the near future, 33,118 employees will be retiring and will be eligible for the retirment package. 33,118 mostly high-level positions open up across all departments. More planning and analysis needs to be conducted on the current employees eligible to move into these senior level positions once they are open. Each department should evaluate their current employees and job titles in preperation for changing roles. Finally, the mentorship criteria should to be expanded to increase the number of employees eligible to become a mentor. 

