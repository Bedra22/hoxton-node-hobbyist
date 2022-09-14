/*
  Warnings:

  - You are about to drop the `Hoobiessss` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_HoobiessssToUsers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Hoobiessss";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_HoobiessssToUsers";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Hoobies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "photoURL" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "_HoobiesToUsers" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_HoobiesToUsers_A_fkey" FOREIGN KEY ("A") REFERENCES "Hoobies" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_HoobiesToUsers_B_fkey" FOREIGN KEY ("B") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_HoobiesToUsers_AB_unique" ON "_HoobiesToUsers"("A", "B");

-- CreateIndex
CREATE INDEX "_HoobiesToUsers_B_index" ON "_HoobiesToUsers"("B");
