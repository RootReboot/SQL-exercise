-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names,
-- and the hours worked by that scientist on each project,
-- in alphabetical order of project name, then scientist name.
select
  s.name,
  p.name,
  p.hours
from scientists s
join assignedTo a on s.ssn = a.scientist
join projects p on a.project = p.code
order by
  p.name,
  s.name;
-- 6.2 Select the project names which are not assigned yet
  -- SQLIte doesn't support outer join. Select name from projects outer join assignedTo on projects.code = assignedTo.project;
select
  name
from projects
where
  code not in (
    select
      project
    from assignedTo
  );