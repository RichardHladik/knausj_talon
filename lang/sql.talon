# TODO - have datagrip app assert user.sql tag
#app: datagrip
mode: user.sql
mode: command
and code.language: sql


-
select: "SELECT "
star: "*"
from: "FROM "
select star from: "SELECT * FROM "
where: "WHERE "
order by: "ORDER BY "
descending: " DESC"
ascending: " ASC"
dot i d: ".id"
is not null: " IS NOT NULL"
is null: " IS NULL"
inner join:
    insert("INNER JOIN  ON ")
    key(left)
    key(left)
    key(left)
    key(left)
