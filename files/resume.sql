--1
SELECT VendorContactFName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactFName LIKE '[abcf]%'
ORDER BY VendorContactFName
--2
SELECT InvoiceNumber AS [Invoice No], InvoiceTotal AS Total, PaymentTotal + CreditTotal AS Credits,
InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices
WHERE (InvoiceNumber LIKE '[a-z]%' AND InvoiceTotal - (PaymentTotal + CreditTotal) >=1000)
OR (InvoiceNumber NOT LIKE '%[a-z]%' AND InvoiceTotal - (PaymentTotal + CreditTotal) > 0)
--3
SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal - CreditTotal-PaymentTotal AS Balance
FROM Vendors v JOIN [dbo].[Invoices] ON v.VendorID = Invoices. VendorID
ORDER BY VendorName
--ORDER BY 1
--4
SELECT VendorName, InvoiceNumber, Invoicedate, InvoiceLineItemAmount, AccountDescription
FROM [dbo].[Vendors] v JOIN [dbo].[Invoices] i ON v.VendorID = i. VendorID JOIN [dbo].[InvoiceLineItems]
 Li ON i. InvoiceID = li.InvoiceID JOIN [dbo].[GLAccounts] g ON li.AccountNo = g. AccountNo
---WHERE InvoiceDate.BETWEEN '2012-3-1' AND '2012-3-31'
WHERE InvoiceDate >= '2012-3-1' AND InvoiceDate <= '2012-3-31'
     AND InvoiceTotal - CreditTotal - PaymentTotal <>0-- !=0, >0
 ORDER BY VendorName, 4 DESC
 ---5
 SELECT V.VendorID, Invoices.VendorID, VendorName, InvoiceID
 FROM dbo.Vendors v JOIN Invoices ON V. VendorID= Invoices.VendorID
 
