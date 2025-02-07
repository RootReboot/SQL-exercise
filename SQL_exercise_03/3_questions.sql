-- The Warehouse
-- lINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_warehouse
--3.1 Select all warehouses.
select
  *
from warehouses;
--3.2 Select all boxes with a value larger than $150.
select
  *
from boxes
where
  value > 150;
--3.3 Select all distinct contents in all the boxes.
select
  distinct *
from boxes;
--3.4 Select the average value of all the boxes.
select
  avg(value)
from boxes;
--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select
  warehouse,
  avg(value)
from boxes
group by
  warehouse;
--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select
  warehouse,
  avg(value)
from boxes
group by
  warehouse
having
  avg(value) > 150;
--3.7 Select the code of each box, along with the name of the city the box is located in.
select
  a.code,
  b.location
from boxes a
join warehouses b on a.Warehouse = b.code;
--3.8 Select the warehouse codes, along with the number of boxes in each warehouse.
select
  warehouse,
  count(*)
from boxes
group by
  warehouse;
--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT
  Code
FROM Warehouses
WHERE
  Capacity < (
    SELECT
      COUNT(*)
    FROM Boxes
    WHERE
      Warehouse = Warehouses.Code
  );
--3.10 Select the codes of all the boxes located in Chicago.
select
  a.code
from boxes a
join Warehouses b on a.Warehouse = b.Code
where
  b.location = 'Chicago';
--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
insert into Warehouses
values(10, 'New York', 3);
--3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
insert into Boxes
values('H5RT', 'Papers', 200, 2);
--3.13 Reduce the value of all boxes by 15%.
update boxes
set
  value = value * 0.85;
--3.14 Remove all boxes with a value lower than $100.
delete from boxes
where
  value < 100;
-- 3.15 Remove all boxes from saturated warehouses.
delete from boxes
where
  warehouse in (
    select
      code
    from Warehouses
    where
      capacity <(
        select
          count(*)
        from boxes
        where
          warehouse = warehouses.code
      )
  );
-- 3.16 Add Index for column "Warehouse" in table "boxes"
  -- !!!NOTE!!!: index should NOT be used on small tables in practice
  CREATE INDEX INDEX_WAREHOUSE ON Boxes (warehouse);
-- 3.17 Print all the existing indexes
  -- !!!NOTE!!!: index should NOT be used on small tables in practice
SELECT
  *
FROM SQLITE_MASTER
WHERE
  type = "index";
-- 3.18 Remove (drop) the index you added just
  -- !!!NOTE!!!: index should NOT be used on small tables in practice
  DROP INDEX INDEX_WAREHOUSE;