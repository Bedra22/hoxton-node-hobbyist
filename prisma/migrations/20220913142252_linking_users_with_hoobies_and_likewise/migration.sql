/*
  Warnings:

  - You are about to drop the column `usersId` on the `Hoobies` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "_HoobiesToUsers" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_HoobiesToUsers_A_fkey" FOREIGN KEY ("A") REFERENCES "Hoobies" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_HoobiesToUsers_B_fkey" FOREIGN KEY ("B") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Hoobies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "photoURL" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL
);
INSERT INTO "new_Hoobies" ("active", "id", "name", "photoURL") SELECT "active", "id", "name", "photoURL" FROM "Hoobies";
DROP TABLE "Hoobies";
ALTER TABLE "new_Hoobies" RENAME TO "Hoobies";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_HoobiesToUsers_AB_unique" ON "_HoobiesToUsers"("A", "B");

-- CreateIndex
CREATE INDEX "_HoobiesToUsers_B_index" ON "_HoobiesToUsers"("B");
