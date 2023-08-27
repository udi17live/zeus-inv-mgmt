-- CreateTable
CREATE TABLE `zeus_user_type` (
    `user_type_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,

    PRIMARY KEY (`user_type_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `zeus_user` (
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `user_type_id` INTEGER NOT NULL,
    `name` VARCHAR(191) NULL,
    `last_login` DATETIME(3) NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `zeus_user_email_key`(`email`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `zeus_user` ADD CONSTRAINT `zeus_user_user_type_id_fkey` FOREIGN KEY (`user_type_id`) REFERENCES `zeus_user_type`(`user_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
