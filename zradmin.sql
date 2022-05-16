/*
 Navicat Premium Data Transfer

 Source Server         : good
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : zradmin

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 16/05/2022 10:49:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `cid` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `userId` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章状态1、已发布 2、草稿',
  `fmt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑器类型markdown,html',
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标签',
  `hits` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '目录id',
  `createTime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `authorName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者名',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for articlecategory
-- ----------------------------
DROP TABLE IF EXISTS `articlecategory`;
CREATE TABLE `articlecategory`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '目录id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目录名',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `parentId` int(0) UNSIGNED NULL DEFAULT 0 COMMENT '父级ID',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articlecategory
-- ----------------------------
INSERT INTO `articlecategory` VALUES (1, 'C#', '2021-08-13 00:00:00.000000', 0);
INSERT INTO `articlecategory` VALUES (2, 'java', '2021-08-18 00:00:00.000000', 0);
INSERT INTO `articlecategory` VALUES (3, '前端', '2021-08-18 00:00:00.000000', 0);
INSERT INTO `articlecategory` VALUES (4, '数据库', '2021-08-18 00:00:00.000000', 0);
INSERT INTO `articlecategory` VALUES (5, '其他', '2021-08-19 00:00:00.000000', 0);
INSERT INTO `articlecategory` VALUES (6, '羽毛球', '2021-08-19 00:00:00.000000', 5);
INSERT INTO `articlecategory` VALUES (7, 'vue', '2021-08-19 00:00:00.000000', 3);
INSERT INTO `articlecategory` VALUES (8, 'sqlserver', '2021-08-19 00:00:00.000000', 4);

-- ----------------------------
-- Table structure for gen_demo
-- ----------------------------
DROP TABLE IF EXISTS `gen_demo`;
CREATE TABLE `gen_demo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `showStatus` int(0) NOT NULL COMMENT '显示状态',
  `addTime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `sex` int(0) NULL DEFAULT NULL COMMENT '用户性别',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `beginTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `feature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特征',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `tableId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `tableComment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `subTableName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `subTableFkName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `className` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tplCategory` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `baseNameSpace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成命名空间前缀',
  `moduleName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `businessName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `functionName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `functionAuthor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `genType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `genPath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dbName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名',
  PRIMARY KEY (`tableId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `columnId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `tableId` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `columnName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `columnComment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `columnType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `csharpType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'C#类型',
  `csharpField` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'C#字段名',
  `isPk` tinyint(1) NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `isIncrement` tinyint(1) NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `isRequired` tinyint(1) NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `isInsert` tinyint(1) NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `isEdit` tinyint(1) NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `isList` tinyint(1) NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `isQuery` tinyint(0) NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `queryType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `htmlType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dictType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`columnId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `Id` int(0) NOT NULL,
  `SupplierName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `Context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_common_lang
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_lang`;
CREATE TABLE `sys_common_lang`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `lang_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语言code eg：zh-cn',
  `lang_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '翻译key值',
  `lang_name` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '翻译内容',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `configId` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `configName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `configKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `configValue` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `configType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`configId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-12-26 13:14:57', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-12-26 13:14:57', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-12-26 13:14:57', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', '1', 'Y', 'admin', '2021-12-26 13:14:57', 'admin', '2022-03-30 12:43:48', '是否开启验证码功能（off、关闭，1、动态验证码 2、动态gif泡泡 3、泡泡 4、静态验证码）');
INSERT INTO `sys_config` VALUES (5, '本地文件上传访问域名', 'sys.file.uploadurl', 'http://localhost:8888', 'Y', '', '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_config` VALUES (6, '开启注册功能', 'sys.account.register', 'true', 'Y', 'admin', '2022-05-15 01:06:41', 'admin', NULL, NULL);
INSERT INTO `sys_config` VALUES (7, '文章预览地址', 'sys.article.preview.url', 'http://www.izhaorui.cn/article/details/', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '格式：http://www.izhaorui.cn/article/details/{aid}，其中{aid}为文章的id');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `deptId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parentId` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `deptName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `orderNum` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`deptId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'A公司', 0, 'zr', '', '', '0', '0', 'admin', NULL, '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '研发部门', 1, 'zr', '', '', '0', '0', 'admin', NULL, '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '市场部门', 2, 'zr', '', '', '0', '0', 'admin', NULL, '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (103, 100, '0,100', '测试部门', 3, 'zr', '', '', '0', '0', 'admin', NULL, '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (104, 100, '0,100', '财务部门', 4, 'zr', '', '', '0', '0', 'admin', NULL, '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (200, 0, '0', 'B公司', 0, 'zr', '', '', '0', '0', 'admin', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dictCode` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dictSort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dictLabel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dictValue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dictType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `cssClass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `listClass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `isDefault` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dictCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '异常', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', '2021-07-02 14:09:09', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:21', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 0, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-02-24 10:56:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-02-24 10:56:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '发布', '1', 'sys_article_status', NULL, NULL, NULL, '0', 'admin', '2021-08-19 10:34:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '草稿', '2', 'sys_article_status', NULL, NULL, NULL, '0', 'admin', '2021-08-19 10:35:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 1, '中文', 'zh-cn', 'sys_lang_type', NULL, NULL, NULL, '0', 'admin', '2021-08-19 10:35:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 2, '英文', 'en', 'sys_lang_type', NULL, NULL, NULL, '0', 'admin', '2021-08-19 10:35:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 3, '繁体', 'zh-tw', 'sys_lang_type', NULL, NULL, NULL, '0', 'admin', '2021-08-19 10:35:06', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dictId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dictName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dictType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dictId`) USING BTREE,
  UNIQUE INDEX `dictType`(`dictType`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '文章状态', 'sys_article_status', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '多语言类型', 'sys_lang_type', '0', 'Y', 'admin', '2022-05-15 01:06:41', '', NULL, '多语言字典类型');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(0) NOT NULL,
  `realName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件真实名',
  `fileName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `fileUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储地址',
  `storePath` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库位置',
  `accessUrl` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问路径',
  `fileSize` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `fileType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `fileExt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `storeType` int(0) NULL DEFAULT NULL COMMENT '存储类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `infoId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `loginLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `loginTime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '访问时间',
  PRIMARY KEY (`infoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 01:15:18');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '1', '用户名或密码错误', '2022-05-15 01:17:34');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 01:17:59');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 01:27:22');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 01:33:34');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '1', '用户名或密码错误', '2022-05-15 13:03:05');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 13:07:09');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 13:35:38');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 13:54:23');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '1', '用户名或密码错误', '2022-05-15 23:19:08');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-15 23:19:52');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '0-内网IP', 'Other', 'Windows 10', '0', '登录成功', '2022-05-16 10:34:05');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menuId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menuName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parentId` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `orderNum` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `isFrame` int(0) NULL DEFAULT 0 COMMENT '是否外链(0 否 1 是)',
  `isCache` int(0) NULL DEFAULT 0 COMMENT '是否缓存(0缓存 1不缓存)',
  `menuType` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮 L链接）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `menuName_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名翻译字典名',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2017 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 0, 0, 'M', '0', '0', '', 'system', '', '2022-05-15 01:06:41', '', NULL, '系统管理目录', 'menu.system');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 0, 0, 'M', '0', '0', '', 'monitor', '', '2022-05-15 01:06:41', '', NULL, '系统监控目录', 'menu.monitoring');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 0, 0, 'M', '0', '0', '', 'tool', '', '2022-05-15 01:06:41', '', NULL, '系统工具目录', 'menu.systemTools');
INSERT INTO `sys_menu` VALUES (5, '官网地址', 0, 5, 'http://www.izhaorui.cn', NULL, 1, 0, 'M', '0', '0', '', 'link', '', '2022-05-15 01:06:41', '', NULL, 'Zr官网地址', 'menu.officialWebsite');
INSERT INTO `sys_menu` VALUES (6, '控制台', 0, 0, 'dashboard', 'index_v1', 0, 0, 'C', '0', '0', '', 'dashboard', '', '2022-05-15 01:06:41', '', NULL, '', 'menu.dashboard');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 0, 0, 'C', '0', '0', 'system:user:list', 'user', '', '2022-05-15 01:06:41', '', NULL, '用户管理菜单', 'menu.systemUser');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 0, 0, 'C', '0', '0', 'system:role:list', 'peoples', '', '2022-05-15 01:06:41', '', NULL, '角色管理菜单', 'menu.systemRole');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 0, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '', '2022-05-15 01:06:41', '', NULL, '菜单管理菜单', 'menu.systemMenu');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 0, 0, 'C', '0', '0', 'system:dept:list', 'tree', '', '2022-05-15 01:06:41', '', NULL, '部门管理菜单', 'menu.systemDept');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 0, 0, 'C', '0', '0', 'system:post:list', 'post', '', '2022-05-15 01:06:41', '', NULL, '岗位管理菜单', 'menu.systemPost');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 0, 0, 'C', '0', '0', 'system:dict:list', 'dict', '', '2022-05-15 01:06:41', '', NULL, '', 'menu.systemDic');
INSERT INTO `sys_menu` VALUES (106, '角色分配', 1, 2, 'roleusers', 'system/roleusers/index', 0, 0, 'C', '1', '0', 'system:roleusers:list', 'people', '', '2022-05-15 01:06:41', '', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (107, '参数设置', 1, 8, 'config', 'system/config/index', 0, 0, 'C', '0', '0', 'system:config:list', 'edit', '', '2022-05-15 01:06:41', '', NULL, '', 'menu.systemParam');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 10, 'log', '', 0, 0, 'M', '0', '0', '', 'log', '', '2022-05-15 01:06:41', '', NULL, '日志管理菜单', 'menu.systemLog');
INSERT INTO `sys_menu` VALUES (109, '通知公告', 1, 9, 'notice', 'system/notice/index', 0, 0, 'C', '0', '0', 'system:notice:list', 'message', '', '2022-05-15 01:06:41', '', NULL, '通知公告菜单', 'menu.systemNotice');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 10, 'job', 'monitor/job/index', 0, 0, 'C', '0', '0', '', 'job', '', '2022-05-15 01:06:41', '', NULL, '定时任务菜单', 'menu.timedTask');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 11, 'server', 'monitor/server/index', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', '', '2022-05-15 01:06:41', '', NULL, '服务监控菜单', 'menu.serviceMonitor');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 12, 'cache', 'monitor/cache/index', 0, 0, 'C', '1', '1', 'monitor:cache:list', 'redis', '', '2022-05-15 01:06:41', '', NULL, '缓存监控菜单', 'menu.cacheMonitor');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 13, 'build', 'tool/build/index', 0, 0, 'C', '0', '0', 'tool:build:list', 'build', '', '2022-05-15 01:06:41', '', NULL, '表单构建菜单', 'menu.formBuild');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 14, 'gen', 'tool/gen/index', 0, 0, 'C', '0', '0', 'tool:gen:list', 'code', '', '2022-05-15 01:06:41', '', NULL, '代码生成菜单', 'menu.codeGeneration');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 15, 'swagger', 'tool/swagger/index', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', '', '2022-05-15 01:06:41', '', NULL, '系统接口菜单', 'menu.systemInterface');
INSERT INTO `sys_menu` VALUES (117, '发送邮件', 3, 16, 'sendEmail', 'tool/email/sendEmail', 0, 0, 'C', '0', '0', 'tool:email:send', 'email', '', '2022-05-15 01:06:41', '', NULL, '发送邮件菜单', 'menu.sendEmail');
INSERT INTO `sys_menu` VALUES (118, '文章管理', 3, 18, 'article', NULL, 0, 0, 'M', '0', '0', NULL, 'documentation', '', '2022-05-15 01:06:41', '', NULL, NULL, 'menu.systemArticle');
INSERT INTO `sys_menu` VALUES (119, '文章列表', 118, 1, 'index', 'system/article/manager', 0, 0, 'C', '0', '0', 'system:article:list', 'list', '', '2022-05-15 01:06:41', '', NULL, NULL, 'menu.articleList');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 0, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', '', '2022-05-15 01:06:41', '', NULL, '操作日志菜单', 'menu.operLog');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 0, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', '', '2022-05-15 01:06:41', '', NULL, '登录日志菜单', 'menu.loginLog');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 0, 0, 'F', '0', '0', 'system:user:query', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1002, '用户添加', 100, 2, '', '', 0, 0, 'F', '0', '0', 'system:user:add', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 0, 0, 'F', '0', '0', 'system:user:edit', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 0, 0, 'F', '0', '0', 'system:user:delete', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 0, 0, 'F', '0', '0', 'system:user:export', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 0, 0, 'F', '0', '0', 'system:user:import', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 0, 0, 'F', '0', '0', 'system:user:resetPwd', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 0, 0, 'F', '0', '0', 'system:role:query', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 0, 0, 'F', '0', '0', 'system:role:add', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 0, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 0, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1012, '角色授权', 101, 5, '', '', 0, 0, 'F', '0', '0', 'system:role:authorize', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 0, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 0, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 0, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 0, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1017, '修改排序', 102, 5, '', '', 0, 0, 'F', '0', '0', 'system:menu:changeSort', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1018, '部门查询', 103, 1, '', '', 0, 0, 'F', '0', '0', 'system:dept:query', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1019, '部门新增', 103, 2, '', '', 0, 0, 'F', '0', '0', 'system:dept:add', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1020, '部门修改', 103, 3, '', '', 0, 0, 'F', '0', '0', 'system:dept:update', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1021, '部门删除', 103, 4, '', '', 0, 0, 'F', '0', '0', 'system:dept:remove', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1022, '岗位查询', 104, 1, '', '', 0, 0, 'F', '0', '0', 'system:post:list', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1023, '岗位添加', 104, 2, '', '', 0, 0, 'F', '0', '0', 'system:post:add', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 3, '', '', 0, 0, 'F', '0', '0', 'system:post:remove', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1025, '岗位编辑', 104, 4, '', '', 0, 0, 'F', '0', '0', 'system:post:edit', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 1, '', '', 0, 0, 'F', '0', '0', 'system:dict:add', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 2, '', '', 0, 0, 'F', '0', '0', 'system:dict:edit', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 3, '', '', 0, 0, 'F', '0', '0', 'system:dict:remove', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1029, '新增用户', 106, 2, '', '', 0, 0, 'F', '0', '0', 'system:roleusers:add', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1030, '删除用户', 106, 3, '', '', 0, 0, 'F', '0', '0', 'system:roleusers:remove', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1032, '任务查询', 110, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:list', '#', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1033, '任务新增', 110, 2, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:add', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1034, '任务删除', 110, 3, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:delete', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1035, '任务修改', 110, 4, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:edit', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1036, '任务启动', 110, 5, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:start', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1037, '任务运行', 110, 7, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:run', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1038, '任务停止', 110, 8, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:stop', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1039, '任务日志', 2, 0, 'job/log', 'monitor/job/log', 0, 0, 'C', '1', '0', 'monitor:job:query', 'log', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1040, '任务导出', 110, 10, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:job:export', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1041, '操作查询', 500, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:operlog:query', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1042, '操作删除', 500, 2, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:operlog:remove', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1043, '操作日志导出', 500, 3, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:operlog:export', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1044, '登录查询', 501, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:logininfor:query', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1045, '登录删除', 501, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:logininfor:remove', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1046, '登录日志导出', 501, 1, '#', NULL, 0, 0, 'F', '0', '0', 'monitor:logininfor:export', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1047, '发布文章', 3, 2, '/article/publish', 'system/article/publish', 0, 0, 'C', '1', '0', 'system:article:publish', 'log', '', '2022-05-15 01:06:41', '', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '文章新增', 118, 3, '#', NULL, 0, 0, 'F', '0', '0', 'system:article:add', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1049, '文章修改', 118, 4, '#', NULL, 0, 0, 'F', '0', '0', 'system:article:update', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1050, '文章删除', 118, 5, '#', NULL, 0, 0, 'F', '0', '0', 'system:article:delete', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1051, '查询公告', 109, 1, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:query', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1052, '新增公告', 109, 2, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:add', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1053, '删除公告', 109, 3, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:delete', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1054, '修改公告', 109, 4, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:update', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1055, '导出公告', 109, 5, '#', NULL, 0, 0, 'F', '0', '0', 'system:notice:export', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1060, '生成修改', 3, 1, '/gen/editTable', 'tool/gen/editTable', 0, 0, 'C', '1', '0', 'tool:gen:edit', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1061, '生成查询', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:query', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1062, '生成删除', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:remove', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1063, '导入代码', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:import', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1064, '生成代码', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:code', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1065, '预览代码', 115, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:gen:preview', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1070, '岗位导出', 104, 4, '', '', 0, 0, 'F', '0', '0', 'system:post:export', '', '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1071, '字典导出', 105, 3, '', '', 0, 0, 'F', '0', '0', 'system:dict:export', NULL, '', '2022-05-15 01:06:41', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (2000, '文件存储', 3, 17, 'file', 'tool/file/index', 0, 0, 'C', '0', '0', 'tool:file:list', 'upload', '', '2022-05-15 01:06:41', '', NULL, '文件存储菜单', 'menu.fileStorage');
INSERT INTO `sys_menu` VALUES (2001, '查询', 2000, 1, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:query', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2002, '新增', 2000, 2, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:add', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2003, '删除', 2000, 3, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:delete', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2004, '修改', 2000, 4, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:update', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2005, '导出', 2000, 5, '#', NULL, 0, 0, 'F', '0', '0', 'tool:file:export', '', '', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2006, '多语言配置', 1, 20, 'CommonLang', 'system/commonLang/index', 0, 0, 'C', '0', '0', 'system:lang:list', 'language', 'system', '2022-05-15 01:06:41', '', NULL, '', 'menu.systemLang');
INSERT INTO `sys_menu` VALUES (2007, '查询', 2006, 1, '#', NULL, 0, 0, 'F', '0', '0', 'system:lang:query', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2008, '新增', 2006, 2, '#', NULL, 0, 0, 'F', '0', '0', 'system:lang:add', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2009, '删除', 2006, 3, '#', NULL, 0, 0, 'F', '0', '0', 'system:lang:delete', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2010, '修改', 2006, 4, '#', NULL, 0, 0, 'F', '0', '0', 'system:lang:edit', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2011, '文章目录', 118, 999, 'ArticleCategory', 'system/article/articleCategory', 0, 0, 'C', '0', '0', 'articlecategory:list', 'tree-table', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2012, '查询', 2011, 1, '#', NULL, 0, 0, 'F', '0', '0', 'articlecategory:query', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2013, '新增', 2011, 2, '#', NULL, 0, 0, 'F', '0', '0', 'articlecategory:add', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2014, '删除', 2011, 3, '#', NULL, 0, 0, 'F', '0', '0', 'articlecategory:delete', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2015, '修改', 2011, 4, '#', NULL, 0, 0, 'F', '0', '0', 'articlecategory:edit', '', 'system', '2022-05-15 01:06:41', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (2016, '供应商管理', 0, 999, 'vxetable', 'vxetable/index', 0, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2022-05-15 01:34:56', 'admin', '2022-05-15 23:39:09', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, '34359', '1', '<h1><b id=\"vuycu\">234343434</b></h1>', '0', 'admin', '2022-05-15 22:16:39', 'admin', '2022-05-16 00:53:57', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `operId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `businessType` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `requestMethod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operatorType` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `operName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `deptName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `operUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `operIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `operLocation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `operParam` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `jsonResult` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `errorMsg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `operTime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `elapsed` bigint(0) NULL DEFAULT NULL COMMENT '请求用时',
  PRIMARY KEY (`operId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, NULL, 0, NULL, 'POST', 0, NULL, NULL, '/login', '127.0.0.1', '0 内网IP', '{\"username\":\"admin\",\"password\":\"admin\",\"code\":\"3x8g\",\"uuid\":\"1d790b6698d2407386aba4e10d2d466a\"}', '{\r\n  \"code\": 105,\r\n  \"msg\": \"用户名或密码错误\",\r\n  \"data\": null\r\n}', 1, '用户名或密码错误', '2022-05-15 01:17:44', 0);
INSERT INTO `sys_oper_log` VALUES (2, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=zradmin&pageNum=1&pageSize=10', '{\r\n  \"code\": 101,\r\n  \"msg\": \"string cannot be of zero length. (parameter \'oldvalue\')\",\r\n  \"data\": null\r\n}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-05-15 01:19:49', 0);
INSERT INTO `sys_oper_log` VALUES (3, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=mysql&pageNum=1&pageSize=10', '{\r\n  \"code\": 101,\r\n  \"msg\": \"string cannot be of zero length. (parameter \'oldvalue\')\",\r\n  \"data\": null\r\n}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-05-15 01:20:01', 0);
INSERT INTO `sys_oper_log` VALUES (4, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=zradmin&pageNum=1&pageSize=10', '{\r\n  \"code\": 101,\r\n  \"msg\": \"string cannot be of zero length. (parameter \'oldvalue\')\",\r\n  \"data\": null\r\n}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-05-15 01:20:03', 0);
INSERT INTO `sys_oper_log` VALUES (5, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=mysql&pageNum=1&pageSize=10', '{\r\n  \"code\": 101,\r\n  \"msg\": \"string cannot be of zero length. (parameter \'oldvalue\')\",\r\n  \"data\": null\r\n}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-05-15 01:20:03', 0);
INSERT INTO `sys_oper_log` VALUES (6, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=zradmin&pageNum=1&pageSize=10', '{\r\n  \"code\": 101,\r\n  \"msg\": \"string cannot be of zero length. (parameter \'oldvalue\')\",\r\n  \"data\": null\r\n}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-05-15 01:20:04', 0);
INSERT INTO `sys_oper_log` VALUES (7, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=zradmin&pageNum=1&pageSize=10', '{\r\n  \"code\": 101,\r\n  \"msg\": \"string cannot be of zero length. (parameter \'oldvalue\')\",\r\n  \"data\": null\r\n}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-05-15 01:20:10', 0);
INSERT INTO `sys_oper_log` VALUES (8, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, 'admin', NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": \"admin\",    \"id\": 1  }}', 0, NULL, '2022-05-15 01:32:50', 0);
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 1, 'SysMenu.MenuAdd()', 'PUT', 0, 'admin', NULL, '/system/menu/add', '127.0.0.1', '0 内网IP', '{\"parentId\":0,\"menuName\":\"vxetable\",\"menuType\":\"C\",\"orderNum\":999,\"isFrame\":\"0\",\"isCache\":\"0\",\"visible\":\"0\",\"status\":\"0\",\"path\":\"/vxetable\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-05-15 01:34:57', 0);
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2016,\"menuName\":\"vxetable\",\"parentName\":null,\"parentId\":0,\"orderNum\":999,\"path\":\"vxetable\",\"component\":\"vxetable/index\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":null,\"icon\":\"chart\",\"menuNameKey\":null,\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-05-15 01:34:56\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-05-15 01:36:49', 0);
INSERT INTO `sys_oper_log` VALUES (11, NULL, 0, NULL, 'POST', 0, NULL, NULL, '/login', '127.0.0.1', '0 内网IP', '{\"username\":\"admin\",\"password\":\"admin\",\"uuid\":\"e89bd6dff0784016bf4559fd7cdb07f3\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Fatal error encountered during command execution.', '2022-05-15 13:02:57', 0);
INSERT INTO `sys_oper_log` VALUES (12, NULL, 0, NULL, 'GET', 0, 'admin', NULL, '/tool/gen/getTableList', '127.0.0.1', '0 内网IP', '?dbName=zradmin&pageNum=1&pageSize=10', '{\r\n  \"code\": 101,\r\n  \"msg\": \"string cannot be of zero length. (parameter \'oldvalue\')\",\r\n  \"data\": null\r\n}', 1, 'String cannot be of zero length. (Parameter \'oldValue\')', '2022-05-15 13:35:58', 0);
INSERT INTO `sys_oper_log` VALUES (13, '注销', 0, 'SysLogin.LogOut()', 'POST', 0, 'admin', NULL, '/LogOut', '127.0.0.1', '0 内网IP', '', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": {    \"name\": \"admin\",    \"id\": 1  }}', 0, NULL, '2022-05-15 13:54:16', 0);
INSERT INTO `sys_oper_log` VALUES (14, '通知公告表', 1, 'SysNotice.AddSysNotice()', 'POST', 0, 'admin', NULL, '/system/notice', '127.0.0.1', '0 内网IP', '{\"noticeTitle\":\"3435\",\"noticeType\":\"1\",\"noticeContent\":\"<p><b>234343434</b></p>\",\"status\":\"0\"}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-05-15 22:16:39', 0);
INSERT INTO `sys_oper_log` VALUES (15, '通知公告表', 2, 'SysNotice.UpdateSysNotice()', 'PUT', 0, 'admin', NULL, '/system/notice', '127.0.0.1', '0 内网IP', '{\"noticeId\":10,\"noticeTitle\":\"3435\",\"noticeType\":\"1\",\"noticeContent\":\"<h1><b id=\\\"vuycu\\\">234343434</b></h1>\",\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-05-15 22:16:39\",\"updateTime\":null,\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-05-15 22:22:43', 0);
INSERT INTO `sys_oper_log` VALUES (16, NULL, 0, NULL, 'POST', 0, NULL, NULL, '/login', '127.0.0.1', '0 内网IP', '{\"username\":\"admin\",\"password\":\"admin\",\"uuid\":\"78b8fb574ef94201afd2507d76e78606\"}', '{\r\n  \"code\": 105,\r\n  \"msg\": \"用户名或密码错误\",\r\n  \"data\": null\r\n}', 1, '用户名或密码错误', '2022-05-15 23:19:46', 0);
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 2, 'SysMenu.MenuEdit()', 'POST', 0, 'admin', NULL, '/system/Menu/edit', '127.0.0.1', '0 内网IP', '{\"menuId\":2016,\"menuName\":\"供应商管理\",\"parentName\":null,\"parentId\":0,\"orderNum\":999,\"path\":\"vxetable\",\"component\":\"vxetable/index\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":null,\"icon\":\"chart\",\"menuNameKey\":null,\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-05-15 01:34:56\",\"updateTime\":\"2022-05-15 01:36:49\",\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\"}', 0, NULL, '2022-05-15 23:39:09', 0);
INSERT INTO `sys_oper_log` VALUES (18, '通知公告表', 2, 'SysNotice.UpdateSysNotice()', 'PUT', 0, 'admin', NULL, '/system/notice', '127.0.0.1', '0 内网IP', '{\"noticeId\":10,\"noticeTitle\":\"34359\",\"noticeType\":\"1\",\"noticeContent\":\"<h1><b id=\\\"vuycu\\\">234343434</b></h1>\",\"status\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2022-05-15 22:16:39\",\"updateTime\":\"2022-05-15 22:22:43\",\"remark\":null}', '{  \"code\": 200,  \"msg\": \"SUCCESS\",  \"data\": 1}', 0, NULL, '2022-05-16 00:53:57', 0);
INSERT INTO `sys_oper_log` VALUES (19, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"柳州\",\"address\":\"1\",\"context\":\"2\",\"remark\":\"3\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:30:21', 0);
INSERT INTO `sys_oper_log` VALUES (20, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"柳州\",\"address\":\"1\",\"context\":\"2\",\"remark\":\"3\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:30:40', 0);
INSERT INTO `sys_oper_log` VALUES (21, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:34:59', 0);
INSERT INTO `sys_oper_log` VALUES (22, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:35:02', 0);
INSERT INTO `sys_oper_log` VALUES (23, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:35:15', 0);
INSERT INTO `sys_oper_log` VALUES (24, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:39:46', 0);
INSERT INTO `sys_oper_log` VALUES (25, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:39:48', 0);
INSERT INTO `sys_oper_log` VALUES (26, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:39:49', 0);
INSERT INTO `sys_oper_log` VALUES (27, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:39:49', 0);
INSERT INTO `sys_oper_log` VALUES (28, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:39:50', 0);
INSERT INTO `sys_oper_log` VALUES (29, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:39:50', 0);
INSERT INTO `sys_oper_log` VALUES (30, NULL, 0, NULL, 'POST', 0, 'admin', NULL, '/api/Supplier/SupplierAdd', '127.0.0.1', '0 内网IP', '{\"suppliername\":\"2\",\"address\":\"34\",\"context\":\"45\",\"remark\":\"55\"}', '{\r\n  \"code\": 500,\r\n  \"msg\": \"服务器好像出了点问题......\",\r\n  \"data\": null\r\n}', 1, 'Unable to resolve service for type \'ZR.Service.Myself.IService.ISupplierService\' while attempting to activate \'ZR.Admin.WebApi.Controllers.Myself.SupplierController\'.', '2022-05-16 10:40:31', 0);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `postId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `postCode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `postName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `postSort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`postId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'CEO', '董事长', 1, '0', '', '2022-05-15 01:06:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'SE', '项目经理', 2, '0', '', '2022-05-15 01:06:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'HR', '人力资源', 3, '0', '', '2022-05-15 01:06:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'USER', '普通员工', 4, '0', '', '2022-05-15 01:06:41', '', NULL, '');
INSERT INTO `sys_post` VALUES (6, 'PM', '人事经理', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (7, 'GM', '总经理', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (8, 'COO', '首席运营官', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (9, 'CFO', '首席财务官', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (10, 'CTO', '首席技术官', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (11, 'HRD', '人力资源总监', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (12, 'VP', '副总裁', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (13, 'OD', '运营总监', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (14, 'MD', '市场总监', 0, '0', NULL, '2022-05-15 01:06:41', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `roleKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `roleSort` int(0) NOT NULL COMMENT '显示顺序',
  `dataScope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 ）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NOT NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 0, '0', '0', 'admin', '2022-05-15 01:06:41', 'system', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 0, '0', '0', 'admin', '2022-05-15 01:06:41', 'system', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `roleId` bigint(0) NOT NULL COMMENT '角色ID',
  `deptId` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`roleId`, `deptId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 3, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 5, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 6, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 100, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 101, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 102, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 103, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 104, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 106, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 108, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 109, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 114, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 500, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 501, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1001, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1008, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1013, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1018, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1022, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1031, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1044, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (2, 1051, 'admin', '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (3, 4, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (3, 118, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (3, 1047, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (3, 1048, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (3, 1049, NULL, '2022-05-15 01:06:41');
INSERT INTO `sys_role_menu` VALUES (3, 1050, NULL, '2022-05-15 01:06:41');

-- ----------------------------
-- Table structure for sys_tasks
-- ----------------------------
DROP TABLE IF EXISTS `sys_tasks`;
CREATE TABLE `sys_tasks`  (
  `Id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'UID',
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `JobGroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务分组',
  `Cron` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行时间表达式',
  `AssemblyName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '程序集名称',
  `ClassName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务所在类',
  `Remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务描述',
  `RunTimes` int(0) NOT NULL COMMENT '执行次数',
  `BeginTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `EndTime` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `TriggerType` int(0) NOT NULL COMMENT '触发器类型（0、simple 1、cron）',
  `IntervalSecond` int(0) NOT NULL COMMENT '执行间隔时间(单位:秒)',
  `IsStart` tinyint(0) NOT NULL COMMENT '是否启动',
  `JobParams` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '传入参数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人编码',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人编码',
  `lastRunTime` datetime(0) NULL DEFAULT NULL COMMENT '最后执行时间',
  `apiUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'api执行地址',
  `taskType` int(0) NULL DEFAULT 1 COMMENT '任务类型1程序集任务 2网络请求',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_tasks_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_tasks_log`;
CREATE TABLE `sys_tasks_log`  (
  `jobLogId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `jobId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `jobName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `jobGroup` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `jobMessage` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `invokeTarget` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用目标',
  `elapsed` double(10, 0) NULL DEFAULT NULL COMMENT '作业用时',
  PRIMARY KEY (`jobLogId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userId` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `deptId` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nickName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `userType` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `delFlag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `loginIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `loginDate` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 0, 'admin', '管理员', '0', '', '', '0', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '127.0.0.1', '2022-05-16 10:34:04', 'admin', '2020-11-26 11:52:59', 'admin', '2021-08-03 10:11:24', '管理员');
INSERT INTO `sys_user` VALUES (2, 0, 'zr', 'zr', '0', NULL, NULL, '0', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '', '0001-01-01 00:00:00', 'admin', '2021-07-05 17:29:13', 'admin', '2021-08-02 16:53:04', '普通用户');
INSERT INTO `sys_user` VALUES (3, 100, 'editor', '编辑人员', '0', NULL, NULL, '2', '', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '0', '127.0.0.1', '2021-08-19 09:27:46', 'admin', '2021-08-18 18:24:53', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `userId` bigint(0) NOT NULL COMMENT '用户ID',
  `postId` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`userId`, `postId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (109, 116);
INSERT INTO `sys_user_role` VALUES (110, 2);

SET FOREIGN_KEY_CHECKS = 1;
