--Week 2, Week 3, Murach Ch4

SELECT vendor_name, invoice_number, invoice_date, 
    (invoice_total - payment_total - credit_total)
    AS balance_due
FROM vendors v INNER JOIN invoices i
    ON v.vendor_id = i.vendor_id
WHERE (invoice_total - payment_total - credit_total)>0
ORDER BY balance_due ASC


--2.
SELECT vendor_name, invoice_date, invoice_number, invoice_sequence, line_item_amt
    FROM vendors v JOIN invoices i ON (v.vendor_id = i.vendor_id)
    JOIN invoice_line_items il ON (il.invoice_id = i.invoice_id)
ORDER BY vendor_name, invoice_date, invoice_number, invoice_sequence;


--3.
--Print the vendor ids, vendor names, vendor contact first and last names of vendors that 
--   share the same contact last names as another vendor.
--Print the vendor contact's first and last name in this format:
--    Steve Jobs
--Print the heading for the vendor contact's first and last name as Contact Name.

   
     
     
