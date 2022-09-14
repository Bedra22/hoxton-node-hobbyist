-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Hoobies" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "photoURL" TEXT,
    "active" BOOLEAN
);
INSERT INTO "new_Hoobies" ("active", "id", "name", "photoURL") SELECT "active", "id", "name", "photoURL" FROM "Hoobies";
DROP TABLE "Hoobies";
ALTER TABLE "new_Hoobies" RENAME TO "Hoobies";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
