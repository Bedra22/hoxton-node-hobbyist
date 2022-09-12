/*
  Warnings:

  - Made the column `usersId` on table `Hoobies` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Hoobies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "photoURL" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL,
    "usersId" INTEGER NOT NULL,
    CONSTRAINT "Hoobies_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Hoobies" ("active", "id", "name", "photoURL", "usersId") SELECT "active", "id", "name", "photoURL", "usersId" FROM "Hoobies";
DROP TABLE "Hoobies";
ALTER TABLE "new_Hoobies" RENAME TO "Hoobies";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
