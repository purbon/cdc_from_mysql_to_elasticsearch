CREATE database foo;

CREATE TABLE `foo`.`new_table` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


INSERT INTO `foo`.`new_table` (`id`, `name`) VALUES ('1', 'foo');
INSERT INTO `foo`.`new_table` (`id`, `name`) VALUES ('2', 'foo2');

UPDATE foo.new_table
SET name = 'updated'
WHERE id = 2;

DELETE 
FROM foo.new_table
where id = 1;

alter table foo.new_table add column city varchar(100) after name;

DROP TABLE foo.new_table;
