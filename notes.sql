-- NOTES
-- CANVAS
SELECT columns
FROM table1
[JOIN TYPE] JOIN table2 ON table1.column_name = table2.column_name;
-- CANVAS

-- MULTIPLE JOINT
SELECT 
    table1.column1, 
    table2.column2, 
    table3.column3
FROM 
    table1
JOIN 
    table2 ON table1.common_column = table2.common_column
JOIN 
    table3 ON table2.another_common_column = table3.another_common_column
WHERE 
    table1.some_column = 'Some value';
-- MULTIPLE JOINT

