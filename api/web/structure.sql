/*
 Navicat Premium Data Transfer

 Source Server         : digital 62128 new 22357657
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : digital_mk1

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 28/02/2024 08:57:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academic_degree
-- ----------------------------
DROP TABLE IF EXISTS `academic_degree`;
CREATE TABLE `academic_degree`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ua_action_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `ua_action_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for action_log
-- ----------------------------
DROP TABLE IF EXISTS `action_log`;
CREATE TABLE `action_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `user_id` int(0) NULL DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `errors` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `get_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `post_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip_address` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `host` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip_address_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analytics_sessions
-- ----------------------------
DROP TABLE IF EXISTS `analytics_sessions`;
CREATE TABLE `analytics_sessions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analytics_users
-- ----------------------------
DROP TABLE IF EXISTS `analytics_users`;
CREATE TABLE `analytics_users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uagent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ua_device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ua_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ua_browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for analytics_views
-- ----------------------------
DROP TABLE IF EXISTS `analytics_views`;
CREATE TABLE `analytics_views`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `referrer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_code` int(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `region_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 0,
  `postcode` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `long` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx-area-region_id`(`region_id`) USING BTREE,
  CONSTRAINT `fk-area-region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 784 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attend
-- ----------------------------
DROP TABLE IF EXISTS `attend`;
CREATE TABLE `attend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `check` int(0) NULL DEFAULT 0,
  `time_table_id` int(0) NOT NULL,
  `date` date NOT NULL,
  `student_ids` json NULL,
  `subject_id` int(0) NOT NULL,
  `subject_category_id` int(0) NOT NULL,
  `time_option_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `edu_semestr_id` int(0) NOT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1 kuz 2 bohor',
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `amk_attend_time_table`(`time_table_id`) USING BTREE,
  INDEX `amk_attend_subject`(`subject_id`) USING BTREE,
  INDEX `amk_attend_subject_category`(`subject_category_id`) USING BTREE,
  INDEX `amk_attend_time_option`(`time_option_id`) USING BTREE,
  INDEX `amk_attend_edu_year`(`edu_year_id`) USING BTREE,
  INDEX `amk_attend_edu_semestr`(`edu_semestr_id`) USING BTREE,
  INDEX `amk_attend_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `amk_attend_edu_plan_id`(`edu_plan_id`) USING BTREE,
  CONSTRAINT `amk_attend_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amk_attend_edu_semestr` FOREIGN KEY (`edu_semestr_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amk_attend_edu_year` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amk_attend_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amk_attend_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amk_attend_subject_category` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amk_attend_time_option` FOREIGN KEY (`time_option_id`) REFERENCES `time_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amk_attend_time_table` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109494 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attend_access
-- ----------------------------
DROP TABLE IF EXISTS `attend_access`;
CREATE TABLE `attend_access`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `time_table_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NOT NULL,
  `subject_category_id` int(0) NOT NULL,
  `time_option_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `edu_semestr_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1 kuz 2 bohor',
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mk_a_a_attend_access_time_table_id`(`time_table_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_subject_id`(`subject_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_user_id`(`user_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_subject_category_id`(`subject_category_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_time_option_id`(`time_option_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `mk_a_a_attend_access_edu_semestr_id`(`edu_semestr_id`) USING BTREE,
  CONSTRAINT `mk_a_a_attend_access_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_edu_semestr_id` FOREIGN KEY (`edu_semestr_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_subject_category_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_time_option_id` FOREIGN KEY (`time_option_id`) REFERENCES `time_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_time_table_id` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attend_access_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attend_reason
-- ----------------------------
DROP TABLE IF EXISTS `attend_reason`;
CREATE TABLE `attend_reason`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `is_confirmed` tinyint(1) NULL DEFAULT 0,
  `start` datetime(0) NOT NULL,
  `end` datetime(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ars_mk_attend_reason_student_id`(`student_id`) USING BTREE,
  INDEX `ars_mk_attend_reason_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `ars_mk_attend_reason_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `ars_mk_attend_reason_subject`(`subject_id`) USING BTREE,
  CONSTRAINT `ars_mk_attend_reason_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ars_mk_attend_reason_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ars_mk_attend_reason_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ars_mk_attend_reason_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13277 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attent_access
-- ----------------------------
DROP TABLE IF EXISTS `attent_access`;
CREATE TABLE `attent_access`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `time_table_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NOT NULL,
  `subject_category_id` int(0) NOT NULL,
  `time_option_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `edu_semestr_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1 kuz 2 bohor',
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mk_a_a_attent_access_time_table_id`(`time_table_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_subject_id`(`subject_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_user_id`(`user_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_subject_category_id`(`subject_category_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_time_option_id`(`time_option_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `mk_a_a_attent_access_edu_semestr_id`(`edu_semestr_id`) USING BTREE,
  CONSTRAINT `mk_a_a_attent_access_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_edu_semestr_id` FOREIGN KEY (`edu_semestr_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_subject_category_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_time_option_id` FOREIGN KEY (`time_option_id`) REFERENCES `time_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_time_table_id` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_a_a_attent_access_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(0) NOT NULL,
  `created_at` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `idx-auth_assignment-user_id`(`user_id`) USING BTREE,
  INDEX `mk-auth_assiginment-item_name`(`item_name`) USING BTREE COMMENT 'index item_name',
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_child`;
CREATE TABLE `auth_child`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `child` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'rolni chiroyli nomi',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 177 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` smallint(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data` blob NULL,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data` blob NULL,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` int(0) NULL DEFAULT 1 COMMENT 'type education building or hostel or something',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cantract
-- ----------------------------
DROP TABLE IF EXISTS `cantract`;
CREATE TABLE `cantract`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_year_id` int(0) NOT NULL,
  `edu_type_id` int(0) NOT NULL,
  `edu_form_id` int(0) NOT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_cey_comtract_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `index_cet_comtract_edu_type_id`(`edu_type_id`) USING BTREE,
  INDEX `index_cef_comtract_edu_form_id`(`edu_form_id`) USING BTREE,
  CONSTRAINT `cef_comtract_edu_form_id` FOREIGN KEY (`edu_form_id`) REFERENCES `edu_form` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cet_comtract_edu_type_id` FOREIGN KEY (`edu_type_id`) REFERENCES `edu_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cey_comtract_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category_of_cohabitant
-- ----------------------------
DROP TABLE IF EXISTS `category_of_cohabitant`;
CREATE TABLE `category_of_cohabitant`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for citizenship
-- ----------------------------
DROP TABLE IF EXISTS `citizenship`;
CREATE TABLE `citizenship`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for club
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `club_category_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ccc_club_club_category_id`(`club_category_id`) USING BTREE,
  CONSTRAINT `ccc_club_club_category_id` FOREIGN KEY (`club_category_id`) REFERENCES `club_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for club_category
-- ----------------------------
DROP TABLE IF EXISTS `club_category`;
CREATE TABLE `club_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for club_time
-- ----------------------------
DROP TABLE IF EXISTS `club_time`;
CREATE TABLE `club_time`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `club_category_id` int(0) NULL DEFAULT NULL,
  `club_id` int(0) NOT NULL,
  `room_id` int(0) NULL DEFAULT NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  `times` json NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `duration` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ctcc_club_time_club_category_id`(`club_category_id`) USING BTREE,
  INDEX `ctc_club_time_club_id`(`club_id`) USING BTREE,
  CONSTRAINT `ctc_club_time_club_id` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ctcc_club_time_club_category_id` FOREIGN KEY (`club_category_id`) REFERENCES `club_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ball` double NOT NULL,
  `user_id` int(0) NOT NULL,
  `teacher_access_id` int(0) NOT NULL,
  `subject_topic_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `content_user_id`(`user_id`) USING BTREE,
  INDEX `content_teacher_access_id`(`teacher_access_id`) USING BTREE,
  INDEX `content_subject_topic_id`(`subject_topic_id`) USING BTREE,
  CONSTRAINT `content_subject_topic_id` FOREIGN KEY (`subject_topic_id`) REFERENCES `subject_topic` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `content_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `content_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract_info
-- ----------------------------
DROP TABLE IF EXISTS `contract_info`;
CREATE TABLE `contract_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NULL DEFAULT NULL,
  `uzasbo_id` int(0) NULL DEFAULT NULL,
  `passport_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contract_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `scholarship_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contract_price` double NULL DEFAULT NULL,
  `contract_price_half` double NULL DEFAULT NULL,
  `reception_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_enter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_no_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_fire` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_edu_holiday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_change_edu_form` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `debt_begin` double NULL DEFAULT 0,
  `overpayment` double NULL DEFAULT 0,
  `must_pay_this_year` double NULL DEFAULT 0,
  `paid_this_year` double NULL DEFAULT 0,
  `payment_percent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mk_contract_info_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `mk_contract_info_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for counting
-- ----------------------------
DROP TABLE IF EXISTS `counting`;
CREATE TABLE `counting`  (
  `count_id` int(0) NOT NULL AUTO_INCREMENT,
  `item_id` int(0) NULL DEFAULT 0,
  `item_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_count` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`count_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISO` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ISO3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `num_code` int(0) NULL DEFAULT NULL,
  `phone_code` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 240 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for currency_list
-- ----------------------------
DROP TABLE IF EXISTS `currency_list`;
CREATE TABLE `currency_list`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for currency_rates
-- ----------------------------
DROP TABLE IF EXISTS `currency_rates`;
CREATE TABLE `currency_rates`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cfrom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cvalue` float NULL DEFAULT NULL,
  `cvbefore` float NULL DEFAULT NULL,
  `update_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for degree
-- ----------------------------
DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for degree_info
-- ----------------------------
DROP TABLE IF EXISTS `degree_info`;
CREATE TABLE `degree_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `user_id` int(0) NULL DEFAULT NULL COMMENT 'Lead of department',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fu_department_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fu_department_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department_info
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `department_id` int(0) NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for diploma_type
-- ----------------------------
DROP TABLE IF EXISTS `diploma_type`;
CREATE TABLE `diploma_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for direction
-- ----------------------------
DROP TABLE IF EXISTS `direction`;
CREATE TABLE `direction`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '5240100' COMMENT 'yonalish kodi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fd_direction_faculty_id`(`faculty_id`) USING BTREE,
  CONSTRAINT `fd_direction_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_form
-- ----------------------------
DROP TABLE IF EXISTS `edu_form`;
CREATE TABLE `edu_form`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_plan
-- ----------------------------
DROP TABLE IF EXISTS `edu_plan`;
CREATE TABLE `edu_plan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `spring_end` date NULL DEFAULT NULL,
  `spring_start` date NULL DEFAULT NULL,
  `fall_end` date NULL DEFAULT NULL,
  `fall_start` date NULL DEFAULT NULL,
  `course` int(0) NOT NULL,
  `semestr` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `faculty_id` int(0) NOT NULL,
  `direction_id` int(0) NOT NULL,
  `edu_type_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `edu_form_id` int(0) NULL DEFAULT NULL COMMENT 'ta-lim shakli',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ep_edu_plan_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `fp_edu_plan_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `dp_edu_plan_direction_id`(`direction_id`) USING BTREE,
  INDEX `tp_edu_plan_edu_type_id`(`edu_type_id`) USING BTREE,
  CONSTRAINT `dp_edu_plan_direction_id` FOREIGN KEY (`direction_id`) REFERENCES `direction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ep_edu_plan_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fp_edu_plan_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tp_edu_plan_edu_type_id` FOREIGN KEY (`edu_type_id`) REFERENCES `edu_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_semestr
-- ----------------------------
DROP TABLE IF EXISTS `edu_semestr`;
CREATE TABLE `edu_semestr`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `credit` double NULL DEFAULT 0,
  `edu_plan_id` int(0) NOT NULL,
  `course_id` int(0) NOT NULL,
  `semestr_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `is_checked` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `optional_subject_count` int(0) NOT NULL DEFAULT 0,
  `required_subject_count` int(0) NOT NULL DEFAULT 0,
  `type` int(0) NULL DEFAULT 1 COMMENT 'type 1 - random teshiradi 2 - teacher o`zi tekshiradi id ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pe_edu_semestr_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `ce_edu_semestr_course_id`(`course_id`) USING BTREE,
  INDEX `se_edu_semestr_semestr_id`(`semestr_id`) USING BTREE,
  INDEX `se_edu_semestr_edu_year_id`(`edu_year_id`) USING BTREE,
  CONSTRAINT `ce_edu_semestr_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pe_edu_semestr_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `se_edu_semestr_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `se_edu_semestr_semestr_id` FOREIGN KEY (`semestr_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 993 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_semestr_exams_type
-- ----------------------------
DROP TABLE IF EXISTS `edu_semestr_exams_type`;
CREATE TABLE `edu_semestr_exams_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `exams_type_id` int(0) NOT NULL,
  `max_ball` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `se_edu_semestr_exams_type_edu_subject_id`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `xe_edu_semestr_exams_type_exams_id`(`exams_type_id`) USING BTREE,
  CONSTRAINT `se_edu_semestr_exams_type_edu_subject_id` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xe_edu_semestr_exams_type_exams_id` FOREIGN KEY (`exams_type_id`) REFERENCES `exams_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3383 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_semestr_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_semestr_subject`;
CREATE TABLE `edu_semestr_subject`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_semestr_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `subject_type_id` int(0) NULL DEFAULT NULL,
  `credit` double NULL DEFAULT 0,
  `auditory_time` double NULL DEFAULT NULL,
  `all_ball_yuklama` int(0) NULL DEFAULT 0,
  `is_checked` int(0) NULL DEFAULT 0,
  `max_ball` int(0) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `faculty_id` int(0) NULL DEFAULT NULL COMMENT 'faculty',
  `direction_id` int(0) NULL DEFAULT NULL COMMENT 'direction',
  `index` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `je_edu_semestr_subject_edu_semestr_id`(`edu_semestr_id`) USING BTREE,
  INDEX `se_edu_semestr_subject_subject_id`(`subject_id`) USING BTREE,
  INDEX `te_edu_semestr_subject_subject_type_id`(`subject_type_id`) USING BTREE,
  INDEX `edu_semestr_subject_faculty_id_bm`(`faculty_id`) USING BTREE,
  CONSTRAINT `edu_semestr_subject_faculty_id_bm` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `je_edu_semestr_subject_edu_semestr_id` FOREIGN KEY (`edu_semestr_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `se_edu_semestr_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `te_edu_semestr_subject_subject_type_id` FOREIGN KEY (`subject_type_id`) REFERENCES `subject_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2435 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_semestr_subject_category_time
-- ----------------------------
DROP TABLE IF EXISTS `edu_semestr_subject_category_time`;
CREATE TABLE `edu_semestr_subject_category_time`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `subject_category_id` int(0) NOT NULL,
  `hours` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `se_edu_semestr_subject_category_time_edu_semestr_edu_s_s_id`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `se_edu_semestr_subject_category_time_edu_semestr_s_c_id`(`subject_category_id`) USING BTREE,
  CONSTRAINT `se_edu_semestr_subject_category_time_edu_semestr_edu_s_s_id` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `se_edu_semestr_subject_category_time_edu_semestr_s_c_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6039 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_type
-- ----------------------------
DROP TABLE IF EXISTS `edu_type`;
CREATE TABLE `edu_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_year
-- ----------------------------
DROP TABLE IF EXISTS `edu_year`;
CREATE TABLE `edu_year`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `year` year NOT NULL,
  `type` tinyint(0) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for election
-- ----------------------------
DROP TABLE IF EXISTS `election`;
CREATE TABLE `election`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'password',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `start` int(0) NULL DEFAULT NULL,
  `finish` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for election_candidate
-- ----------------------------
DROP TABLE IF EXISTS `election_candidate`;
CREATE TABLE `election_candidate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `election_id` int(0) NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `short_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `full_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ece_election_candidate_election_mk`(`election_id`) USING BTREE,
  CONSTRAINT `ece_election_candidate_election_mk` FOREIGN KEY (`election_id`) REFERENCES `election` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for election_candidate_info
-- ----------------------------
DROP TABLE IF EXISTS `election_candidate_info`;
CREATE TABLE `election_candidate_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `election_candidate_id` int(0) NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `short_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `full_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eciec_election_candidate_info_election_candidate_mk`(`election_candidate_id`) USING BTREE,
  CONSTRAINT `eciec_election_candidate_info_election_candidate_mk` FOREIGN KEY (`election_candidate_id`) REFERENCES `election_candidate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for election_vote
-- ----------------------------
DROP TABLE IF EXISTS `election_vote`;
CREATE TABLE `election_vote`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `election_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `election_candidate_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eve_election_vote_election_id`(`election_id`) USING BTREE,
  INDEX `evu_election_vote_user_id`(`user_id`) USING BTREE,
  INDEX `evec_election_vote_election_candidate`(`election_candidate_id`) USING BTREE,
  CONSTRAINT `eve_election_vote_election_id` FOREIGN KEY (`election_id`) REFERENCES `election` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evec_election_vote_election_candidate` FOREIGN KEY (`election_candidate_id`) REFERENCES `election_candidate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evu_election_vote_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3449 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `department_id` int(0) NULL DEFAULT NULL,
  `job_id` int(0) NULL DEFAULT NULL,
  `inps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scientific_work` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `languages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang_certs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `rank_id` int(0) NULL DEFAULT NULL,
  `science_degree_id` int(0) NULL DEFAULT NULL,
  `scientific_title_id` int(0) NULL DEFAULT NULL,
  `special_title_id` int(0) NULL DEFAULT NULL,
  `reception_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `out_staff` tinyint(1) NULL DEFAULT NULL,
  `basic_job` tinyint(1) NULL DEFAULT NULL,
  `is_convicted` tinyint(1) NULL DEFAULT NULL,
  `party_membership` tinyint(1) NULL DEFAULT NULL,
  `awords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `depuities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `military_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `disability_group` tinyint(1) NULL DEFAULT NULL,
  `family_status` tinyint(1) NULL DEFAULT NULL,
  `children` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employee_article
-- ----------------------------
DROP TABLE IF EXISTS `employee_article`;
CREATE TABLE `employee_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `employee_id` int(0) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `co_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `magazine_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `published_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employee_cert
-- ----------------------------
DROP TABLE IF EXISTS `employee_cert`;
CREATE TABLE `employee_cert`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `employee_id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` decimal(10, 0) NULL DEFAULT NULL,
  `given_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employee_education
-- ----------------------------
DROP TABLE IF EXISTS `employee_education`;
CREATE TABLE `employee_education`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `employee_id` int(0) NOT NULL,
  `university_id` int(0) NOT NULL,
  `specialty_id` int(0) NULL DEFAULT NULL,
  `education` tinyint(1) NOT NULL,
  `education_level` tinyint(1) NOT NULL,
  `university_finished_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employee_job
-- ----------------------------
DROP TABLE IF EXISTS `employee_job`;
CREATE TABLE `employee_job`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `employee_id` int(0) NOT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `begin_date` timestamp(0) NOT NULL,
  `begin_doc_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `begin_doc_date` timestamp(0) NULL DEFAULT NULL,
  `end_date` timestamp(0) NOT NULL,
  `end_doc_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `end_doc_date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `checking_at` datetime(0) NULL DEFAULT NULL,
  `checking_until` datetime(0) NULL DEFAULT NULL,
  `archived` int(0) NULL DEFAULT 0,
  `old_exam_id` int(0) NULL DEFAULT NULL,
  `question_count_by_type_with_ball` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `question_count_by_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_type_id` int(0) NOT NULL,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `start` datetime(0) NOT NULL,
  `finish` datetime(0) NOT NULL,
  `max_ball` double NULL DEFAULT 0,
  `min_ball` double NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `status_appeal` int(0) NULL DEFAULT 0 COMMENT 'appeal status all',
  `appeal_start` int(0) NULL DEFAULT NULL COMMENT 'elon qilingan sanasi',
  `appeal_finish` int(0) NULL DEFAULT NULL COMMENT 'elon qilingan sanasi',
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `duration` int(0) NULL DEFAULT NULL,
  `is_protected` int(0) NULL DEFAULT 0,
  `faculty_id` int(0) NULL DEFAULT NULL COMMENT 'faculty',
  `direction_id` int(0) NULL DEFAULT NULL COMMENT 'direction',
  `type` int(0) NULL DEFAULT 1 COMMENT 'type 1 - random teshiradi 2 - teacher o`zi tekshiradi id ',
  `edu_year_id` int(0) NULL DEFAULT NULL COMMENT 'talim yili',
  `category` int(0) NULL DEFAULT 1 COMMENT '1-oddiy 2-intensiv',
  `subject_id` int(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eet_exam_exam_type`(`exam_type_id`) USING BTREE,
  INDEX `eess_exam_edu_semestr_subject`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `efmk_exam_faculty_id_mk`(`faculty_id`) USING BTREE,
  INDEX `edu_semestr_subject_direction_id_bm`(`direction_id`) USING BTREE,
  CONSTRAINT `edu_semestr_subject_direction_id_bm` FOREIGN KEY (`direction_id`) REFERENCES `direction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eess_exam_edu_semestr_subject` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eet_exam_exam_type` FOREIGN KEY (`exam_type_id`) REFERENCES `exams_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `efmk_exam_direction_id_mk` FOREIGN KEY (`direction_id`) REFERENCES `direction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `efmk_exam_faculty_id_mk` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1283 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_appeal
-- ----------------------------
DROP TABLE IF EXISTS `exam_appeal`;
CREATE TABLE `exam_appeal`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ball` double NULL DEFAULT NULL,
  `old_ball` double NULL DEFAULT NULL,
  `exam_id` int(0) NULL DEFAULT 0 COMMENT 'exam id',
  `student_id` int(0) NULL DEFAULT NULL,
  `exam_student_id` int(0) NOT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL COMMENT 'tekshiruvchi teacher id',
  `appeal_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `teacher_user_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `type` int(0) NULL DEFAULT NULL COMMENT 'qanoatlantirilgani muammo qanday ekanligi ',
  `teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'teacher xulosa ',
  `conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'umumiy xulosa ',
  `lang_id` int(0) NULL DEFAULT NULL COMMENT 'tili ',
  `is_changed` int(0) NULL DEFAULT 0 COMMENT 'o-zgartirilganmi ',
  `archived` int(0) NULL DEFAULT 0,
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eaes_exam_appeal_exam_student`(`exam_student_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `subject_id`(`subject_id`) USING BTREE,
  INDEX `edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `faculty_id`(`faculty_id`) USING BTREE,
  INDEX `semestr_id`(`semestr_id`) USING BTREE,
  INDEX `teacher_user_id`(`teacher_user_id`) USING BTREE,
  CONSTRAINT `eaes_exam_appeal_exam_student` FOREIGN KEY (`exam_student_id`) REFERENCES `exam_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16832 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_appeal_semeta
-- ----------------------------
DROP TABLE IF EXISTS `exam_appeal_semeta`;
CREATE TABLE `exam_appeal_semeta`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `exam_id` int(0) NOT NULL,
  `lang_id` int(0) NOT NULL,
  `teacher_access_id` int(0) NOT NULL,
  `count` int(0) NOT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eas_exam_appeal_semeta_exam_id`(`exam_id`) USING BTREE,
  INDEX `eas_exam_appeal_semeta_lang_id`(`lang_id`) USING BTREE,
  INDEX `eas_exam_appeal_semeta_teacher_access_id`(`teacher_access_id`) USING BTREE,
  CONSTRAINT `eas_exam_appeal_semeta_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eas_exam_appeal_semeta_lang_id` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `eas_exam_appeal_semeta_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3941 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_checking_stat
-- ----------------------------
DROP TABLE IF EXISTS `exam_checking_stat`;
CREATE TABLE `exam_checking_stat`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `data` json NULL COMMENT 'asosiy data json qilib yoziladi',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_conclution
-- ----------------------------
DROP TABLE IF EXISTS `exam_conclution`;
CREATE TABLE `exam_conclution`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `key` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `lang_code` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `language_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mkexam_conclution_subject_id`(`subject_id`) USING BTREE,
  CONSTRAINT `mkexam_conclution_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_control
-- ----------------------------
DROP TABLE IF EXISTS `exam_control`;
CREATE TABLE `exam_control`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `archived` int(0) NULL DEFAULT 0,
  `time_table_id` int(0) NOT NULL,
  `start` int(0) NULL DEFAULT NULL,
  `start2` int(0) NULL DEFAULT NULL,
  `finish` int(0) NULL DEFAULT NULL,
  `finish2` int(0) NULL DEFAULT NULL,
  `max_ball` double NULL DEFAULT NULL,
  `max_ball2` double NULL DEFAULT NULL,
  `duration` int(0) NULL DEFAULT NULL,
  `duration2` int(0) NULL DEFAULT NULL,
  `question` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `question2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `question_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `question2_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  `semester_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `language_id` int(0) NOT NULL,
  `edu_plan_id` int(0) NOT NULL,
  `teacher_user_id` int(0) NOT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `edu_semester_id` int(0) NOT NULL,
  `edu_semestr_subject_id` int(0) NULL DEFAULT NULL,
  `subject_category_id` int(0) NOT NULL,
  `old_exam_control_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `direction_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `category` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 0,
  `status2` int(0) NULL DEFAULT NULL,
  `appeal_at` int(0) NULL DEFAULT NULL,
  `appeal2_at` int(0) NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_control_time_table_id`(`time_table_id`) USING BTREE,
  INDEX `exam_control_course_id`(`course_id`) USING BTREE,
  INDEX `exam_control_semester_id`(`semester_id`) USING BTREE,
  INDEX `exam_control_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `exam_control_subject_id`(`subject_id`) USING BTREE,
  INDEX `exam_control_language_id`(`language_id`) USING BTREE,
  INDEX `exam_control_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `exam_control_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `exam_control_subject_category_id`(`subject_category_id`) USING BTREE,
  INDEX `exam_control_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `exam_control_direction_id`(`direction_id`) USING BTREE,
  INDEX `exam_control_teacher_user_id`(`teacher_user_id`) USING BTREE,
  CONSTRAINT `exam_control_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_direction_id` FOREIGN KEY (`direction_id`) REFERENCES `direction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_edu_semester_id` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_semester_id` FOREIGN KEY (`semester_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_subject_category_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_teacher_user_id` FOREIGN KEY (`teacher_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_time_table_id` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5852 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_control_student
-- ----------------------------
DROP TABLE IF EXISTS `exam_control_student`;
CREATE TABLE `exam_control_student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ball` double NULL DEFAULT NULL,
  `old_ball` double NULL DEFAULT NULL,
  `old_ball_b` double NULL DEFAULT NULL,
  `ball2` double NULL DEFAULT NULL,
  `old_ball2` double NULL DEFAULT NULL,
  `old_ball2_b` double NULL DEFAULT NULL,
  `main_ball` double NULL DEFAULT NULL,
  `archived` int(0) NULL DEFAULT 0,
  `exam_control_id` int(0) NULL DEFAULT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `answer_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `conclution` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `student_mark_id` int(0) NULL DEFAULT NULL,
  `answer2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `answer2_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `conclution2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  `semester_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `language_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `teacher_user_id` int(0) NULL DEFAULT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `edu_semestr_subject_id` int(0) NULL DEFAULT NULL,
  `subject_category_id` int(0) NULL DEFAULT NULL,
  `old_exam_control_id` int(0) NULL DEFAULT NULL,
  `plagiat_percent` double NULL DEFAULT NULL,
  `plagiat2_percent` double NULL DEFAULT NULL,
  `plagiat_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `plagiat2_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `edu_admin_change_ball_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `duration` int(0) NULL DEFAULT NULL,
  `start` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `direction_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `category` int(0) NULL DEFAULT NULL,
  `is_checked` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `appeal2_conclution` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `appeal_conclution` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `appeal2_status` int(0) NULL DEFAULT NULL,
  `appeal_status` int(0) NULL DEFAULT NULL,
  `appeal2` int(0) NULL DEFAULT NULL,
  `appeal` int(0) NULL DEFAULT NULL,
  `appeal2_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `appeal_text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `order` int(0) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `time_option_id` int(0) NULL DEFAULT NULL,
  `time_table_id` int(0) NULL DEFAULT NULL,
  `time_option_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_control_student_exam_control_id`(`exam_control_id`) USING BTREE,
  INDEX `exam_control_student_course_id`(`course_id`) USING BTREE,
  INDEX `exam_control_student_semester_id`(`semester_id`) USING BTREE,
  INDEX `exam_control_student_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `exam_control_student_subject_id`(`subject_id`) USING BTREE,
  INDEX `exam_control_student_language_id`(`language_id`) USING BTREE,
  INDEX `exam_control_student_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `exam_control_student_teacher_user_id`(`teacher_user_id`) USING BTREE,
  INDEX `exam_control_student_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `exam_control_student_subject_category_id`(`subject_category_id`) USING BTREE,
  INDEX `exam_control_student_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `exam_control_student_direction_id`(`direction_id`) USING BTREE,
  INDEX `exam_control_student_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `exam_control_student_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_direction_id` FOREIGN KEY (`direction_id`) REFERENCES `direction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_edu_semester_id` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_exam_control_id` FOREIGN KEY (`exam_control_id`) REFERENCES `exam_control` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_semester_id` FOREIGN KEY (`semester_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_subject_category_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_control_student_teacher_user_id` FOREIGN KEY (`teacher_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 138319 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_log
-- ----------------------------
DROP TABLE IF EXISTS `exam_log`;
CREATE TABLE `exam_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `archived` int(0) NULL DEFAULT 0,
  `old_exam_id` int(0) NULL DEFAULT NULL,
  `exam_id` int(0) NULL DEFAULT NULL,
  `question_count_by_type_with_ball` json NULL,
  `question_count_by_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_type_id` int(0) NULL DEFAULT NULL,
  `edu_semestr_subject_id` int(0) NULL DEFAULT NULL,
  `start` datetime(0) NULL DEFAULT NULL,
  `finish` datetime(0) NULL DEFAULT NULL,
  `max_ball` double NULL DEFAULT 0,
  `min_ball` double NULL DEFAULT 0,
  `order` tinyint(0) NULL DEFAULT 1,
  `status` tinyint(0) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  `duration` int(0) NULL DEFAULT NULL,
  `is_protected` int(0) NULL DEFAULT 0,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `direction_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT 1,
  `status_appeal` int(0) NULL DEFAULT 0,
  `appeal_start` int(0) NULL DEFAULT NULL,
  `appeal_finish` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `category` int(0) NULL DEFAULT 1,
  `subject_id` int(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3636 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_question_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_type`;
CREATE TABLE `exam_question_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_semeta
-- ----------------------------
DROP TABLE IF EXISTS `exam_semeta`;
CREATE TABLE `exam_semeta`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `finish` int(0) NULL DEFAULT NULL,
  `start` int(0) NULL DEFAULT NULL,
  `exam_id` int(0) NOT NULL,
  `lang_id` int(0) NOT NULL,
  `teacher_access_id` int(0) NOT NULL,
  `count` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `type` int(0) NULL DEFAULT 1 COMMENT 'type 1 - random teshiradi 2 - teacher o`zi tekshiradi id ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `esess_exam_smeta_exam`(`exam_id`) USING BTREE,
  INDEX `esl_language`(`lang_id`) USING BTREE,
  INDEX `esta_teacher_access_relection_bm`(`teacher_access_id`) USING BTREE,
  CONSTRAINT `esess_exam_smeta_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `esl_language` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `esta_teacher_access_relection_bm` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5185 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student
-- ----------------------------
DROP TABLE IF EXISTS `exam_student`;
CREATE TABLE `exam_student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `archived` int(0) NULL DEFAULT 0,
  `student_mark_id` int(0) NULL DEFAULT NULL,
  `is_checked_full_c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'is_checked_full_c',
  `has_answer_c` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_id` int(0) NOT NULL,
  `exam_id` int(0) NOT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `on1` double NULL DEFAULT NULL COMMENT 'oraliq 1',
  `on2` double NULL DEFAULT NULL COMMENT 'oraliq 2',
  `in_ball` double NULL DEFAULT NULL COMMENT 'oraliq bal',
  `ball` double NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL COMMENT '1 ielts 2 nogiron masalan',
  `main_ball` int(0) NULL DEFAULT NULL,
  `attempt` int(0) NULL DEFAULT 1 COMMENT 'Nechinchi marta topshirayotgani',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `lang_id` int(0) NULL DEFAULT NULL,
  `start` int(0) NULL DEFAULT NULL,
  `duration` int(0) NULL DEFAULT 0,
  `finish` int(0) NULL DEFAULT NULL,
  `password` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_semeta_id` int(0) NULL DEFAULT NULL COMMENT 'exam_semeta id',
  `conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'umumiy xulosa',
  `plagiat_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'fayl',
  `plagiat_percent` float NULL DEFAULT 0 COMMENT 'foyizi',
  `is_plagiat` int(0) NULL DEFAULT 0 COMMENT '0-plagiat emas, 1-plagiat',
  `act` int(0) NULL DEFAULT 0 COMMENT '1 act tuzilgan imtihon qodalarini bizgan',
  `act_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `act_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_checked` int(0) NULL DEFAULT 0 COMMENT 'tekshirilganligi',
  `is_checked_full` int(0) NULL DEFAULT 0 COMMENT 'toliq tekshirilhanligi',
  `has_answer` int(0) NULL DEFAULT 0 COMMENT 'javob yozilganligi',
  `edu_year_id` int(0) NULL DEFAULT NULL COMMENT 'talim yili',
  `subject_id` int(0) NULL DEFAULT NULL,
  `edu_semestr_subject_id` int(0) NULL DEFAULT NULL,
  `checking_time` int(0) NULL DEFAULT NULL,
  `is_checked_new` int(0) NULL DEFAULT NULL,
  `has_answer_new` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ses_exam_student_student_id`(`student_id`) USING BTREE,
  INDEX `ses_exam_student_exam_id`(`exam_id`) USING BTREE,
  INDEX `ses_exam_student_teacher_access_id`(`teacher_access_id`) USING BTREE,
  INDEX `eses_exam_student_exam_exam_semeta_id`(`exam_semeta_id`) USING BTREE,
  CONSTRAINT `eses_exam_student_exam_exam_semeta_id` FOREIGN KEY (`exam_semeta_id`) REFERENCES `exam_semeta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ses_exam_student_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ses_exam_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ses_exam_student_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 135507 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_answer
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_answer`;
CREATE TABLE `exam_student_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `archived` int(0) NULL DEFAULT 0,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'umumiy xulosa',
  `ball` double NULL DEFAULT NULL,
  `max_ball` double NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_id` int(0) NOT NULL,
  `question_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `option_id` int(0) NULL DEFAULT NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `attempt` int(0) NULL DEFAULT 1 COMMENT 'Nechinchi marta topshirayotgani',
  `type` tinyint(1) NOT NULL COMMENT '1-savol, 2-test, 3-another',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `appeal_teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'appeal xulosa ',
  `student_created_at` int(0) NULL DEFAULT NULL COMMENT 'student yaratgan payt',
  `student_updated_at` int(0) NULL DEFAULT NULL COMMENT 'student o\'zgartirgan payt payt',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ses_exam_student_answer_exam`(`exam_id`) USING BTREE,
  INDEX `ses_exam_student_answer_student`(`student_id`) USING BTREE,
  INDEX `ses_exam_student_answer_teacher_access`(`teacher_access_id`) USING BTREE,
  INDEX `ses_exam_student_answer_exam_question`(`question_id`) USING BTREE,
  INDEX `ses_exam_student_answer_option`(`option_id`) USING BTREE,
  CONSTRAINT `ses_exam_student_answer_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ses_exam_student_answer_exam_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ses_exam_student_answer_option` FOREIGN KEY (`option_id`) REFERENCES `question_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ses_exam_student_answer_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ses_exam_student_answer_teacher_access` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 120502 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_answer_15
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_answer_15`;
CREATE TABLE `exam_student_answer_15`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `archived` int(0) NULL DEFAULT 0,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'umumiy xulosa',
  `ball` double NULL DEFAULT NULL,
  `max_ball` double NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_id` int(0) NOT NULL,
  `question_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `option_id` int(0) NULL DEFAULT NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `attempt` int(0) NULL DEFAULT 1 COMMENT 'Nechinchi marta topshirayotgani',
  `type` tinyint(1) NOT NULL COMMENT '1-savol, 2-test, 3-another',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `appeal_teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'appeal xulosa ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ses_exam_student_answer_exam`(`exam_id`) USING BTREE,
  INDEX `ses_exam_student_answer_student`(`student_id`) USING BTREE,
  INDEX `ses_exam_student_answer_teacher_access`(`teacher_access_id`) USING BTREE,
  INDEX `ses_exam_student_answer_exam_question`(`question_id`) USING BTREE,
  INDEX `ses_exam_student_answer_option`(`option_id`) USING BTREE,
  CONSTRAINT `exam_student_answer_15_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam_15` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_answer_15_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_answer_15_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `question_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_answer_15_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_answer_15_ibfk_5` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26875 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_answer_22_23
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_answer_22_23`;
CREATE TABLE `exam_student_answer_22_23`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `archived` int(0) NULL DEFAULT 0,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'umumiy xulosa',
  `ball` double NULL DEFAULT NULL,
  `max_ball` double NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_id` int(0) NOT NULL,
  `question_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `option_id` int(0) NULL DEFAULT NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `attempt` int(0) NULL DEFAULT 1 COMMENT 'Nechinchi marta topshirayotgani',
  `type` tinyint(1) NOT NULL COMMENT '1-savol, 2-test, 3-another',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `appeal_teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'appeal xulosa ',
  `student_created_at` int(0) NULL DEFAULT NULL COMMENT 'student yaratgan payt',
  `student_updated_at` int(0) NULL DEFAULT NULL COMMENT 'student o\'zgartirgan payt payt',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ses_exam_student_answer_exam`(`exam_id`) USING BTREE,
  INDEX `ses_exam_student_answer_student`(`student_id`) USING BTREE,
  INDEX `ses_exam_student_answer_teacher_access`(`teacher_access_id`) USING BTREE,
  INDEX `ses_exam_student_answer_exam_question`(`question_id`) USING BTREE,
  INDEX `ses_exam_student_answer_option`(`option_id`) USING BTREE,
  CONSTRAINT `exam_student_answer_22_23_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_answer_22_23_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `question_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_answer_22_23_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_answer_22_23_ibfk_5` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 78213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_answer_deleted
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_answer_deleted`;
CREATE TABLE `exam_student_answer_deleted`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_student_answer_id` int(0) NULL DEFAULT NULL,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `parent_id` int(0) NULL DEFAULT NULL,
  `exam_id` int(0) NULL DEFAULT NULL,
  `question_id` int(0) NULL DEFAULT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `option_id` int(0) NULL DEFAULT NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `max_ball` double NULL DEFAULT NULL,
  `ball` double NULL DEFAULT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `attempt` int(0) NULL DEFAULT 1 COMMENT 'Nechinchi marta topshirayotgani',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1-savol, 2-test, 3-another',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  `created_at_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  `updated_at_o` int(0) NULL DEFAULT NULL COMMENT 'eski o`zgartirilgan',
  `created_by_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  `updated_by_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_answer_sub_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_answer_sub_question`;
CREATE TABLE `exam_student_answer_sub_question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `archived` int(0) NULL DEFAULT 0,
  `student_id` int(0) NULL DEFAULT NULL,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `ball` double NULL DEFAULT NULL,
  `old_ball` double NULL DEFAULT NULL COMMENT 'eski ball',
  `old_ball_calculate` double NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_student_answer_id` int(0) NOT NULL,
  `sub_question_id` int(0) NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `max_ball` double NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT ' xulosa',
  `appeal_teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'appeal_teacher_conclusion',
  `is_cheked` int(0) NULL DEFAULT NULL,
  `student_created_at` int(0) NULL DEFAULT NULL COMMENT 'student yaratgan payt',
  `student_updated_at` int(0) NULL DEFAULT NULL COMMENT 'student o\'zgartirgan payt',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `esasqesa_exam_student_answer_sub_question_exam_student_answer`(`exam_student_answer_id`) USING BTREE,
  INDEX `esasqsq_exam_student_answer_sub_question_sub_question`(`sub_question_id`) USING BTREE,
  INDEX `esasqb_exam_student_answer_sub_question_ball`(`ball`) USING BTREE COMMENT 'test',
  CONSTRAINT `esasqesa_exam_student_answer_sub_question_exam_student_answer` FOREIGN KEY (`exam_student_answer_id`) REFERENCES `exam_student_answer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `esasqsq_exam_student_answer_sub_question_sub_question` FOREIGN KEY (`sub_question_id`) REFERENCES `sub_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 410432 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_answer_sub_question_deleted
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_answer_sub_question_deleted`;
CREATE TABLE `exam_student_answer_sub_question_deleted`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_student_answer_id` int(0) NULL DEFAULT NULL,
  `exam_student_answer_sub_question_id` int(0) NULL DEFAULT NULL,
  `sub_question_id` int(0) NULL DEFAULT NULL,
  `teacher_conclusion` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ball` double NULL DEFAULT NULL,
  `max_ball` double NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  `created_at_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  `updated_at_o` int(0) NULL DEFAULT NULL COMMENT 'eski o`zgartirilgan',
  `created_by_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  `updated_by_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 521 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_deleted
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_deleted`;
CREATE TABLE `exam_student_deleted`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `start` int(0) NULL DEFAULT NULL,
  `finish` int(0) NULL DEFAULT NULL,
  `exam_id` int(0) NULL DEFAULT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `attempt` int(0) NULL DEFAULT NULL,
  `lang_id` int(0) NULL DEFAULT NULL,
  `exam_semeta_id` int(0) NULL DEFAULT NULL,
  `is_plagiat` int(0) NULL DEFAULT NULL,
  `duration` int(0) NULL DEFAULT NULL,
  `ball` double NULL DEFAULT NULL,
  `plagiat_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` int(0) NULL DEFAULT NULL,
  `plagiat_percent` int(0) NULL DEFAULT NULL,
  `conclusion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  `created_at_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  `updated_at_o` int(0) NULL DEFAULT NULL COMMENT 'eski o`zgartirilgan',
  `created_by_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  `updated_by_o` int(0) NULL DEFAULT NULL COMMENT 'eski yaratilgani',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 769 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_reaxam
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_reaxam`;
CREATE TABLE `exam_student_reaxam`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `exam_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_student_reaxam_student_id`(`student_id`) USING BTREE,
  INDEX `exam_student_reaxam_exam_student_id`(`exam_student_id`) USING BTREE,
  INDEX `exam_student_reaxam_subject_id`(`subject_id`) USING BTREE,
  INDEX `exam_student_reaxam_exam_id`(`exam_id`) USING BTREE,
  CONSTRAINT `exam_student_reaxam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_reaxam_exam_student_id` FOREIGN KEY (`exam_student_id`) REFERENCES `exam_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_reaxam_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_reaxam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 414 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_student_reexam
-- ----------------------------
DROP TABLE IF EXISTS `exam_student_reexam`;
CREATE TABLE `exam_student_reexam`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `exam_student_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `exam_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `exam_student_reexam_student_id`(`student_id`) USING BTREE,
  INDEX `exam_student_reexam_exam_student_id`(`exam_student_id`) USING BTREE,
  INDEX `exam_student_reexam_subject_id`(`subject_id`) USING BTREE,
  INDEX `exam_student_reexam_exam_id`(`exam_id`) USING BTREE,
  CONSTRAINT `exam_student_reexam_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_reexam_exam_student_id` FOREIGN KEY (`exam_student_id`) REFERENCES `exam_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_reexam_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_student_reexam_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_teacher_check
-- ----------------------------
DROP TABLE IF EXISTS `exam_teacher_check`;
CREATE TABLE `exam_teacher_check`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `teacher_access_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `exam_id` int(0) NOT NULL,
  `attempt` int(0) NULL DEFAULT 1 COMMENT 'Nechinchi marta topshirayotgani',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `etchs_exam_teacher_check_teacher_access_relection_mk`(`teacher_access_id`) USING BTREE,
  INDEX `etchs_exam_teacher_check_student_relection_mk`(`student_id`) USING BTREE,
  INDEX `etchs_exam_teacher_check_exam_relection_mk`(`exam_id`) USING BTREE,
  CONSTRAINT `etchs_exam_teacher_check_exam_relection_mk` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `etchs_exam_teacher_check_student_relection_mk` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `etchs_exam_teacher_check_teacher_access_relection_mk` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exams_type
-- ----------------------------
DROP TABLE IF EXISTS `exams_type`;
CREATE TABLE `exams_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `user_id` int(0) NULL DEFAULT NULL COMMENT 'Lead of faculty or Dean (dekan)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fu_faculty_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fu_faculty_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for holiday
-- ----------------------------
DROP TABLE IF EXISTS `holiday`;
CREATE TABLE `holiday`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `moved_date` date NULL DEFAULT NULL,
  `year` int(0) NULL DEFAULT NULL,
  `month` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT 1 COMMENT '1 bayram faqat dam; 2 ko`chirilgan kun;',
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostel_app
-- ----------------------------
DROP TABLE IF EXISTS `hostel_app`;
CREATE TABLE `hostel_app`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `ball` double NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `conclution` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  `room_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hostel_app_hostel_student_id`(`student_id`) USING BTREE,
  CONSTRAINT `hostel_app_hostel_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostel_category
-- ----------------------------
DROP TABLE IF EXISTS `hostel_category`;
CREATE TABLE `hostel_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ball` double NULL DEFAULT 0,
  `a1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostel_category_type
-- ----------------------------
DROP TABLE IF EXISTS `hostel_category_type`;
CREATE TABLE `hostel_category_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `hostel_category_id` int(0) NOT NULL,
  `ball` double NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hostel_category_type_hostel_category_id`(`hostel_category_id`) USING BTREE,
  CONSTRAINT `hostel_category_type_hostel_category_id` FOREIGN KEY (`hostel_category_id`) REFERENCES `hostel_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostel_doc
-- ----------------------------
DROP TABLE IF EXISTS `hostel_doc`;
CREATE TABLE `hostel_doc`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ball` double NULL DEFAULT NULL,
  `is_checked` tinyint(1) NULL DEFAULT NULL,
  `student_id` int(0) NOT NULL,
  `hostel_app_id` int(0) NOT NULL,
  `hostel_category_id` int(0) NOT NULL,
  `hostel_category_type_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start` date NULL DEFAULT NULL,
  `finish` date NULL DEFAULT NULL,
  `conclution` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hostel_doc_hostel_student_id`(`student_id`) USING BTREE,
  INDEX `hostel_doc_hostel_hostel_app_id`(`hostel_app_id`) USING BTREE,
  INDEX `hostel_doc_hostel_hostel_category_id`(`hostel_category_id`) USING BTREE,
  INDEX `hostel_doc_hostel_hostel_category_type_id`(`hostel_category_type_id`) USING BTREE,
  CONSTRAINT `hostel_doc_hostel_hostel_app_id` FOREIGN KEY (`hostel_app_id`) REFERENCES `hostel_app` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hostel_doc_hostel_hostel_category_id` FOREIGN KEY (`hostel_category_id`) REFERENCES `hostel_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hostel_doc_hostel_hostel_category_type_id` FOREIGN KEY (`hostel_category_type_id`) REFERENCES `hostel_category_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hostel_doc_hostel_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hostel_student_room
-- ----------------------------
DROP TABLE IF EXISTS `hostel_student_room`;
CREATE TABLE `hostel_student_room`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `room_id` int(0) NOT NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `payed` double NULL DEFAULT NULL,
  `is_contract` tinyint(1) NULL DEFAULT 1,
  `is_free` tinyint(1) NULL DEFAULT 0,
  `archived` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mk_hostel_student_room_room_id`(`room_id`) USING BTREE,
  INDEX `mk_hostel_student_room_student_id`(`student_id`) USING BTREE,
  INDEX `mk_hostel_student_room_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `mk_hostel_student_room_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `mk_hostel_student_room_edu_plan_id`(`edu_plan_id`) USING BTREE,
  CONSTRAINT `mk_hostel_student_room_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_hostel_student_room_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_hostel_student_room_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_hostel_student_room_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mk_hostel_student_room_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 620 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for instruction
-- ----------------------------
DROP TABLE IF EXISTS `instruction`;
CREATE TABLE `instruction`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for intensiv_qarzdorlik
-- ----------------------------
DROP TABLE IF EXISTS `intensiv_qarzdorlik`;
CREATE TABLE `intensiv_qarzdorlik`  (
  `id` int(0) NOT NULL,
  `kus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fish` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_id` int(0) NULL DEFAULT NULL,
  `kredit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bir_kridit_miqdori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `shartnoma_summasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tolov_summa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qarz` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `haqdorligi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `buyruq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `yonalish` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jshshir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ips_service
-- ----------------------------
DROP TABLE IF EXISTS `ips_service`;
CREATE TABLE `ips_service`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `function` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_working` int(0) NULL DEFAULT 1,
  `status` int(0) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NULL DEFAULT 0,
  `department_id` int(0) NULL DEFAULT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_info
-- ----------------------------
DROP TABLE IF EXISTS `job_info`;
CREATE TABLE `job_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `job_id` int(0) NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_title
-- ----------------------------
DROP TABLE IF EXISTS `job_title`;
CREATE TABLE `job_title`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_access_type_id` int(0) NULL DEFAULT NULL,
  `table_id` int(0) NULL DEFAULT NULL,
  `is_leader` tinyint(1) NULL DEFAULT 0,
  `type` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jtuat_job_title_user_access_type_id`(`user_access_type_id`) USING BTREE,
  CONSTRAINT `jtuat_job_title_user_access_type_id` FOREIGN KEY (`user_access_type_id`) REFERENCES `user_access_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_title_info
-- ----------------------------
DROP TABLE IF EXISTS `job_title_info`;
CREATE TABLE `job_title_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `job_title_id` int(0) NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jtijt_job_title_info_job_title`(`job_title_id`) USING BTREE,
  CONSTRAINT `jtijt_job_title_info_job_title` FOREIGN KEY (`job_title_id`) REFERENCES `job_title` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kafedra
-- ----------------------------
DROP TABLE IF EXISTS `kafedra`;
CREATE TABLE `kafedra`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `direction_id` int(0) NOT NULL,
  `faculty_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `user_id` int(0) NULL DEFAULT NULL COMMENT 'Lead of kafedra or Mudir',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dk_kafedra_direction_id`(`direction_id`) USING BTREE,
  INDEX `fk_kafedra_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `fu_kafedra_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `dk_kafedra_direction_id` FOREIGN KEY (`direction_id`) REFERENCES `direction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_kafedra_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fu_kafedra_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for keys
-- ----------------------------
DROP TABLE IF EXISTS `keys`;
CREATE TABLE `keys`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kpi_category
-- ----------------------------
DROP TABLE IF EXISTS `kpi_category`;
CREATE TABLE `kpi_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_ids` json NULL COMMENT 'tekshiruvchi uselar id lari',
  `fields` json NULL COMMENT '[\"date\", \"file\", \"subject_category\", \"count_of_copyright\", \"link\"]',
  `max_ball` double NULL DEFAULT 0,
  `term` tinyint(1) NULL DEFAULT 1 COMMENT 'muddati 1-bir yil 2-olti oy',
  `tab` tinyint(1) NULL DEFAULT 1 COMMENT 'tab raqami',
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kpi_category_info
-- ----------------------------
DROP TABLE IF EXISTS `kpi_category_info`;
CREATE TABLE `kpi_category_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kpi_category_id` int(0) NOT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `tab_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kpicikc_kpi_category_info_kpi_category`(`kpi_category_id`) USING BTREE,
  CONSTRAINT `kpicikc_kpi_category_info_kpi_category` FOREIGN KEY (`kpi_category_id`) REFERENCES `kpi_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kpi_data
-- ----------------------------
DROP TABLE IF EXISTS `kpi_data`;
CREATE TABLE `kpi_data`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kpi_category_id` int(0) NOT NULL,
  `date` date NULL DEFAULT NULL,
  `file1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `link` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `link2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ball` double NULL DEFAULT NULL,
  `count` int(0) NULL DEFAULT NULL,
  `subject_category_id` int(0) NULL DEFAULT NULL,
  `event_type` int(0) NULL DEFAULT NULL,
  `event_form` int(0) NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `count_of_copyright` int(0) NULL DEFAULT 0,
  `user_id` int(0) NOT NULL,
  `a1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  `is_deleted_org` tinyint(0) NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  `archived_org` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15557 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kpi_mark
-- ----------------------------
DROP TABLE IF EXISTS `kpi_mark`;
CREATE TABLE `kpi_mark`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kpi_category_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `ball` double NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kpi_mark_kpi_user_id`(`user_id`) USING BTREE,
  INDEX `kpi_mark_kpi_category_id`(`kpi_category_id`) USING BTREE,
  INDEX `kpi_mark_kpi_edu_year_id`(`edu_year_id`) USING BTREE,
  CONSTRAINT `kpi_mark_kpi_category_id` FOREIGN KEY (`kpi_category_id`) REFERENCES `kpi_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpi_mark_kpi_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpi_mark_kpi_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20762 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kpi_marking
-- ----------------------------
DROP TABLE IF EXISTS `kpi_marking`;
CREATE TABLE `kpi_marking`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kpi_category_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `ball` double NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kpi_marking_kpi_user_id`(`user_id`) USING BTREE,
  INDEX `kpi_marking_kpi_category_id`(`kpi_category_id`) USING BTREE,
  CONSTRAINT `kpi_marking_kpi_category_id` FOREIGN KEY (`kpi_category_id`) REFERENCES `kpi_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpi_marking_kpi_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kpi_staff
-- ----------------------------
DROP TABLE IF EXISTS `kpi_staff`;
CREATE TABLE `kpi_staff`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_access_id` int(0) NOT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `job_title_id` int(0) NULL DEFAULT NULL,
  `user_access_type_id` int(0) NULL DEFAULT NULL,
  `table_id` int(0) NULL DEFAULT NULL,
  `work_rate_id` int(0) NULL DEFAULT NULL,
  `work_type` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT 1,
  `in_doc_all` int(0) NULL DEFAULT NULL,
  `in_doc_on_time` int(0) NULL DEFAULT NULL,
  `in_doc_after_time` int(0) NULL DEFAULT NULL,
  `in_doc_not_done` int(0) NULL DEFAULT NULL,
  `in_doc_ball` double NULL DEFAULT NULL,
  `in_doc_percent` double NULL DEFAULT NULL,
  `in_doc_collected_ball` double NULL DEFAULT NULL,
  `ex_doc_all` int(0) NULL DEFAULT NULL,
  `ex_doc_on_time` int(0) NULL DEFAULT NULL,
  `ex_doc_after_time` int(0) NULL DEFAULT NULL,
  `ex_doc_not_done` int(0) NULL DEFAULT NULL,
  `ex_doc_ball` double NULL DEFAULT NULL,
  `ex_doc_percent` double NULL DEFAULT NULL,
  `ex_doc_collected_ball` double NULL DEFAULT NULL,
  `ball_dep_lead` double NULL DEFAULT NULL,
  `file_dep_lead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ball_rector` double NULL DEFAULT NULL,
  `ball_commission` double NULL DEFAULT NULL,
  `ball_all` double NULL DEFAULT NULL,
  `kpi` int(0) NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL DEFAULT 0,
  `updated_at` int(0) NOT NULL DEFAULT 0,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ks_edu_year_mk`(`edu_year_id`) USING BTREE,
  INDEX `ks_user_access_mk`(`user_access_id`) USING BTREE,
  CONSTRAINT `ks_edu_year_mk` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ks_user_access_mk` FOREIGN KEY (`user_access_id`) REFERENCES `user_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kpi_store
-- ----------------------------
DROP TABLE IF EXISTS `kpi_store`;
CREATE TABLE `kpi_store`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kpi_category_id` int(0) NOT NULL,
  `date` date NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subject_category_id` int(0) NULL DEFAULT NULL,
  `count_of_copyright` int(0) NULL DEFAULT 0,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ball` double NULL DEFAULT 0,
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `kpiskc_kpi_data_kpi_category`(`kpi_category_id`) USING BTREE,
  INDEX `kpissc_kpi_data_subject_category`(`subject_category_id`) USING BTREE,
  INDEX `kpissc_kpi_data_user`(`user_id`) USING BTREE,
  CONSTRAINT `kpiskc_kpi_data_kpi_category` FOREIGN KEY (`kpi_category_id`) REFERENCES `kpi_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpiskc_kpi_store_kpi_category` FOREIGN KEY (`kpi_category_id`) REFERENCES `kpi_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpissc_kpi_data_subject_category` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpissc_kpi_data_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpissc_kpi_store_subject_category` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kpissc_kpi_store_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1506 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lang_certificate
-- ----------------------------
DROP TABLE IF EXISTS `lang_certificate`;
CREATE TABLE `lang_certificate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `certificate_type_id` int(0) NOT NULL,
  `ball` double NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_type` int(0) NULL DEFAULT 1 COMMENT '1-student, 2-teacher, 3-xodim',
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lang_certificate_user_id`(`user_id`) USING BTREE,
  INDEX `lang_certificate_certificate_type_id`(`certificate_type_id`) USING BTREE,
  CONSTRAINT `lang_certificate_certificate_type_id` FOREIGN KEY (`certificate_type_id`) REFERENCES `lang_certificate_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lang_certificate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lang_certificate_type
-- ----------------------------
DROP TABLE IF EXISTS `lang_certificate_type`;
CREATE TABLE `lang_certificate_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `locale` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rtl` smallint(0) NULL DEFAULT 0,
  `default` smallint(0) NULL DEFAULT 0,
  `sort` int(0) NULL DEFAULT 0,
  `status` int(0) NULL DEFAULT 0,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT NULL,
  `updated_by` int(0) NULL DEFAULT NULL,
  `is_deleted` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx-setting-lang_code`(`lang_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_history
-- ----------------------------
DROP TABLE IF EXISTS `login_history`;
CREATE TABLE `login_history`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `log_in_out` tinyint(1) NULL DEFAULT 1,
  `ip_data` json NULL,
  `device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `model_device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `host` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2189483 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logs_admin
-- ----------------------------
DROP TABLE IF EXISTS `logs_admin`;
CREATE TABLE `logs_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT 0,
  `res_id` int(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logs_frontend
-- ----------------------------
DROP TABLE IF EXISTS `logs_frontend`;
CREATE TABLE `logs_frontend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT 0,
  `res_id` int(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logs_seller
-- ----------------------------
DROP TABLE IF EXISTS `logs_seller`;
CREATE TABLE `logs_seller`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT 0,
  `res_id` int(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu_group
-- ----------------------------
DROP TABLE IF EXISTS `menu_group`;
CREATE TABLE `menu_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_id` int(0) NOT NULL DEFAULT 0,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` int(0) NOT NULL DEFAULT 0,
  `group_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apply_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for military
-- ----------------------------
DROP TABLE IF EXISTS `military`;
CREATE TABLE `military`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `joy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `chas_raqami` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `seria_raqami` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rel_student_student_id`(`student_id`) USING BTREE,
  INDEX `idx_rel_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_rel_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rel_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nationality
-- ----------------------------
DROP TABLE IF EXISTS `nationality`;
CREATE TABLE `nationality`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notification_role
-- ----------------------------
DROP TABLE IF EXISTS `notification_role`;
CREATE TABLE `notification_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `notification_id` int(0) NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nrn_notificarion_role_notification_id_mk`(`notification_id`) USING BTREE,
  CONSTRAINT `nrn_notificarion_role_notification_id_mk` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notification_user
-- ----------------------------
DROP TABLE IF EXISTS `notification_user`;
CREATE TABLE `notification_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `notification_role_id` int(0) NOT NULL,
  `notification_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nuu_notification_user_notification_role_id`(`notification_role_id`) USING BTREE,
  INDEX `nuu_notification_user_notification_id`(`notification_id`) USING BTREE,
  INDEX `nuu_notification_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `nuu_notification_user_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nuu_notification_user_notification_role_id` FOREIGN KEY (`notification_role_id`) REFERENCES `notification_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nuu_notification_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oferta
-- ----------------------------
DROP TABLE IF EXISTS `oferta`;
CREATE TABLE `oferta`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role` json NOT NULL,
  `is_comformed` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `date` timestamp(0) NOT NULL,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11609 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for olympic_certificate
-- ----------------------------
DROP TABLE IF EXISTS `olympic_certificate`;
CREATE TABLE `olympic_certificate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` int(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `year` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `olympic_certificate_student_id`(`student_id`) USING BTREE,
  INDEX `olympic_certificate_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `olympic_certificate_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `olympic_certificate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_type
-- ----------------------------
DROP TABLE IF EXISTS `order_type`;
CREATE TABLE `order_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for other_certificate
-- ----------------------------
DROP TABLE IF EXISTS `other_certificate`;
CREATE TABLE `other_certificate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `other_certificate_type_id` int(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ocu_other_certificate_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `ocu_other_certificate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for other_certificate_type
-- ----------------------------
DROP TABLE IF EXISTS `other_certificate_type`;
CREATE TABLE `other_certificate_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for para
-- ----------------------------
DROP TABLE IF EXISTS `para`;
CREATE TABLE `para`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `end_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for partiya
-- ----------------------------
DROP TABLE IF EXISTS `partiya`;
CREATE TABLE `partiya`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_ru` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for password_encrypts
-- ----------------------------
DROP TABLE IF EXISTS `password_encrypts`;
CREATE TABLE `password_encrypts`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `key_id` int(0) NOT NULL,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `up_password_encrypts_user_id`(`user_id`) USING BTREE,
  INDEX `up_password_encrypts_key_id`(`key_id`) USING BTREE,
  CONSTRAINT `up_password_encrypts_key_id` FOREIGN KEY (`key_id`) REFERENCES `keys` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `up_password_encrypts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20043 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for poll
-- ----------------------------
DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NULL DEFAULT 1,
  `roles` json NULL,
  `order` tinyint(0) NULL DEFAULT 1,
  `status` tinyint(0) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for poll_question
-- ----------------------------
DROP TABLE IF EXISTS `poll_question`;
CREATE TABLE `poll_question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `poll_id` int(0) NOT NULL,
  `type` tinyint(0) NULL DEFAULT 1,
  `order` tinyint(0) NULL DEFAULT 1,
  `status` tinyint(0) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_poll_question_poll_id`(`poll_id`) USING BTREE,
  CONSTRAINT `fk_poll_question_poll_id` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for poll_question_option
-- ----------------------------
DROP TABLE IF EXISTS `poll_question_option`;
CREATE TABLE `poll_question_option`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `poll_id` int(0) NOT NULL,
  `poll_question_id` int(0) NOT NULL,
  `type` tinyint(0) NULL DEFAULT 1,
  `order` tinyint(0) NULL DEFAULT 1,
  `status` tinyint(0) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_poll_question_option_poll_id`(`poll_id`) USING BTREE,
  INDEX `fk_poll_question_option_poll_question_id`(`poll_question_id`) USING BTREE,
  CONSTRAINT `fk_poll_question_option_poll_id` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_poll_question_option_poll_question_id` FOREIGN KEY (`poll_question_id`) REFERENCES `poll_question` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for poll_user
-- ----------------------------
DROP TABLE IF EXISTS `poll_user`;
CREATE TABLE `poll_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `poll_id` int(0) NOT NULL,
  `poll_question_id` int(0) NOT NULL,
  `poll_question_option_id` int(0) NULL DEFAULT NULL,
  `poll_question_option_answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_form_id` int(0) NULL DEFAULT NULL,
  `order` tinyint(0) NULL DEFAULT 1,
  `status` tinyint(0) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `is_deleted` tinyint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_poll_user_user`(`user_id`) USING BTREE,
  INDEX `fk_poll_user_poll`(`poll_id`) USING BTREE,
  INDEX `fk_poll_user_poll_question`(`poll_question_id`) USING BTREE,
  INDEX `fk_poll_user_poll_question_option`(`poll_question_option_id`) USING BTREE,
  INDEX `fk_poll_user_student`(`student_id`) USING BTREE,
  INDEX `fk_poll_user_faculty`(`faculty_id`) USING BTREE,
  INDEX `fk_poll_user_edu_form`(`edu_form_id`) USING BTREE,
  CONSTRAINT `fk_poll_user_edu_form` FOREIGN KEY (`edu_form_id`) REFERENCES `edu_form` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poll_user_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poll_user_poll` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poll_user_poll_question` FOREIGN KEY (`poll_question_id`) REFERENCES `poll_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poll_user_poll_question_option` FOREIGN KEY (`poll_question_option_id`) REFERENCES `poll_question_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poll_user_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poll_user_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 73974 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `checked` int(0) NULL DEFAULT 0,
  `checked_full` int(0) NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passport_seria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passport_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passport_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passport_given_date` date NULL DEFAULT NULL,
  `passport_issued_date` date NULL DEFAULT NULL,
  `passport_given_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone_secondary` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `passport_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country_id` int(0) NULL DEFAULT NULL,
  `is_foreign` int(0) NULL DEFAULT NULL,
  `region_id` int(0) NULL DEFAULT NULL,
  `area_id` int(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` int(0) NULL DEFAULT NULL,
  `permanent_country_id` int(0) NULL DEFAULT NULL,
  `permanent_region_id` int(0) NULL DEFAULT NULL,
  `permanent_area_id` int(0) NULL DEFAULT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `citizenship_id` int(0) NULL DEFAULT 1 COMMENT 'citizenship_id fuqarolik turi',
  `nationality_id` int(0) NULL DEFAULT NULL COMMENT 'millati id ',
  `telegram_chat_id` int(0) NULL DEFAULT NULL,
  `diploma_type_id` int(0) NULL DEFAULT NULL COMMENT 'diploma_type',
  `degree_id` int(0) NULL DEFAULT NULL COMMENT 'darajasi id',
  `academic_degree_id` int(0) NULL DEFAULT NULL COMMENT 'academic_degree id',
  `degree_info_id` int(0) NULL DEFAULT NULL COMMENT 'degree_info id',
  `partiya_id` int(0) NULL DEFAULT NULL COMMENT 'partiya id',
  `has_disability` int(0) NULL DEFAULT 0 COMMENT 'nogironligi',
  `social_protection` int(0) NULL DEFAULT 0 COMMENT 'ijtimoiy himoya reestri',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `up_profile_user_id`(`user_id`) USING BTREE,
  INDEX `cp_profile_country_id`(`country_id`) USING BTREE,
  INDEX `rp_profile_region_id`(`region_id`) USING BTREE,
  INDEX `ap_profile_area_id`(`area_id`) USING BTREE,
  INDEX `cp_profile_permanent_country_id`(`permanent_country_id`) USING BTREE,
  INDEX `rp_profile_permanent_region_id`(`permanent_region_id`) USING BTREE,
  INDEX `ap_profile_permanent_area_id`(`permanent_area_id`) USING BTREE,
  INDEX `pc_profile_citizenship_mk`(`citizenship_id`) USING BTREE,
  CONSTRAINT `ap_profile_area_id` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ap_profile_permanent_area_id` FOREIGN KEY (`permanent_area_id`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cp_profile_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cp_profile_permanent_country_id` FOREIGN KEY (`permanent_country_id`) REFERENCES `countries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pc_profile_citizenship_mk` FOREIGN KEY (`citizenship_id`) REFERENCES `citizenship` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rp_profile_permanent_region_id` FOREIGN KEY (`permanent_region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rp_profile_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `up_profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12826 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `course_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ball` double NULL DEFAULT NULL,
  `question` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Savol matni yozilati',
  `lang_id` int(0) NOT NULL,
  `level` tinyint(1) NULL DEFAULT 1 COMMENT 'Qiyinlilik darajasi 1-oson, 2-o\\\'rta, 3-murakkab',
  `question_type_id` int(0) NOT NULL COMMENT '1-savol, 2-test, 3-another',
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'izohlar uchun',
  `status_n` int(0) NULL DEFAULT NULL,
  `is_deleted_n` int(0) NULL DEFAULT NULL,
  `ssss` int(0) NULL DEFAULT NULL,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qc_question_course`(`course_id`) USING BTREE,
  INDEX `qsm_question_semestr`(`semestr_id`) USING BTREE,
  INDEX `qs_question_subject`(`subject_id`) USING BTREE,
  INDEX `qqt_question_question_type`(`question_type_id`) USING BTREE,
  INDEX `ql_question_language`(`lang_id`) USING BTREE,
  CONSTRAINT `qc_question_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ql_question_language` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qqt_question_question_type` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qs_question_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qsm_question_semestr` FOREIGN KEY (`semestr_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23808 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question_option
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `question_id` int(0) NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_correct` tinyint(1) NULL DEFAULT 0,
  `option` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` tinyint(1) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qoq_question_option_question`(`question_id`) USING BTREE,
  CONSTRAINT `qoq_question_option_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question_student_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_student_answer`;
CREATE TABLE `question_student_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exam_id` int(0) NOT NULL,
  `question_id` int(0) NOT NULL,
  `question_type_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `option_id` int(0) NULL DEFAULT NULL,
  `answer` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ball` int(0) NULL DEFAULT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `attempt` int(0) NULL DEFAULT 1 COMMENT 'Nechinchi marta topshirayotgani',
  `teacher_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qsae_question_student_answer_exam`(`exam_id`) USING BTREE,
  INDEX `qsaq_question_student_answer_question`(`question_id`) USING BTREE,
  INDEX `qsaqt_question_student_answer_student`(`question_type_id`) USING BTREE,
  INDEX `qsas_question_student_answer_student`(`student_id`) USING BTREE,
  INDEX `qsao_question_student_answer_option`(`option_id`) USING BTREE,
  INDEX `qsata_question_student_answer_teacher_access`(`teacher_access_id`) USING BTREE,
  CONSTRAINT `qsae_question_student_answer_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qsao_question_student_answer_option` FOREIGN KEY (`option_id`) REFERENCES `question_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qsaq_question_student_answer_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qsaqt_question_student_answer_student` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qsas_question_student_answer_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `qsata_question_student_answer_teacher_access` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question_type
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NULL DEFAULT 0,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_id` int(0) NULL DEFAULT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rank_info
-- ----------------------------
DROP TABLE IF EXISTS `rank_info`;
CREATE TABLE `rank_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `rank_id` int(0) NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reference
-- ----------------------------
DROP TABLE IF EXISTS `reference`;
CREATE TABLE `reference`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reference_info
-- ----------------------------
DROP TABLE IF EXISTS `reference_info`;
CREATE TABLE `reference_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `reference_id` int(0) NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_kirill` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country_id` int(0) NULL DEFAULT 229,
  `parent_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 0,
  `postcode` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `long` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx-region-country_id`(`country_id`) USING BTREE,
  INDEX `idx-region-parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `fk-region-country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk-region-parent_id` FOREIGN KEY (`parent_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for relative_info
-- ----------------------------
DROP TABLE IF EXISTS `relative_info`;
CREATE TABLE `relative_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `r_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_type` tinyint(1) NULL DEFAULT 1 COMMENT '1-otasi 2- onasi, ....',
  `r_birthday` date NULL DEFAULT NULL,
  `r_birth_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_work_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_work_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `r_phone` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_type` int(0) NULL DEFAULT 1 COMMENT '1-student, 2-teacher, 3-xodim',
  `user_id` int(0) NOT NULL,
  `r_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `relative_info_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `relative_info_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for residence_status
-- ----------------------------
DROP TABLE IF EXISTS `residence_status`;
CREATE TABLE `residence_status`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` int(0) NULL DEFAULT 1 COMMENT 'type education building or hostel or something',
  `gender` int(0) NULL DEFAULT 1 COMMENT 'room gender male 1 female 0',
  `empty_count` int(0) NULL DEFAULT NULL COMMENT 'bosh joylar soni',
  `price` double NULL DEFAULT NULL COMMENT 'room price',
  `building_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `capacity` int(0) NOT NULL DEFAULT 30,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `br_room_building_id`(`building_id`) USING BTREE,
  CONSTRAINT `br_room_building_id` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 527 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for semestr
-- ----------------------------
DROP TABLE IF EXISTS `semestr`;
CREATE TABLE `semestr`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `course_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `type` int(0) NOT NULL DEFAULT 1 COMMENT 'kuz=1 bahorhi = 2',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sc_semestr_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `sc_semestr_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `settings_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `settings_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `settings_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `settings_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `required` tinyint(0) NOT NULL,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for settings_translation
-- ----------------------------
DROP TABLE IF EXISTS `settings_translation`;
CREATE TABLE `settings_translation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `settings_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `settings_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for site_content
-- ----------------------------
DROP TABLE IF EXISTS `site_content`;
CREATE TABLE `site_content`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` int(0) NULL DEFAULT 0,
  `settings` json NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `cacheable` tinyint(0) NOT NULL DEFAULT 0,
  `searchable` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for site_content_field
-- ----------------------------
DROP TABLE IF EXISTS `site_content_field`;
CREATE TABLE `site_content_field`  (
  `field_id` int(0) NOT NULL AUTO_INCREMENT,
  `content_id` int(0) NULL DEFAULT 0,
  `field_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for site_content_info
-- ----------------------------
DROP TABLE IF EXISTS `site_content_info`;
CREATE TABLE `site_content_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `content_id` int(0) NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `content_blocks` json NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta` json NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for site_segments
-- ----------------------------
DROP TABLE IF EXISTS `site_segments`;
CREATE TABLE `site_segments`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` int(0) NULL DEFAULT 0,
  `settings` json NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `cacheable` tinyint(0) NOT NULL DEFAULT 0,
  `searchable` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for site_segments_field
-- ----------------------------
DROP TABLE IF EXISTS `site_segments_field`;
CREATE TABLE `site_segments_field`  (
  `field_id` int(0) NOT NULL AUTO_INCREMENT,
  `segment_id` int(0) NULL DEFAULT 0,
  `field_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for site_segments_info
-- ----------------------------
DROP TABLE IF EXISTS `site_segments_info`;
CREATE TABLE `site_segments_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `segment_id` int(0) NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `content_blocks` json NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta` json NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for site_segments_relation
-- ----------------------------
DROP TABLE IF EXISTS `site_segments_relation`;
CREATE TABLE `site_segments_relation`  (
  `relation_id` int(0) NOT NULL AUTO_INCREMENT,
  `segment_id` int(0) NULL DEFAULT 0,
  `segment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_id` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for social_category
-- ----------------------------
DROP TABLE IF EXISTS `social_category`;
CREATE TABLE `social_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for speciality
-- ----------------------------
DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NULL DEFAULT 0,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for speciality_info
-- ----------------------------
DROP TABLE IF EXISTS `speciality_info`;
CREATE TABLE `speciality_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `speciality_id` int(0) NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sport_certificate
-- ----------------------------
DROP TABLE IF EXISTS `sport_certificate`;
CREATE TABLE `sport_certificate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` int(0) NULL DEFAULT NULL,
  `date` date NOT NULL,
  `year` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sport_certificate_student_id`(`student_id`) USING BTREE,
  INDEX `sport_certificate_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sport_certificate_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sport_certificate_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stat_uchun
-- ----------------------------
DROP TABLE IF EXISTS `stat_uchun`;
CREATE TABLE `stat_uchun`  (
  `id` int(0) NOT NULL,
  `st_id` int(0) NULL DEFAULT NULL,
  `exam_id` int(0) NULL DEFAULT NULL,
  `summ_all_ball` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `yak_ball` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `tutor_id` int(0) NULL DEFAULT NULL COMMENT 'tutor',
  `faculty_id` int(0) NULL DEFAULT NULL,
  `direction_id` int(0) NULL DEFAULT NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `edu_type_id` int(0) NULL DEFAULT NULL,
  `edu_form_id` int(0) NULL DEFAULT 1 COMMENT 'talim shakli id ',
  `edu_lang_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `is_contract` int(0) NULL DEFAULT NULL,
  `diplom_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `diplom_seria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `diplom_date` date NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `gender` tinyint(0) NULL DEFAULT 1 COMMENT '1-erkak 0-ayol',
  `social_category_id` int(0) NULL DEFAULT NULL COMMENT ' ijtimoiy toifa ',
  `residence_status_id` int(0) NULL DEFAULT NULL COMMENT 'category_of_cohabitant id ',
  `category_of_cohabitant_id` int(0) NULL DEFAULT NULL COMMENT 'category_of_cohabitant ',
  `student_category_id` int(0) NULL DEFAULT NULL COMMENT 'student_category id ',
  `partners_count` int(0) NULL DEFAULT NULL COMMENT 'partners_count  ',
  `live_location` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'live_location  ',
  `parent_phone` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'parent_phone  ',
  `res_person_phone` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'res_person_phone  ',
  `last_education` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'last_education  ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `us_student_user_id`(`user_id`) USING BTREE,
  INDEX `fs_student_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `ds_student_direction_id`(`direction_id`) USING BTREE,
  INDEX `cs_student_course_id`(`course_id`) USING BTREE,
  INDEX `es_student_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `es_student_edu_type_id`(`edu_type_id`) USING BTREE,
  INDEX `wk_student_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `us_student_tutor_id`(`tutor_id`) USING BTREE,
  INDEX `ssc_student_social_category_mk`(`social_category_id`) USING BTREE,
  INDEX `srs_student_residence_status_mk`(`residence_status_id`) USING BTREE,
  INDEX `scofc_student_category_of_cohabitant_mk`(`category_of_cohabitant_id`) USING BTREE,
  INDEX `ssc_student_student_category_mk`(`student_category_id`) USING BTREE,
  INDEX `studenr_id_uchun_index`(`id`) USING BTREE,
  CONSTRAINT `cs_student_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ds_student_direction_id` FOREIGN KEY (`direction_id`) REFERENCES `direction` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `es_student_edu_type_id` FOREIGN KEY (`edu_type_id`) REFERENCES `edu_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `es_student_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fs_student_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `scofc_student_category_of_cohabitant_mk` FOREIGN KEY (`category_of_cohabitant_id`) REFERENCES `category_of_cohabitant` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `srs_student_residence_status_mk` FOREIGN KEY (`residence_status_id`) REFERENCES `residence_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ssc_student_social_category_mk` FOREIGN KEY (`social_category_id`) REFERENCES `social_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ssc_student_student_category_mk` FOREIGN KEY (`student_category_id`) REFERENCES `student_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `us_student_tutor_id` FOREIGN KEY (`tutor_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `us_student_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wk_student_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11354 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_attend
-- ----------------------------
DROP TABLE IF EXISTS `student_attend`;
CREATE TABLE `student_attend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `check` int(0) NULL DEFAULT 0,
  `time_table_id` int(0) NOT NULL,
  `date` date NOT NULL,
  `attend_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `reason` tinyint(1) NULL DEFAULT 0 COMMENT '0 sababsiz 1 sababli',
  `attend_reason_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NOT NULL,
  `subject_category_id` int(0) NOT NULL,
  `time_option_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `edu_semestr_id` int(0) NOT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1 kuz 2 bohor',
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `as_mk_student_attend_attend_reason_id`(`attend_reason_id`) USING BTREE,
  INDEX `as_mk_student_attend_attend_id`(`attend_id`) USING BTREE,
  INDEX `as_mk_student_attend_student_id`(`student_id`) USING BTREE,
  INDEX `as_mk_student_attend_time_table`(`time_table_id`) USING BTREE,
  INDEX `as_mk_student_attend_subject`(`subject_id`) USING BTREE,
  INDEX `as_mk_student_attend_subject_category`(`subject_category_id`) USING BTREE,
  INDEX `as_mk_student_attend_time_option`(`time_option_id`) USING BTREE,
  INDEX `as_mk_student_attend_edu_year`(`edu_year_id`) USING BTREE,
  INDEX `as_mk_student_attend_edu_semestr`(`edu_semestr_id`) USING BTREE,
  INDEX `as_mk_student_attend_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `as_mk_student_attend_edu_plan_id`(`edu_plan_id`) USING BTREE,
  CONSTRAINT `as_mk_student_attend_attend_id` FOREIGN KEY (`attend_id`) REFERENCES `attend` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_attend_reason_id` FOREIGN KEY (`attend_reason_id`) REFERENCES `attend_reason` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_edu_semestr` FOREIGN KEY (`edu_semestr_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_edu_year` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_subject_category` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_time_option` FOREIGN KEY (`time_option_id`) REFERENCES `time_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `as_mk_student_attend_time_table` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 558390 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_category
-- ----------------------------
DROP TABLE IF EXISTS `student_category`;
CREATE TABLE `student_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_club
-- ----------------------------
DROP TABLE IF EXISTS `student_club`;
CREATE TABLE `student_club`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `is_leader` tinyint(0) NULL DEFAULT 0,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `club_category_id` int(0) NULL DEFAULT NULL,
  `club_time_id` int(0) NOT NULL,
  `club_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ctcc_student_club_club_category_id`(`club_category_id`) USING BTREE,
  INDEX `ctct_student_club_club_time_id`(`club_time_id`) USING BTREE,
  INDEX `ctct_student_club_club_id`(`club_id`) USING BTREE,
  INDEX `cts_student_club_student_id`(`student_id`) USING BTREE,
  INDEX `ctf_student_club_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `ctep_student_club_edu_plan_id`(`edu_plan_id`) USING BTREE,
  CONSTRAINT `ctcc_student_club_club_category_id` FOREIGN KEY (`club_category_id`) REFERENCES `club_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ctct_student_club_club_id` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ctct_student_club_club_time_id` FOREIGN KEY (`club_time_id`) REFERENCES `club_time` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ctep_student_club_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ctf_student_club_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cts_student_club_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2556 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_gpa_old
-- ----------------------------
DROP TABLE IF EXISTS `student_gpa_old`;
CREATE TABLE `student_gpa_old`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `course` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `semestr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `edu_lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username_distant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `srs_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `all_ball` double NULL DEFAULT NULL,
  `alphabet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mk_student_gpa_old_student_id`(`student_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 208449 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_mark
-- ----------------------------
DROP TABLE IF EXISTS `student_mark`;
CREATE TABLE `student_mark`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `edu_semestr_id` int(0) NOT NULL,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `exam_control_student_ball` double NULL DEFAULT NULL,
  `exam_control_student_ball2` double NULL DEFAULT NULL,
  `exam_student_ball` double NULL DEFAULT NULL,
  `ball` double NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `data` json NULL,
  `attempt` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NULL DEFAULT 0,
  `updated_by` int(0) NULL DEFAULT 0,
  `edu_lang_id` int(0) NULL DEFAULT NULL,
  `alphabet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` int(0) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ms_s_student_mark_student`(`student_id`) USING BTREE,
  INDEX `ms_s_student_mark_subject`(`subject_id`) USING BTREE,
  INDEX `ms_e_student_mark_edu_semestr`(`edu_semestr_id`) USING BTREE,
  INDEX `ms_e_student_mark_edu_semestr_subject`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `ms_c_student_mark_course`(`course_id`) USING BTREE,
  INDEX `ms_s_student_mark_semestr`(`semestr_id`) USING BTREE,
  INDEX `ms_e_student_mark_edu_year`(`edu_year_id`) USING BTREE,
  INDEX `ms_f_student_mark_faculty`(`faculty_id`) USING BTREE,
  INDEX `ms_e_student_mark_edu_plan`(`edu_plan_id`) USING BTREE,
  CONSTRAINT `ms_c_student_mark_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_e_student_mark_edu_plan` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_e_student_mark_edu_semestr` FOREIGN KEY (`edu_semestr_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_e_student_mark_edu_semestr_subject` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_e_student_mark_edu_year` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_f_student_mark_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_s_student_mark_semestr` FOREIGN KEY (`semestr_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_s_student_mark_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ms_s_student_mark_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 94040 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_order
-- ----------------------------
DROP TABLE IF EXISTS `student_order`;
CREATE TABLE `student_order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `order_type_id` int(0) NOT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sto_student_order_student_id`(`student_id`) USING BTREE,
  INDEX `sto_student_order_order_type_id`(`order_type_id`) USING BTREE,
  CONSTRAINT `sto_student_order_order_type_id` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sto_student_order_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_subject_restrict
-- ----------------------------
DROP TABLE IF EXISTS `student_subject_restrict`;
CREATE TABLE `student_subject_restrict`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NULL DEFAULT NULL,
  `edu_semestr_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mark_student_subject_restrict___student_id`(`student_id`) USING BTREE,
  INDEX `mark_student_subject_restrict___edu_semestr_subject_id`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `mark_student_subject_restrict___subject_id`(`subject_id`) USING BTREE,
  INDEX `mark_student_subject_restrict___semestr_id`(`semestr_id`) USING BTREE,
  INDEX `mark_student_subject_restrict___edu_semestr_id`(`edu_semestr_id`) USING BTREE,
  INDEX `mark_student_subject_restrict___edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `mark_student_subject_restrict___faculty_id`(`faculty_id`) USING BTREE,
  INDEX `mark_student_subject_restrict___edu_year_id`(`edu_year_id`) USING BTREE,
  CONSTRAINT `mark_student_subject_restrict___edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mark_student_subject_restrict___edu_semestr_id` FOREIGN KEY (`edu_semestr_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mark_student_subject_restrict___edu_semestr_subject_id` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mark_student_subject_restrict___edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mark_student_subject_restrict___faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mark_student_subject_restrict___semestr_id` FOREIGN KEY (`semestr_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mark_student_subject_restrict___student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mark_student_subject_restrict___subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3887 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_subject_selection
-- ----------------------------
DROP TABLE IF EXISTS `student_subject_selection`;
CREATE TABLE `student_subject_selection`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_subject_selection_user_id`(`user_id`) USING BTREE,
  INDEX `student_subject_selection_edu_semestr_subject_id`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `student_subject_selection_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `student_subject_selection_subject_id`(`subject_id`) USING BTREE,
  INDEX `student_subject_selection_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `student_subject_selection_faculty_id`(`faculty_id`) USING BTREE,
  CONSTRAINT `student_subject_selection_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_edu_semester_id` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_edu_semestr_subject_id` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12673 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_subject_selection_16
-- ----------------------------
DROP TABLE IF EXISTS `student_subject_selection_16`;
CREATE TABLE `student_subject_selection_16`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_subject_selection_user_id`(`user_id`) USING BTREE,
  INDEX `student_subject_selection_edu_semestr_subject_id`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `student_subject_selection_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `student_subject_selection_subject_id`(`subject_id`) USING BTREE,
  INDEX `student_subject_selection_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `student_subject_selection_faculty_id`(`faculty_id`) USING BTREE,
  CONSTRAINT `student_subject_selection_16_ibfk_1` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_16_ibfk_2` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_16_ibfk_3` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_16_ibfk_4` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_16_ibfk_5` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_16_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6081 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_subject_selection_2023_08
-- ----------------------------
DROP TABLE IF EXISTS `student_subject_selection_2023_08`;
CREATE TABLE `student_subject_selection_2023_08`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_semestr_subject_id` int(0) NOT NULL,
  `student_id` int(0) NOT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_subject_selection_user_id`(`user_id`) USING BTREE,
  INDEX `student_subject_selection_edu_semestr_subject_id`(`edu_semestr_subject_id`) USING BTREE,
  INDEX `student_subject_selection_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `student_subject_selection_subject_id`(`subject_id`) USING BTREE,
  INDEX `student_subject_selection_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `student_subject_selection_faculty_id`(`faculty_id`) USING BTREE,
  CONSTRAINT `student_subject_selection_2023_08_ibfk_1` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_2023_08_ibfk_2` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_2023_08_ibfk_3` FOREIGN KEY (`edu_semestr_subject_id`) REFERENCES `edu_semestr_subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_2023_08_ibfk_4` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_2023_08_ibfk_5` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_subject_selection_2023_08_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12075 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_time_option
-- ----------------------------
DROP TABLE IF EXISTS `student_time_option`;
CREATE TABLE `student_time_option`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `time_option_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `language_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `order` int(0) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_time_option_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `student_time_option_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `student_time_option_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `student_time_option_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `student_time_option_language_id`(`language_id`) USING BTREE,
  INDEX `student_time_option_student_id`(`student_id`) USING BTREE,
  INDEX `student_time_option_user_id`(`user_id`) USING BTREE,
  INDEX `student_time_option_time_option_id`(`time_option_id`) USING BTREE,
  CONSTRAINT `student_time_option_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_edu_semester_id` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_time_option_id` FOREIGN KEY (`time_option_id`) REFERENCES `time_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32629 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_time_option_16
-- ----------------------------
DROP TABLE IF EXISTS `student_time_option_16`;
CREATE TABLE `student_time_option_16`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `time_option_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `language_id` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `order` int(0) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_time_option_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `student_time_option_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `student_time_option_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `student_time_option_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `student_time_option_language_id`(`language_id`) USING BTREE,
  INDEX `student_time_option_student_id`(`student_id`) USING BTREE,
  INDEX `student_time_option_user_id`(`user_id`) USING BTREE,
  INDEX `student_time_option_time_option_id`(`time_option_id`) USING BTREE,
  CONSTRAINT `student_time_option_16_ibfk_1` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_16_ibfk_2` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_16_ibfk_3` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_16_ibfk_4` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_16_ibfk_5` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_16_ibfk_6` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_16_ibfk_7` FOREIGN KEY (`time_option_id`) REFERENCES `time_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_option_16_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16081 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_time_table
-- ----------------------------
DROP TABLE IF EXISTS `student_time_table`;
CREATE TABLE `student_time_table`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `time_table_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `student_time_option_id` int(0) NULL DEFAULT NULL,
  `time_option_id` int(0) NULL DEFAULT NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `teacher_user_id` int(0) NULL DEFAULT NULL,
  `time_table_lecture_id` int(0) NULL DEFAULT NULL,
  `time_table_parent_id` int(0) NULL DEFAULT NULL,
  `subject_category_id` int(0) NULL DEFAULT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `week_id` int(0) NULL DEFAULT NULL,
  `para_id` int(0) NULL DEFAULT NULL,
  `room_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `semester_id` int(0) NULL DEFAULT NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  `language_id` int(0) NULL DEFAULT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pe111_student_time_table_student_id`(`student_id`) USING BTREE,
  INDEX `ce111_student_time_table_time_table_id`(`time_table_id`) USING BTREE,
  CONSTRAINT `student_time_table_ibfk_1` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_table_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 647065 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student_time_table_16
-- ----------------------------
DROP TABLE IF EXISTS `student_time_table_16`;
CREATE TABLE `student_time_table_16`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `student_id` int(0) NOT NULL,
  `time_table_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `student_time_option_id` int(0) NULL DEFAULT NULL,
  `time_option_id` int(0) NULL DEFAULT NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `teacher_user_id` int(0) NULL DEFAULT NULL,
  `time_table_lecture_id` int(0) NULL DEFAULT NULL,
  `time_table_parent_id` int(0) NULL DEFAULT NULL,
  `subject_category_id` int(0) NULL DEFAULT NULL,
  `edu_semester_id` int(0) NULL DEFAULT NULL,
  `week_id` int(0) NULL DEFAULT NULL,
  `para_id` int(0) NULL DEFAULT NULL,
  `room_id` int(0) NULL DEFAULT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `edu_year_id` int(0) NULL DEFAULT NULL,
  `semester_id` int(0) NULL DEFAULT NULL,
  `course_id` int(0) NULL DEFAULT NULL,
  `language_id` int(0) NULL DEFAULT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pe111_student_time_table_student_id`(`student_id`) USING BTREE,
  INDEX `ce111_student_time_table_time_table_id`(`time_table_id`) USING BTREE,
  CONSTRAINT `student_time_table_16_ibfk_1` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_time_table_16_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 350894 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sub_question
-- ----------------------------
DROP TABLE IF EXISTS `sub_question`;
CREATE TABLE `sub_question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `question` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tirkama savol matni yozilati',
  `question_id` int(0) NOT NULL COMMENT 'Tirkama savol ushbu salovga choshimcha  yozilati',
  `percent` int(0) NOT NULL,
  `ball` double NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `old_q_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sqq_sub_question_question_mk`(`question_id`) USING BTREE,
  CONSTRAINT `sqq_sub_question_question_mk` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 104085 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `kafedra_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `semestr_id` int(0) NULL DEFAULT NULL COMMENT 'fanga smester',
  `parent_id` int(0) NULL DEFAULT NULL COMMENT 'fanga parent',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ks_subject_kafedra_id`(`kafedra_id`) USING BTREE,
  INDEX `ss_subject_smester_id_mk`(`semestr_id`) USING BTREE,
  CONSTRAINT `ks_subject_kafedra_id` FOREIGN KEY (`kafedra_id`) REFERENCES `kafedra` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ss_subject_smester_id_mk` FOREIGN KEY (`semestr_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 583 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_access
-- ----------------------------
DROP TABLE IF EXISTS `subject_access`;
CREATE TABLE `subject_access`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `subject_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sas_subject_access_subject_id_bm`(`subject_id`) USING BTREE,
  INDEX `sau_user_subject_id_mb`(`user_id`) USING BTREE,
  CONSTRAINT `sas_subject_access_subject_id_bm` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sau_user_subject_id_mb` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_category
-- ----------------------------
DROP TABLE IF EXISTS `subject_category`;
CREATE TABLE `subject_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` tinyint(0) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_content
-- ----------------------------
DROP TABLE IF EXISTS `subject_content`;
CREATE TABLE `subject_content`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `subject_id` int(0) NULL DEFAULT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `type` int(0) NOT NULL,
  `subject_topic_id` int(0) NOT NULL,
  `language_id` int(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'file nomini saqlaymiz',
  `user_id` int(0) NULL DEFAULT NULL COMMENT 'user id kimga qarashliligi',
  `archived` int(0) NULL DEFAULT 0,
  `archived_old` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `scst_subject_content_subject_topic_mk`(`subject_topic_id`) USING BTREE,
  INDEX `scts_subject_content_teacher_access_id`(`teacher_access_id`) USING BTREE,
  CONSTRAINT `scst_subject_content_subject_topic_mk` FOREIGN KEY (`subject_topic_id`) REFERENCES `subject_topic` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `scts_subject_content_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 221183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_content_mark
-- ----------------------------
DROP TABLE IF EXISTS `subject_content_mark`;
CREATE TABLE `subject_content_mark`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ball` double NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `subject_topic_id` int(0) NOT NULL,
  `subject_id` int(0) NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subject_content_mark_user_id`(`user_id`) USING BTREE,
  INDEX `subject_content_mark_teacher_access_id`(`teacher_access_id`) USING BTREE,
  INDEX `subject_content_mark_subject_topic_id`(`subject_topic_id`) USING BTREE,
  INDEX `subject_content_mark_subject_id`(`subject_id`) USING BTREE,
  CONSTRAINT `subject_content_mark_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `subject_content_mark_subject_topic_id` FOREIGN KEY (`subject_topic_id`) REFERENCES `subject_topic` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `subject_content_mark_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `subject_content_mark_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16413 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_sillabus
-- ----------------------------
DROP TABLE IF EXISTS `subject_sillabus`;
CREATE TABLE `subject_sillabus`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `auditory_time` double NULL DEFAULT NULL,
  `subject_id` int(0) NOT NULL,
  `subject_type_id` int(0) NOT NULL,
  `edu_semestr_exams_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `edu_semestr_subject_category_times` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `all_ball_yuklama` double NULL DEFAULT NULL,
  `max_ball` double NULL DEFAULT NULL,
  `credit` double NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `topic_count` int(0) NULL DEFAULT 0 COMMENT 'mavzu soni ',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sss_subject_sillabus_subject`(`subject_id`) USING BTREE,
  INDEX `sss_subject_sillabus_subject_type`(`subject_type_id`) USING BTREE,
  CONSTRAINT `sss_subject_sillabus_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sss_subject_sillabus_subject_type` FOREIGN KEY (`subject_type_id`) REFERENCES `subject_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 365 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_topic
-- ----------------------------
DROP TABLE IF EXISTS `subject_topic`;
CREATE TABLE `subject_topic`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hours` int(0) NULL DEFAULT 0,
  `subject_id` int(0) NOT NULL,
  `lang_id` int(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `subject_category_id` int(0) NULL DEFAULT NULL COMMENT 'fan turlari boyicha topic uchun',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sts_subject_topic_subject_id_mk`(`subject_id`) USING BTREE,
  INDEX `stl_subject_topic_lang_id_mk`(`lang_id`) USING BTREE,
  INDEX `stsc_subject_topic_subject_category_id`(`subject_category_id`) USING BTREE,
  INDEX `scts_subject_topic_teacher_access_id`(`teacher_access_id`) USING BTREE,
  CONSTRAINT `scts_subject_topic_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stl_subject_topic_lang_id_mk` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sts_subject_topic_subject_id_mk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stsc_subject_topic_subject_category_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8836 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_topic_info
-- ----------------------------
DROP TABLE IF EXISTS `subject_topic_info`;
CREATE TABLE `subject_topic_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `subject_topic_id` int(0) NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_topic_reference
-- ----------------------------
DROP TABLE IF EXISTS `subject_topic_reference`;
CREATE TABLE `subject_topic_reference`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `subject_id` int(0) NOT NULL,
  `subject_topic_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  `teacher_access_id` int(0) NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `start_page` int(0) NULL DEFAULT NULL,
  `end_page` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `str_subject_topic_reference_subject_id`(`subject_id`) USING BTREE,
  INDEX `str_subject_topic_reference_subject_topic_id`(`subject_topic_id`) USING BTREE,
  INDEX `str_subject_topic_reference_user_id`(`user_id`) USING BTREE,
  INDEX `str_subject_topic_reference_teacher_access_id`(`teacher_access_id`) USING BTREE,
  CONSTRAINT `str_subject_topic_reference_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `str_subject_topic_reference_subject_topic_id` FOREIGN KEY (`subject_topic_id`) REFERENCES `subject_topic` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `str_subject_topic_reference_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `str_subject_topic_reference_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 150976 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject_type
-- ----------------------------
DROP TABLE IF EXISTS `subject_type`;
CREATE TABLE `subject_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for survey_answer
-- ----------------------------
DROP TABLE IF EXISTS `survey_answer`;
CREATE TABLE `survey_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `subject_id` int(0) NOT NULL,
  `survey_question_id` int(0) NOT NULL,
  `ball` int(0) NOT NULL,
  `exam_id` int(0) NULL DEFAULT NULL,
  `edu_semestr_subject_id` int(0) NULL DEFAULT NULL,
  `student_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sasq_survey_answer_survey_question`(`survey_question_id`) USING BTREE,
  INDEX `sas_survey_answer_subject`(`subject_id`) USING BTREE,
  INDEX `sae_survey_answer_exam`(`exam_id`) USING BTREE,
  CONSTRAINT `sae_survey_answer_exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sas_survey_answer_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sasq_survey_answer_survey_question` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 376822 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for survey_question
-- ----------------------------
DROP TABLE IF EXISTS `survey_question`;
CREATE TABLE `survey_question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `min` int(0) NOT NULL DEFAULT 0,
  `max` int(0) NOT NULL DEFAULT 10,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1-ball kiriteykon, 2-yozeykon',
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for survey_question_info
-- ----------------------------
DROP TABLE IF EXISTS `survey_question_info`;
CREATE TABLE `survey_question_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `survey_question_id` int(0) NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `question` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sqisq_survey_question_info_survey_question`(`survey_question_id`) USING BTREE,
  CONSTRAINT `sqisq_survey_question_info_survey_question` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tabel_store
-- ----------------------------
DROP TABLE IF EXISTS `tabel_store`;
CREATE TABLE `tabel_store`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `year` int(0) NOT NULL,
  `month` int(0) NOT NULL,
  `user_access_type_id` int(0) NOT NULL,
  `table_id` int(0) NOT NULL,
  `data` json NULL COMMENT 'asosiy data json qilib yoziladi',
  `is_checked` tinyint(1) NULL DEFAULT 0,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1-birinchi yarim oylik, 2-ikkinchi yarim oylik',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `mem` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tsuat_tabel_store_user_access_type_id`(`user_access_type_id`) USING BTREE,
  CONSTRAINT `tsuat_tabel_store_user_access_type_id` FOREIGN KEY (`user_access_type_id`) REFERENCES `user_access_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher_access
-- ----------------------------
DROP TABLE IF EXISTS `teacher_access`;
CREATE TABLE `teacher_access`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `language_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_lecture` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ut_teacher_access_user_id`(`user_id`) USING BTREE,
  INDEX `st_teacher_access_subject_id`(`subject_id`) USING BTREE,
  INDEX `lt_teacher_access_language_id`(`language_id`) USING BTREE,
  CONSTRAINT `lt_teacher_access_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `st_teacher_access_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ut_teacher_access_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7090 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher_checking_type
-- ----------------------------
DROP TABLE IF EXISTS `teacher_checking_type`;
CREATE TABLE `teacher_checking_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `edu_year_id` int(0) NOT NULL,
  `semestr_id` int(0) NOT NULL,
  `type` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tchtey_teacher_checking_type_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `tchtey_teacher_checking_type_semestr_id`(`semestr_id`) USING BTREE,
  CONSTRAINT `tchtey_teacher_checking_type_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tchtey_teacher_checking_type_semestr_id` FOREIGN KEY (`semestr_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher_plan
-- ----------------------------
DROP TABLE IF EXISTS `teacher_plan`;
CREATE TABLE `teacher_plan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `semestr_type` tinyint(1) NULL DEFAULT 1 COMMENT '1 kuz 2 bahor',
  `course_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NULL DEFAULT NULL,
  `student_count` int(0) NULL DEFAULT NULL COMMENT 'Talaba soni',
  `student_count_plan` int(0) NULL DEFAULT NULL COMMENT 'Talaba soni reja',
  `lecture` int(0) NULL DEFAULT NULL COMMENT 'ma\'ruza mashg\'uloti',
  `lecture_plan` int(0) NULL DEFAULT NULL COMMENT 'ma\'ruza mashg\'uloti reja',
  `seminar` int(0) NULL DEFAULT NULL COMMENT 'Seminar mashg\'uloti',
  `seminar_plan` int(0) NULL DEFAULT NULL COMMENT 'Seminar mashg\'uloti reja',
  `practical` int(0) NULL DEFAULT NULL COMMENT 'Amaliy mashg\'ulot',
  `practical_plan` int(0) NULL DEFAULT NULL COMMENT 'Amaliy mashg\'ulot reja',
  `labarothoria` int(0) NULL DEFAULT NULL COMMENT 'Labarotoriya mashg\'uloti',
  `labarothoria_plan` int(0) NULL DEFAULT NULL COMMENT 'Labarotoriya mashg\'uloti reja',
  `advice` int(0) NULL DEFAULT NULL COMMENT 'Maslahatlar o\'tkazish',
  `advice_plan` int(0) NULL DEFAULT NULL COMMENT 'Maslahatlar o\'tkazish reja',
  `prepare` int(0) NULL DEFAULT NULL COMMENT 'Ma\'ruza va seminar (amaliy) mashg\'ulotlarga tayyorgarlik ko\'rish',
  `prepare_plan` int(0) NULL DEFAULT NULL COMMENT 'Ma\'ruza va seminar (amaliy) mashg\'ulotlarga tayyorgarlik ko\'rish reja',
  `checking` int(0) NULL DEFAULT NULL COMMENT 'Oraliq va yakuniy nazoratlarni tekshirish',
  `checking_plan` int(0) NULL DEFAULT NULL COMMENT 'Oraliq va yakuniy nazoratlarni tekshirish reja',
  `checking_appeal` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat turi bo\'yicha qo\'yilgan balldan norozi bo\'lgan talabaning apellyasiya shikoyati ko\'rib chiqish bo\'yicha apellyasiya komissiyasi a\'zosi sifatida ishtirok etish',
  `checking_appeal_plan` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat turi bo\'yicha qo\'yilgan balldan norozi bo\'lgan talabaning apellyasiya shikoyati ko\'rib chiqish bo\'yicha apellyasiya komissiyasi a\'zosi sifatida ishtirok etish reja',
  `lead_practice` int(0) NULL DEFAULT NULL COMMENT 'Bakalavriat talabalari amaliyotiga rahbarlik qilish va b.',
  `lead_practice_plan` int(0) NULL DEFAULT NULL COMMENT 'Bakalavriat talabalari amaliyotiga rahbarlik qilish va b. reja',
  `lead_graduation_work` int(0) NULL DEFAULT NULL COMMENT 'Bakalavriat talabalarining bitiruv malakaviy ishiga rahbarlik qilish, xulosalar yozish',
  `lead_graduation_work_plan` int(0) NULL DEFAULT NULL COMMENT 'Bakalavriat talabalarining bitiruv malakaviy ishiga rahbarlik qilish, xulosalar yozish reja',
  `dissertation_advicer` int(0) NULL DEFAULT NULL COMMENT 'Magistratura talabasining ilmiy tadqiqot ishi va magistrlik dissertasiyasiga ilmiy maslahatchilik qilish',
  `dissertation_advicer_plan` int(0) NULL DEFAULT NULL COMMENT 'Magistratura talabasining ilmiy tadqiqot ishi va magistrlik dissertasiyasiga ilmiy maslahatchilik qilish reja',
  `doctoral_consultation` int(0) NULL DEFAULT NULL COMMENT 'TDYU doktorantiga ilmiy maslahatchilik qilish',
  `doctoral_consultation_plan` int(0) NULL DEFAULT NULL COMMENT 'TDYU doktorantiga ilmiy maslahatchilik qilish reja',
  `supervisor_exam` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat yozma imtihonlarida nazoratchi sifatida ishtirok etish',
  `supervisor_exam_plan` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat yozma imtihonlarida nazoratchi sifatida ishtirok etish reja',
  `kazus_input` int(0) NULL DEFAULT NULL COMMENT 'Talabalar bilimini aniqlash bo\'yicha nazorat turlari uchun mantiqiy savollar, muammoli masalalar (kazuslar) ishlab chiqish',
  `kazus_input_plan` int(0) NULL DEFAULT NULL COMMENT 'Talabalar bilimini aniqlash bo\'yicha nazorat turlari uchun mantiqiy savollar, muammoli masalalar (kazuslar) ishlab chiqish reja',
  `legal_clinic` int(0) NULL DEFAULT NULL COMMENT 'Toshkent davlat yuridik universiteti yuridik klinikasi faoliyatida ishtirok etish',
  `legal_clinic_plan` int(0) NULL DEFAULT NULL COMMENT 'Toshkent davlat yuridik universiteti yuridik klinikasi faoliyatida ishtirok etish reja',
  `final_attestation` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy davlat attestasiyasini o\'tkazish',
  `final_attestation_plan` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy davlat attestasiyasini o\'tkazish reja',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher_subject_content
-- ----------------------------
DROP TABLE IF EXISTS `teacher_subject_content`;
CREATE TABLE `teacher_subject_content`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `langs` json NULL,
  `lang_id` int(0) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher_subject_content__user_id`(`user_id`) USING BTREE,
  INDEX `teacher_subject_content__subject_id`(`subject_id`) USING BTREE,
  INDEX `teacher_subject_content__lang_id`(`lang_id`) USING BTREE,
  CONSTRAINT `teacher_subject_content__lang_id` FOREIGN KEY (`lang_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teacher_subject_content__subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teacher_subject_content__user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 596 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher_work_plan
-- ----------------------------
DROP TABLE IF EXISTS `teacher_work_plan`;
CREATE TABLE `teacher_work_plan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `faculty_ids` json NULL,
  `semestr_type` tinyint(1) NULL DEFAULT 1 COMMENT '1 kuz 2 bahor',
  `course_id` int(0) NULL DEFAULT NULL,
  `semestr_id` int(0) NULL DEFAULT NULL,
  `student_count` int(0) NULL DEFAULT NULL COMMENT 'Talaba soni',
  `student_count_plan` int(0) NULL DEFAULT NULL COMMENT 'Talaba soni reja',
  `lecture` int(0) NULL DEFAULT NULL COMMENT 'ma\'ruza mashg\'uloti',
  `lecture_plan` int(0) NULL DEFAULT NULL COMMENT 'ma\'ruza mashg\'uloti reja',
  `seminar` int(0) NULL DEFAULT NULL COMMENT 'Seminar mashg\'uloti',
  `seminar_plan` int(0) NULL DEFAULT NULL COMMENT 'Seminar mashg\'uloti reja',
  `practical` int(0) NULL DEFAULT NULL COMMENT 'Amaliy mashg\'ulot',
  `practical_plan` int(0) NULL DEFAULT NULL COMMENT 'Amaliy mashg\'ulot reja',
  `labarothoria` int(0) NULL DEFAULT NULL COMMENT 'Labarotoriya mashg\'uloti',
  `labarothoria_plan` int(0) NULL DEFAULT NULL COMMENT 'Labarotoriya mashg\'uloti reja',
  `advice` double NULL DEFAULT NULL COMMENT 'Maslahatlar o\'tkazish',
  `advice_plan` double NULL DEFAULT NULL COMMENT 'Maslahatlar o\'tkazish reja',
  `prepare` double NULL DEFAULT NULL COMMENT 'Ma\'ruza va seminar (amaliy) mashg\'ulotlarga tayyorgarlik ko\'rish',
  `prepare_plan` double NULL DEFAULT NULL COMMENT 'Ma\'ruza va seminar (amaliy) mashg\'ulotlarga tayyorgarlik ko\'rish reja',
  `checking` int(0) NULL DEFAULT NULL COMMENT 'Oraliq va yakuniy nazoratlarni tekshirish',
  `checking_plan` int(0) NULL DEFAULT NULL COMMENT 'Oraliq va yakuniy nazoratlarni tekshirish reja',
  `checking_appeal` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat turi bo\'yicha qo\'yilgan balldan norozi bo\'lgan talabaning apellyasiya shikoyati ko\'rib chiqish bo\'yicha apellyasiya komissiyasi a\'zosi sifatida ishtirok etish',
  `checking_appeal_plan` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat turi bo\'yicha qo\'yilgan balldan norozi bo\'lgan talabaning apellyasiya shikoyati ko\'rib chiqish bo\'yicha apellyasiya komissiyasi a\'zosi sifatida ishtirok etish reja',
  `lead_practice` double NULL DEFAULT NULL COMMENT 'Bakalavriat talabalari amaliyotiga rahbarlik qilish va b.',
  `lead_practice_plan` double NULL DEFAULT NULL COMMENT 'Bakalavriat talabalari amaliyotiga rahbarlik qilish va b. reja',
  `lead_graduation_work` int(0) NULL DEFAULT NULL COMMENT 'Bakalavriat talabalarining bitiruv malakaviy ishiga rahbarlik qilish, xulosalar yozish',
  `lead_graduation_work_plan` int(0) NULL DEFAULT NULL COMMENT 'Bakalavriat talabalarining bitiruv malakaviy ishiga rahbarlik qilish, xulosalar yozish reja',
  `dissertation_advicer` double NULL DEFAULT NULL COMMENT 'Magistratura talabasining ilmiy tadqiqot ishi va magistrlik dissertasiyasiga ilmiy maslahatchilik qilish',
  `dissertation_advicer_plan` double NULL DEFAULT NULL COMMENT 'Magistratura talabasining ilmiy tadqiqot ishi va magistrlik dissertasiyasiga ilmiy maslahatchilik qilish reja',
  `doctoral_consultation` int(0) NULL DEFAULT NULL COMMENT 'TDYU doktorantiga ilmiy maslahatchilik qilish',
  `doctoral_consultation_plan` int(0) NULL DEFAULT NULL COMMENT 'TDYU doktorantiga ilmiy maslahatchilik qilish reja',
  `supervisor_exam` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat yozma imtihonlarida nazoratchi sifatida ishtirok etish',
  `supervisor_exam_plan` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy nazorat yozma imtihonlarida nazoratchi sifatida ishtirok etish reja',
  `kazus_input` int(0) NULL DEFAULT NULL COMMENT 'Talabalar bilimini aniqlash bo\'yicha nazorat turlari uchun mantiqiy savollar, muammoli masalalar (kazuslar) ishlab chiqish',
  `kazus_input_plan` int(0) NULL DEFAULT NULL COMMENT 'Talabalar bilimini aniqlash bo\'yicha nazorat turlari uchun mantiqiy savollar, muammoli masalalar (kazuslar) ishlab chiqish reja',
  `legal_clinic` int(0) NULL DEFAULT NULL COMMENT 'Toshkent davlat yuridik universiteti yuridik klinikasi faoliyatida ishtirok etish',
  `legal_clinic_plan` int(0) NULL DEFAULT NULL COMMENT 'Toshkent davlat yuridik universiteti yuridik klinikasi faoliyatida ishtirok etish reja',
  `final_attestation` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy davlat attestasiyasini o\'tkazish',
  `final_attestation_plan` int(0) NULL DEFAULT NULL COMMENT 'Yakuniy davlat attestasiyasini o\'tkazish reja',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `time_option_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tpu_teacher_work_plan_user`(`user_id`) USING BTREE,
  INDEX `tps_teacher_work_plan_subject`(`subject_id`) USING BTREE,
  INDEX `tps_teacher_work_plan_edu_year`(`edu_year_id`) USING BTREE,
  INDEX `tps_teacher_work_plan_course`(`course_id`) USING BTREE,
  INDEX `tps_teacher_work_plan_semestr`(`semestr_id`) USING BTREE,
  CONSTRAINT `tps_teacher_work_plan_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tps_teacher_work_plan_edu_year` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tps_teacher_work_plan_semestr` FOREIGN KEY (`semestr_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tps_teacher_work_plan_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tpu_teacher_work_plan_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1389 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for testfile
-- ----------------------------
DROP TABLE IF EXISTS `testfile`;
CREATE TABLE `testfile`  (
  `exam_student_id` int(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for time_option
-- ----------------------------
DROP TABLE IF EXISTS `time_option`;
CREATE TABLE `time_option`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `key` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `faculty_id` int(0) NOT NULL,
  `edu_plan_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `edu_semester_id` int(0) NOT NULL,
  `language_id` int(0) NOT NULL,
  `capacity` int(0) NOT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  `order` int(0) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `archived` int(0) NULL DEFAULT 0,
  `selected_count` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `time_option_faculty_id`(`faculty_id`) USING BTREE,
  INDEX `time_option_edu_plan_id`(`edu_plan_id`) USING BTREE,
  INDEX `time_option_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `time_option_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `time_option_language_id`(`language_id`) USING BTREE,
  CONSTRAINT `time_option_edu_plan_id` FOREIGN KEY (`edu_plan_id`) REFERENCES `edu_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `time_option_edu_semester_id` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `time_option_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `time_option_faculty_id` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `time_option_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 760 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for time_table
-- ----------------------------
DROP TABLE IF EXISTS `time_table`;
CREATE TABLE `time_table`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `parent_id` int(0) NULL DEFAULT NULL,
  `lecture_id` int(0) NULL DEFAULT NULL,
  `teacher_access_id` int(0) NOT NULL,
  `room_id` int(0) NOT NULL,
  `para_id` int(0) NOT NULL,
  `course_id` int(0) NOT NULL,
  `semester_id` int(0) NOT NULL,
  `edu_year_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `language_id` int(0) NOT NULL,
  `week_id` int(0) NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `time_option_id` int(0) NULL DEFAULT NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  `edu_plan_id` int(0) NULL DEFAULT NULL,
  `teacher_user_id` int(0) NULL DEFAULT NULL,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `edu_semester_id` int(0) NOT NULL,
  `edu_semestr_subject_id` int(0) NULL DEFAULT NULL,
  `subject_category_id` int(0) NOT NULL,
  `archived` int(0) NULL DEFAULT 0,
  `faculty_id` int(0) NULL DEFAULT NULL,
  `status_n` int(0) NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tt_time_table_teacher_access_id`(`teacher_access_id`) USING BTREE,
  INDEX `rt_time_table_room_id`(`room_id`) USING BTREE,
  INDEX `pt_time_table_para_id`(`para_id`) USING BTREE,
  INDEX `ct_time_table_course_id`(`course_id`) USING BTREE,
  INDEX `st_time_table_semestr_id`(`semester_id`) USING BTREE,
  INDEX `et_time_table_edu_year_id`(`edu_year_id`) USING BTREE,
  INDEX `st_time_table_edu_subject_id`(`subject_id`) USING BTREE,
  INDEX `lt_time_table_edu_language_id`(`language_id`) USING BTREE,
  INDEX `wk_time_table_week_id`(`week_id`) USING BTREE,
  INDEX `wk_time_table_edu_semester_id`(`edu_semester_id`) USING BTREE,
  INDEX `wk_time_table_subject_category_id`(`subject_category_id`) USING BTREE,
  INDEX `tt_time_table_time_option`(`time_option_id`) USING BTREE,
  CONSTRAINT `ct_time_table_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `et_time_table_edu_year_id` FOREIGN KEY (`edu_year_id`) REFERENCES `edu_year` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lt_time_table_edu_language_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pt_time_table_para_id` FOREIGN KEY (`para_id`) REFERENCES `para` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rt_time_table_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `st_time_table_edu_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `st_time_table_semestr_id` FOREIGN KEY (`semester_id`) REFERENCES `semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tt_time_table_teacher_access_id` FOREIGN KEY (`teacher_access_id`) REFERENCES `teacher_access` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tt_time_table_time_option` FOREIGN KEY (`time_option_id`) REFERENCES `time_option` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wk_time_table_edu_semester_id` FOREIGN KEY (`edu_semester_id`) REFERENCES `edu_semestr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wk_time_table_subject_category_id` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `wk_time_table_week_id` FOREIGN KEY (`week_id`) REFERENCES `week` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22796 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tourniquet_absent
-- ----------------------------
DROP TABLE IF EXISTS `tourniquet_absent`;
CREATE TABLE `tourniquet_absent`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `passport_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` date NULL DEFAULT NULL,
  `date_time` datetime(0) NULL DEFAULT NULL,
  `date_out` time(0) NOT NULL,
  `date_in` time(0) NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx-tourniquet_absent-passport_pin`(`passport_pin`) USING BTREE,
  INDEX `excel_atendens_profile_id`(`user_id`) USING BTREE,
  CONSTRAINT `excel_atendens_profile_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for translate
-- ----------------------------
DROP TABLE IF EXISTS `translate`;
CREATE TABLE `translate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `model_id` int(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `language` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `path_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lang_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `translations` json NULL,
  `logs` json NULL,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trashbox
-- ----------------------------
DROP TABLE IF EXISTS `trashbox`;
CREATE TABLE `trashbox`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `res_id` int(0) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_on` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for university
-- ----------------------------
DROP TABLE IF EXISTS `university`;
CREATE TABLE `university`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `country_id` int(0) NOT NULL,
  `region_id` int(0) NULL DEFAULT NULL,
  `district_id` int(0) NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint(0) NULL DEFAULT 0,
  `sort` int(0) NOT NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for university_info
-- ----------------------------
DROP TABLE IF EXISTS `university_info`;
CREATE TABLE `university_info`  (
  `info_id` int(0) NOT NULL AUTO_INCREMENT,
  `university_id` int(0) NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_access
-- ----------------------------
DROP TABLE IF EXISTS `user_access`;
CREATE TABLE `user_access`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `is_leader` tinyint(1) NULL DEFAULT 0,
  `user_access_type_id` int(0) NOT NULL,
  `table_id` int(0) NOT NULL,
  `table_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  `work_rate_id` int(0) NULL DEFAULT NULL COMMENT 'work_rate',
  `job_title_id` int(0) NULL DEFAULT NULL COMMENT 'job_title',
  `tabel_number` int(0) NULL DEFAULT NULL COMMENT 'tabel_number',
  `work_type` int(0) NULL DEFAULT NULL COMMENT 'work_type urindoshlik',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rui_user_access_user`(`user_id`) USING BTREE,
  INDEX `rui_user_access_user_access_type`(`user_access_type_id`) USING BTREE,
  CONSTRAINT `rui_user_access_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `rui_user_access_user_access_type` FOREIGN KEY (`user_access_type_id`) REFERENCES `user_access_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15780 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_access_type
-- ----------------------------
DROP TABLE IF EXISTS `user_access_type`;
CREATE TABLE `user_access_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_subject
-- ----------------------------
DROP TABLE IF EXISTS `user_subject`;
CREATE TABLE `user_subject`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `subject_id` int(0) NOT NULL,
  `language_id` int(0) NOT NULL,
  `created_on` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_on` timestamp(0) NULL DEFAULT NULL,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_token_time` int(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `meta` json NULL,
  `status` smallint(0) NOT NULL DEFAULT 10,
  `deleted` tinyint(0) NOT NULL DEFAULT 0,
  `cacheable` tinyint(0) NOT NULL DEFAULT 0,
  `searchable` tinyint(0) NOT NULL DEFAULT 0,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NULL DEFAULT NULL,
  `updated_by` int(0) NULL DEFAULT NULL,
  `is_changed` int(0) NULL DEFAULT 0,
  `status_n` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `user_id_index`(`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `password_reset_token`(`password_reset_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15264 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_field
-- ----------------------------
DROP TABLE IF EXISTS `users_field`;
CREATE TABLE `users_field`  (
  `field_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL,
  `field_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `field_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_session
-- ----------------------------
DROP TABLE IF EXISTS `users_session`;
CREATE TABLE `users_session`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT 0,
  `last_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_login` timestamp(0) NULL DEFAULT NULL,
  `last_session` json NULL,
  `history` json NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vocation
-- ----------------------------
DROP TABLE IF EXISTS `vocation`;
CREATE TABLE `vocation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  `type` tinyint(0) NULL DEFAULT 1 COMMENT '1- tatil, 2-kasal, 3-......',
  `year` int(0) NULL DEFAULT NULL,
  `month` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vu_vocation_user`(`user_id`) USING BTREE,
  CONSTRAINT `vu_vocation_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for week
-- ----------------------------
DROP TABLE IF EXISTS `week`;
CREATE TABLE `week`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` tinyint(1) NULL DEFAULT 1,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NOT NULL,
  `updated_at` int(0) NOT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for work_rate
-- ----------------------------
DROP TABLE IF EXISTS `work_rate`;
CREATE TABLE `work_rate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `rate` double NULL DEFAULT 0,
  `weekly_hours` double NULL DEFAULT 0,
  `hour_day` double NULL DEFAULT 0,
  `daily_hours` json NULL COMMENT '{\"1\":8, \"2\":7, \"3\":7, \"4\":7, \"5\":7}',
  `type` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 0,
  `order` tinyint(1) NULL DEFAULT 1,
  `created_at` int(0) NULL DEFAULT NULL,
  `updated_at` int(0) NULL DEFAULT NULL,
  `created_by` int(0) NOT NULL DEFAULT 0,
  `updated_by` int(0) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
