-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);
-- Example users
insert into "User" ("name") values ('Database user 1');
insert into "User" ("name") values ('Database user 2');
insert into "User" ("name") values ('Database user 3');
insert into "User" ("name") values ('Database user 4');