/*
  Warnings:

  - You are about to drop the `Hoobies` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_HoobiesToUsers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Hoobies";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_HoobiesToUsers";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Hoobiessss" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "photoURL" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "_HoobiessssToUsers" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_HoobiessssToUsers_A_fkey" FOREIGN KEY ("A") REFERENCES "Hoobiessss" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_HoobiessssToUsers_B_fkey" FOREIGN KEY ("B") REFERENCES "Users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_HoobiessssToUsers_AB_unique" ON "_HoobiessssToUsers"("A", "B");

-- CreateIndex
CREATE INDEX "_HoobiessssToUsers_B_index" ON "_HoobiessssToUsers"("B");
