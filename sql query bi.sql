

/* a.	Display a list of all property names and their property id’s for Owner Id: 1426. */
SELECT Property.Id, Property.Name FROM OwnerProperty
Inner Join Property ON OwnerProperty.PropertyId = Property.Id
WHERE OwnerProperty.OwnerId = 1426;

/* b.	Display the current home value for each property in question a). */
SELECT Property.Id, Property.Name, PropertyHomeValue.Value AS Home_Value FROM OwnerProperty
Inner Join Property ON OwnerProperty.PropertyId = Property.Id
INNER JOIN PropertyHomeValue ON Property.Id = PropertyHomeValue.PropertyId 
WHERE OwnerProperty.OwnerId = 1426;


/* c.	For each property in question a), return the following:                                                                      
i.	Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the 
sum of all payments from start date to end date. */ 

SELECT SUM(Job.PaymentAmount) AS Total_Payments FROM OwnerProperty
Inner Join Property ON OwnerProperty.PropertyId = Property.Id
INNER JOIN Job ON Property.Id = Job.PropertyId
WHERE OwnerProperty.OwnerId = 1426;

/* d.	Display all the jobs available  */ 
SELECT * FROM job;

/* e.Display all property names, current tenants first and last names and rental payments per week/ fortnight/month for 
the properties in question a). */
SELECT Property.Id, Property.Name,Person.FirstName, Person.LastName, Property.TargetRent FROM OwnerProperty
Inner Join Property ON OwnerProperty.PropertyId = Property.Id
INNER JOIN TenantProperty ON Property.Id = TenantProperty.PropertyId
INNER JOIN Person ON TenantProperty.TenantId = Person.Id 
WHERE OwnerProperty.OwnerId = 1426;
