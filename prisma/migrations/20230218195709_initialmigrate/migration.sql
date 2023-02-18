/*
  Warnings:

  - The values [IN_PROGRESS] on the enum `TASK_STATUS` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `lastname` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `description` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "TASK_STATUS_new" AS ENUM ('NOT_STARTED', 'STARTED', 'COMPLETED');
ALTER TABLE "Task" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "Task" ALTER COLUMN "status" TYPE "TASK_STATUS_new" USING ("status"::text::"TASK_STATUS_new");
ALTER TYPE "TASK_STATUS" RENAME TO "TASK_STATUS_old";
ALTER TYPE "TASK_STATUS_new" RENAME TO "TASK_STATUS";
DROP TYPE "TASK_STATUS_old";
ALTER TABLE "Task" ALTER COLUMN "status" SET DEFAULT 'NOT_STARTED';
COMMIT;

-- AlterTable
ALTER TABLE "Task" ADD COLUMN     "description" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "lastname",
DROP COLUMN "name",
ADD COLUMN     "firstName" TEXT,
ADD COLUMN     "lastName" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
