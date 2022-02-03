/*
 Navicat Premium Data Transfer

 Source Server         : 120.78.11.2_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 120.78.11.2:3306
 Source Schema         : littlegenius

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 03/02/2022 19:09:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for emotion_info
-- ----------------------------
DROP TABLE IF EXISTS `emotion_info`;
CREATE TABLE `emotion_info`  (
  `emotion_id` int(0) NOT NULL AUTO_INCREMENT,
  `emotion_type` int(0) DEFAULT NULL,
  `emotion_value` float(255, 4) DEFAULT NULL,
  `time` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `user_text` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`emotion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emotion_info
-- ----------------------------
INSERT INTO `emotion_info` VALUES (1, 3, 0.4500, '0202-01-01 00:00:00', NULL, NULL);
INSERT INTO `emotion_info` VALUES (2, 1, 0.9800, NULL, NULL, NULL);
INSERT INTO `emotion_info` VALUES (8, 3, 0.9207, '2021-11-04 21:46:42', 'How are you', NULL);
INSERT INTO `emotion_info` VALUES (9, 5, 0.4550, '2021-11-04 22:00:33', 'Hao are you', 'myname');
INSERT INTO `emotion_info` VALUES (10, 1, 0.4030, '2021-11-04 23:22:11', 'Hi', 'wyx');
INSERT INTO `emotion_info` VALUES (11, 3, 0.9680, '2021-11-04 23:26:01', 'Hello', 'wyx');
INSERT INTO `emotion_info` VALUES (12, 5, 0.7634, '2021-11-04 23:50:22', 'kk', 'hyx');
INSERT INTO `emotion_info` VALUES (13, 1, 0.4030, '2021-11-05 00:02:27', 'Hi', 'qwer');
INSERT INTO `emotion_info` VALUES (14, 0, 0.4123, '2021-11-05 00:12:47', 'Thank you', 'hhh');
INSERT INTO `emotion_info` VALUES (15, 5, 0.4069, '2021-11-05 00:13:22', 'good night !', 'hhh');
INSERT INTO `emotion_info` VALUES (16, 0, 0.4123, '2021-11-05 00:20:06', 'Thank you', 'hyv');
INSERT INTO `emotion_info` VALUES (17, 3, 0.5651, '2021-11-05 00:20:22', 'hi.', 'hyv');
INSERT INTO `emotion_info` VALUES (18, 3, 0.5651, '2021-11-05 00:21:02', 'hi.', 'hhy');
INSERT INTO `emotion_info` VALUES (19, 3, 0.9207, '2021-11-05 00:25:56', 'How are you', 'qwer');
INSERT INTO `emotion_info` VALUES (20, 3, 0.9751, '2021-11-05 00:47:43', 'Not good', 'hhhh');
INSERT INTO `emotion_info` VALUES (21, 3, 0.7192, '2021-11-05 00:49:40', 'ok', 'hh');
INSERT INTO `emotion_info` VALUES (22, 3, 0.5215, '2021-11-05 00:51:37', 'sad', 'y');
INSERT INTO `emotion_info` VALUES (23, 3, 0.9751, '2021-11-05 00:55:35', 'Not good', 'a');
INSERT INTO `emotion_info` VALUES (24, 3, 0.9292, '2021-11-05 00:56:29', 'My boyfriend and I had a fight', 'a');
INSERT INTO `emotion_info` VALUES (25, 5, 0.8692, '2021-11-05 01:01:09', 'I miss my friend', 'a');
INSERT INTO `emotion_info` VALUES (26, 5, 0.6694, '2021-11-05 01:01:45', 'I might have a drinking problem', 'a');
INSERT INTO `emotion_info` VALUES (27, 5, 0.9750, '2021-11-05 01:03:04', 'I feel so guilty', 'a');
INSERT INTO `emotion_info` VALUES (28, 5, 0.9750, '2021-11-05 01:04:19', 'I feel so guilty', 'a');
INSERT INTO `emotion_info` VALUES (29, 5, 0.7820, '2021-11-05 01:07:22', 'I feel guilty', 'a');
INSERT INTO `emotion_info` VALUES (30, 5, 0.9989, '2021-11-05 01:08:17', 'I feel myself disgusting', 'a');
INSERT INTO `emotion_info` VALUES (31, 0, 0.3436, '2021-11-05 01:09:25', 'Do I need to see a psychologist?', 'a');
INSERT INTO `emotion_info` VALUES (32, 0, 0.3194, '2021-11-05 01:09:38', 'Do I need to see a psychologist', 'a');
INSERT INTO `emotion_info` VALUES (33, 3, 0.4755, '2021-11-05 01:10:04', 'I might need a therapist', 'a');
INSERT INTO `emotion_info` VALUES (34, 5, 0.9646, '2021-11-05 01:10:57', 'I feel so nervous about my exams', 'a');
INSERT INTO `emotion_info` VALUES (35, 5, 0.7932, '2021-11-05 01:11:44', 'Depression is the theme of my life', 'a');
INSERT INTO `emotion_info` VALUES (36, 3, 0.3779, '2021-11-05 01:12:32', 'Depression has always been with me', 'a');
INSERT INTO `emotion_info` VALUES (37, 5, 0.7941, '2021-11-05 01:15:29', 'Are you listening?', 'a');
INSERT INTO `emotion_info` VALUES (38, 3, 0.3922, '2021-11-05 01:16:01', 'What should I do', 'a');
INSERT INTO `emotion_info` VALUES (39, 5, 0.5801, '2021-11-05 01:16:36', 'I cannot quit drinking', 'a');
INSERT INTO `emotion_info` VALUES (40, 5, 0.9741, '2021-11-05 01:17:23', 'I am addicted to alcohol', 'a');
INSERT INTO `emotion_info` VALUES (41, 5, 0.3527, '2021-11-05 01:43:41', 'What day is today', 'ss');
INSERT INTO `emotion_info` VALUES (42, 1, 0.3679, '2021-11-05 01:44:07', 'It is rainny', 'ss');
INSERT INTO `emotion_info` VALUES (43, 5, 0.7634, '2021-11-05 10:41:28', 'sss', '');
INSERT INTO `emotion_info` VALUES (44, 5, 0.7634, '2021-11-05 10:41:56', 'sssss', '');
INSERT INTO `emotion_info` VALUES (45, 3, 0.8338, '2021-11-07 10:59:26', 'Sounds good.', 'zzk');
INSERT INTO `emotion_info` VALUES (46, 5, 0.8488, '2021-11-07 11:00:05', 'I wen to see a movie yesterday', 'zzk');
INSERT INTO `emotion_info` VALUES (47, 5, 0.4957, '2021-11-07 12:47:38', 'what the hell', 'zzk');
INSERT INTO `emotion_info` VALUES (48, 4, 0.4277, '2021-11-07 12:48:14', 'I miss my parents', 'zzk');
INSERT INTO `emotion_info` VALUES (49, 3, 0.4535, '2021-11-07 12:48:35', 'I miss my parents.', 'zzk');
INSERT INTO `emotion_info` VALUES (50, 3, 0.8777, '2021-11-07 12:49:00', 'So you are a girl?', 'zzk');
INSERT INTO `emotion_info` VALUES (51, 3, 0.5961, '2021-11-07 12:49:46', 'are you a there?', 'zzk');
INSERT INTO `emotion_info` VALUES (52, 5, 0.5084, '2021-11-07 12:51:58', 'I want to apologize to my parents.', 'zzk');
INSERT INTO `emotion_info` VALUES (53, 0, 0.3343, '2021-11-07 14:01:33', 'I have a fight with my classmate', 'zzk');
INSERT INTO `emotion_info` VALUES (54, 3, 0.8768, '2021-11-07 14:04:02', 'I have a good day', 'zzk');
INSERT INTO `emotion_info` VALUES (55, 0, 0.3715, '2021-11-07 14:04:32', 'I have a fight with my classmates', 'zzk');
INSERT INTO `emotion_info` VALUES (56, 1, 0.4030, '2021-11-08 09:41:31', 'Hi', 'test');
INSERT INTO `emotion_info` VALUES (57, 5, 0.3361, '2021-11-08 09:42:59', 'I have too may works today', 'test');
INSERT INTO `emotion_info` VALUES (58, 5, 0.3361, '2021-11-08 09:43:31', 'I have too may works today', 'test');
INSERT INTO `emotion_info` VALUES (59, 5, 0.3361, '2021-11-08 09:44:04', 'I have too may works today', 'test');
INSERT INTO `emotion_info` VALUES (60, 5, 0.9795, '2021-11-08 09:44:45', 'I feel happy today', 'test');
INSERT INTO `emotion_info` VALUES (61, 5, 0.9447, '2021-11-08 09:45:18', 'I feel depressd today', 'test');
INSERT INTO `emotion_info` VALUES (62, 5, 0.3164, '2021-11-08 10:05:16', 'I have too many works, So feel depressd today', 'test');
INSERT INTO `emotion_info` VALUES (63, 3, 0.9638, '2021-11-08 10:06:25', 'good afternoot', 'test');
INSERT INTO `emotion_info` VALUES (64, 5, 0.8057, '2021-11-08 10:07:07', 'I win a big prize!', 'test');
INSERT INTO `emotion_info` VALUES (65, 0, 0.3144, '2021-11-08 10:07:38', 'I was so exciting', 'test');
INSERT INTO `emotion_info` VALUES (66, 0, 0.6537, '2021-11-08 10:08:46', 'I was so happy', 'test');
INSERT INTO `emotion_info` VALUES (67, 5, 0.9910, '2021-11-08 10:09:00', 'I feel haapy', 'test');
INSERT INTO `emotion_info` VALUES (68, 3, 0.6628, '2021-11-08 10:09:16', 'joy', 'test');
INSERT INTO `emotion_info` VALUES (69, 5, 0.3150, '2021-11-08 10:12:13', 'I have too may works, So feel depressd today\n', 'test');
INSERT INTO `emotion_info` VALUES (70, 3, 0.6628, '2021-11-08 10:12:24', 'joy', 'test');
INSERT INTO `emotion_info` VALUES (71, 5, 0.9716, '2021-11-08 10:12:45', 'I feel so happy', 'test');
INSERT INTO `emotion_info` VALUES (72, 5, 0.9476, '2021-11-08 10:14:20', 'I won the first place in my exam!', 'test');
INSERT INTO `emotion_info` VALUES (73, 5, 0.9388, '2021-11-08 10:15:05', 'I won the first place in my exam! I was so happy', 'test');
INSERT INTO `emotion_info` VALUES (74, 5, 0.9574, '2021-11-08 10:16:01', 'I feel joy because I won the first place in my exam!', 'test');
INSERT INTO `emotion_info` VALUES (75, 5, 0.4424, '2021-11-08 10:17:08', 'I received a wonderful gift!', 'test');
INSERT INTO `emotion_info` VALUES (76, 3, 0.3464, '2021-11-08 10:18:33', 'I have too much work to have time to rest', 'test');
INSERT INTO `emotion_info` VALUES (77, 3, 0.3074, '2021-11-08 10:19:20', 'I have too many works to have time to rest', 'test');
INSERT INTO `emotion_info` VALUES (78, 3, 0.7524, '2021-11-08 10:22:26', '\nThanks for your help\n', 'test');
INSERT INTO `emotion_info` VALUES (79, 5, 0.4424, '2021-11-08 10:24:26', 'I received a wonderful gift!', 'test');
INSERT INTO `emotion_info` VALUES (80, 3, 0.3074, '2021-11-08 10:31:31', 'I have too many works to have time to rest', 'test');
INSERT INTO `emotion_info` VALUES (81, 0, 0.2842, '2021-11-08 10:32:29', 'I fear for my final exam', 'test');
INSERT INTO `emotion_info` VALUES (82, 0, 0.3309, '2021-11-08 10:32:55', 'I received a wonderful gift', 'test');
INSERT INTO `emotion_info` VALUES (83, 3, 0.9189, '2021-11-08 10:33:18', ' see you', 'test');
INSERT INTO `emotion_info` VALUES (84, 3, 0.3074, '2021-11-08 10:38:47', 'I have too many works to have time to rest', 'test');
INSERT INTO `emotion_info` VALUES (85, 0, 0.2842, '2021-11-08 10:39:42', 'I fear for my final exam', 'test');
INSERT INTO `emotion_info` VALUES (86, 5, 0.4424, '2021-11-08 10:40:09', 'I received a wonderful gift!', 'test');
INSERT INTO `emotion_info` VALUES (87, 5, 0.4424, '2021-11-08 10:40:27', 'I received a wonderful gift!', 'test');
INSERT INTO `emotion_info` VALUES (88, 0, 0.3309, '2021-11-08 10:40:48', 'I received a wonderful gift', 'test');
INSERT INTO `emotion_info` VALUES (89, 3, 0.3074, '2021-11-08 10:43:24', 'I have too many works to have time to rest', 'test');
INSERT INTO `emotion_info` VALUES (90, 0, 0.2842, '2021-11-08 10:44:14', 'I fear for my final exam', 'test');
INSERT INTO `emotion_info` VALUES (91, 0, 0.3309, '2021-11-08 10:44:39', 'I received a wonderful gift', 'test');
INSERT INTO `emotion_info` VALUES (92, 4, 0.7018, '2021-11-12 20:14:36', 'I have a good time.', 'zzk');
INSERT INTO `emotion_info` VALUES (93, 3, 0.7286, '2021-11-12 20:18:26', 'I have a good time', 'zzk');
INSERT INTO `emotion_info` VALUES (94, 5, 0.7634, '2021-11-13 12:02:38', 'ljli', 'zzk');
INSERT INTO `emotion_info` VALUES (95, 5, 0.7634, '2021-11-13 12:08:38', 'khtfh', 'zzk');
INSERT INTO `emotion_info` VALUES (96, 3, 0.9965, '2021-11-13 12:34:10', 'what a nice day', 'hh');
INSERT INTO `emotion_info` VALUES (97, 3, 0.9680, '2021-11-13 14:43:27', 'Hello', 'scyyw2');
INSERT INTO `emotion_info` VALUES (98, 5, 0.6108, '2021-11-13 14:46:19', 'okay...', 'scyyw2');
INSERT INTO `emotion_info` VALUES (99, 4, 0.4277, '2021-11-13 16:30:09', 'I miss my parents', 'zzk');
INSERT INTO `emotion_info` VALUES (100, 3, 0.9963, '2021-11-13 16:30:38', 'i have a good day', 'zzk');
INSERT INTO `emotion_info` VALUES (101, 3, 0.9207, '2021-11-14 00:37:41', 'How are you', 'test');
INSERT INTO `emotion_info` VALUES (102, 3, 0.9207, '2021-11-14 00:37:57', 'How are you', 'test');
INSERT INTO `emotion_info` VALUES (103, 5, 0.7634, '2021-11-14 00:48:33', 'asd', 'test');
INSERT INTO `emotion_info` VALUES (104, 5, 0.7634, '2021-11-14 00:49:38', 'qwe', 'test');
INSERT INTO `emotion_info` VALUES (105, 5, 0.7634, '2021-11-14 00:50:38', 'qwe', 'test');
INSERT INTO `emotion_info` VALUES (106, 5, 0.7634, '2021-11-14 00:56:48', 'zxc', 'test');
INSERT INTO `emotion_info` VALUES (107, 5, 0.7634, '2021-11-14 00:57:09', 'zxc', 'test');
INSERT INTO `emotion_info` VALUES (108, 5, 0.7634, '2021-11-14 00:59:20', 'zxc', 'test');
INSERT INTO `emotion_info` VALUES (109, 5, 0.7634, '2021-11-14 01:01:58', 'zxc', 'test');
INSERT INTO `emotion_info` VALUES (110, 5, 0.7634, '2021-11-14 01:02:52', 'zxc', 'test');
INSERT INTO `emotion_info` VALUES (111, 5, 0.7634, '2021-11-14 01:03:52', 'qqq', 'shw');
INSERT INTO `emotion_info` VALUES (112, 5, 0.7634, '2021-11-14 01:05:05', 'zxc', 'shw');
INSERT INTO `emotion_info` VALUES (113, 3, 0.9207, '2021-11-14 01:06:42', 'How are you', 'qwe');
INSERT INTO `emotion_info` VALUES (114, 3, 0.9207, '2021-11-14 01:06:51', 'How are you', 'qwe');
INSERT INTO `emotion_info` VALUES (115, 3, 0.9207, '2021-11-14 01:06:59', 'How are you', 'qwe');
INSERT INTO `emotion_info` VALUES (116, 5, 0.7634, '2021-11-14 01:07:39', 'asd', 'test');
INSERT INTO `emotion_info` VALUES (117, 5, 0.7634, '2021-11-14 01:08:25', 'asd', 'test');
INSERT INTO `emotion_info` VALUES (118, 5, 0.7634, '2021-11-14 01:08:36', 'asd', 'test');
INSERT INTO `emotion_info` VALUES (119, 5, 0.7634, '2021-11-14 01:09:30', 'fgh', 'mmm');
INSERT INTO `emotion_info` VALUES (120, 5, 0.7634, '2021-11-14 01:09:45', 'fghfgh', 'mmm');
INSERT INTO `emotion_info` VALUES (121, 5, 0.7634, '2021-11-14 01:10:20', 'fghfgh', 'mmm');
INSERT INTO `emotion_info` VALUES (122, 5, 0.7634, '2021-11-14 09:58:34', 'hhhh', 'nnn');
INSERT INTO `emotion_info` VALUES (123, 5, 0.7634, '2021-11-14 09:59:13', 'ffff', 'nnn');
INSERT INTO `emotion_info` VALUES (124, 5, 0.7634, '2021-11-14 09:59:48', 'zxc', 'test');
INSERT INTO `emotion_info` VALUES (125, 3, 0.8768, '2021-11-14 10:54:32', 'I have a good day', 'zzk');

-- ----------------------------
-- Table structure for questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE `questionnaire`  (
  `questionnaire_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `age` int(10) UNSIGNED ZEROFILL DEFAULT 0000000000,
  `Occupation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `GAD-7_Score` int(10) UNSIGNED ZEROFILL DEFAULT 0000000000,
  `PHQ-9_Score` int(10) UNSIGNED ZEROFILL DEFAULT 0000000000,
  `PSS` int(10) UNSIGNED ZEROFILL DEFAULT 0000000000,
  `ISI` int(10) UNSIGNED ZEROFILL DEFAULT 0000000000,
  `time` datetime(0) DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`questionnaire_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionnaire
-- ----------------------------
INSERT INTO `questionnaire` VALUES (6, '', '', 0000000000, '', 0000000000, 0000000000, 0000000000, 0000000000, NULL, NULL);
INSERT INTO `questionnaire` VALUES (7, '', '', 0000000000, '', 0000000000, 0000000000, 0000000000, 0000000000, NULL, NULL);
INSERT INTO `questionnaire` VALUES (8, '', '', 0000000000, '', 0000000000, 0000000000, 0000000000, 0000000000, NULL, NULL);
INSERT INTO `questionnaire` VALUES (9, '', '', 0000000000, '', 0000000000, 0000000000, 0000000000, 0000000000, NULL, NULL);
INSERT INTO `questionnaire` VALUES (10, '123', 'Female', 0000000012, 'stu', 0000000004, 0000000000, 0000000005, 0000000002, NULL, NULL);
INSERT INTO `questionnaire` VALUES (11, 'shw', 'Male', 0000000012, 'stu', 0000000011, 0000000010, 0000000000, 0000000000, NULL, NULL);
INSERT INTO `questionnaire` VALUES (12, 'remote_db_TEST', 'Female', 0000000099, 'SSS', 0000000007, 0000000009, 0000000006, 0000000007, NULL, NULL);
INSERT INTO `questionnaire` VALUES (13, 'ttt', '', 0000000000, '', 0000000000, 0000000000, 0000000000, 0000000000, '2021-11-04 21:33:55', NULL);
INSERT INTO `questionnaire` VALUES (14, 'testname', '', 0000000000, '', 0000000000, 0000000000, 0000000000, 0000000000, '2021-11-04 22:00:11', 'myname');
INSERT INTO `questionnaire` VALUES (15, 'Jyyyy', 'Female', 0000000050, 'wulala', 0000000014, 0000000014, 0000000019, 0000000014, '2021-11-05 00:01:42', 'qwer');
INSERT INTO `questionnaire` VALUES (16, 'zzk', 'Male', 0000000024, 'Student', 0000000002, 0000000003, 0000000008, 0000000004, '2021-11-07 12:45:46', 'zzk');
INSERT INTO `questionnaire` VALUES (17, 'test', 'Male', 0000000021, 'student', 0000000015, 0000000017, 0000000018, 0000000018, '2021-11-08 09:41:14', 'test');
INSERT INTO `questionnaire` VALUES (18, 'test_name', 'Male', 0000000021, 'stu', 0000000016, 0000000016, 0000000024, 0000000018, '2021-11-08 10:31:08', 'test');
INSERT INTO `questionnaire` VALUES (19, 'name', 'Male', 0000000021, 'stu', 0000000011, 0000000018, 0000000020, 0000000018, '2021-11-08 10:38:21', 'test');
INSERT INTO `questionnaire` VALUES (20, 'name', 'Male', 0000000021, 'stu', 0000000016, 0000000015, 0000000023, 0000000018, '2021-11-08 10:43:00', 'test');
INSERT INTO `questionnaire` VALUES (21, 'hhhh', '', 0000000012, '3', 0000000015, 0000000006, 0000000006, 0000000000, '2021-11-14 00:49:34', 'test');
INSERT INTO `questionnaire` VALUES (22, 'h', '', 0000000001, '', 0000000004, 0000000000, 0000000008, 0000000010, '2021-11-14 01:02:48', 'test');
INSERT INTO `questionnaire` VALUES (23, 'r222', '', 0000000000, '', 0000000002, 0000000004, 0000000000, 0000000006, '2021-11-14 01:08:11', 'test');
INSERT INTO `questionnaire` VALUES (24, 'gg', '', 0000000123, '', 0000000003, 0000000004, 0000000000, 0000000006, '2021-11-14 01:10:09', 'mmm');
INSERT INTO `questionnaire` VALUES (25, '444', '', 0000000012, '4', 0000000016, 0000000008, 0000000010, 0000000007, '2021-11-14 09:59:08', 'nnn');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
