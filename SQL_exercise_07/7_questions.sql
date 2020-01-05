-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express
-- 7.1 Who receieved a 1.5kg package?
select
  name
from client
join package on client.accountNumber = package.Recipient
where
  weight = 1.5;
-- The result is "Al Gore's Head".
  -- 7.2 What is the total weight of all the packages that he sent?
select
  sum(weight)
from package
where
  sender = (
    select
      accountNumber
    from client
    where
      name = "Al Gore's Head"
  );