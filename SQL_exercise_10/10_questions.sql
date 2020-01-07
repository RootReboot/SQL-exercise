-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person).
-- i.e., the joined table should have the same number of rows as table PEOPLE
select
  people.id,
  people.name,
  temp.address
from people
left join (
    select
      id,
      min(address) as address
    from address
    group by
      id
  ) as temp on people.id = temp.id;
-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person.
  -- i.e., the joined table should have the same number of rows as table PEOPLE
select
  people.id,
  people.name,
  temp.address
from people
left join (
    select
      id,
      max(updateDate) as address
    from address
    group by
      id
  ) as temp on people.id = temp.id;