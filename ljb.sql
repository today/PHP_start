
drop database if exists mechanism;

create database mechanism character set utf8;  -- 创建数据库
use mechanism;-- 进入数据库
create table mechanism(-- 创建数据表(机构)
  id int unsigned not null auto_increment primary key,
  mechanismcoding char(32) not null,-- 机构编码-- mechanism coding
  superiorcoding char(32) not null,-- 上级编码-- superior coding
  lnstitutionalorder char(32) not null,-- 机构顺序-- lnstitutional order
  nameoforganization char(32) not null,-- 机构名称-- name of organization
  organizationdescription char(32) not null,-- 机构描述-- Organization description
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table user(-- 创建数据表（用户）
  id int unsigned not null auto_increment primary key,
  userorder char(32) not null,-- 用户顺序-- user order
  username char(8) not null,-- 用户名称-- user name
  userdescrption char(32) not null,-- 用户描述-- user descrption
  loginpassword char(16) not null,-- 登录密码-- login password
  rolename char(8) not null,-- 角色名称-- role name
  nameoforganization char(32),-- 用户配置-- name of organization
  whethertoenable char(8) not null,-- 是否启用-- whether to enable
  lastlandingtime date not null,-- 最后登陆时间-- last landing time
  landingfrequency char(16) not null,-- 登录次数-- landing frequency
  createdate datetime not null,-- 创建日期-- create date
  updatepersonnel char(8) not null,-- 更新人员-- update personnel
  updatetime date not null-- 更新时间-- update time
);
create table usersettings(-- 创建数据表（用户设置）
  number int unsigned not null auto_increment primary key,-- 编号
  setcode char(32) not null,-- 设置编码-- set code
  setname char(32) not null,-- 设置名称-- set name
  setvalue char(32) not null,-- 设置值-- set value
  description char(32) not null-- 描述说明-- description
);
create table function(-- 创建数据表（功能）
  id int unsigned not null auto_increment primary key,
  functioncoding char(32) not null,-- 功能编码-- function coding
  superiorcoding char(16) not null,-- 上级编码-- superior coding
  functionalsequence char(16) not null,-- 功能顺序-- functional sequence
  functiondescription char(32) not null,-- 功能描述-- function description
  functionname char(16) not null,-- 功能名称-- function name
  url char(200),--
  whethervisible char(8) not null,-- 是否可见-- whether visible
  whethertoenable char(8) not null,-- 是否启用-- whether toenable
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table codingtype(-- 创建数据表（编码类型）
  id int unsigned not null auto_increment primary key,
  codingtype char(16) not null,-- 编码类型-- coding type
  userorder char(16) not null,-- 类型顺序-- user order
  typename char(32) not null,-- 类型名称-- type name
  typedescription char(32),-- 类型描述-- type description
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table code(-- 创建数据表（编码）
  id int unsigned not null auto_increment primary key,
  code char(16) not null,-- 编码
  superiorcoding char(32),-- 上级编码-- superior coding
  typecode char(16),-- 类型编码-- type code
  typename char(32),-- 类型名称-- type name
  valueinenglish char(16),-- 英文值-- value in english
  chinesevalue char(16),-- 中文值-- chinese value
  whethertoenable char(8) not null,-- 是否启用-- whether to enable
  codingdescription char(32),-- 编码描述-- coding description
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table loginhistory(-- 创建数据表（登录历史）
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号-- number
  landingpersonnelnumber char(32),-- 登录人员编号-- landing personnel number
  loginname char(16) not null,-- 登录人员名称-- login name
  langingcharacternumber char(32) not null,-- 登录者角色编号-- langing character number
  characternameofthelander char(32) not null,-- 登录者角色名称-- character name of the lander
  clientmachinename char(16) not null,-- 客户端机器名-- client machine name
  clientip char(32) not null,-- 客户端IP-- client ip
  landingtime date not null,-- 登录时间-- landing time
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table systemlog(-- 创建数据表（系统日志）
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号--
  logsource char(32) not null,-- 日志来源-- log source
  logtypenumber char(32) not null,-- 日志类型编号-- log type number
  logtypename char(16) not null,-- 日志类型名称-- log type name
  logcontent text(10000),-- 日志内容-- log content
  journalnotes varchar(1000),-- 日志备注-- journal notes
  operatornumber char(32) not null,-- 操作人员编号-- operator number
  operatorname char(32) not null,-- 操作人员名称-- operator name
  logtime date not null,-- 日志时间-- log time
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table institutionaluser(-- 机构用户-- institutional user
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号
  mechanismcoding char(32) not null,-- 机构编码-- mechanism coding
  usercode char(32) not null-- 用户编码-- user code
);
create table userrole(-- 用户角色-- user role
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号
  usercode char(32) not null,-- 用户编码-- user code
  characterencoding char(32) not null-- 角色编码-- character encoding
);
create table rolefunction(-- 角色功能-- role function
  id int unsigned not null auto_increment primary key,
  code char(32) not null,-- 编码--
  characterencoding char(32) not null,-- 角色编码-- character encoding
  functioncoding char(32) not null-- 功能编码-- function coding
);

create table buttonlibrary(-- 按钮库-- button library
  id int unsigned not null auto_increment primary key,
  buttoncode char(32) not null,-- 按钮代码-- button code
  buttonname char(16) not null,-- 按钮名称-- button name
  buttonorder char(16),-- 顺序--
  lconname varchar(32),-- 图标名-- lcon name
  remarks text(1000),-- 备注--
  createdate date not null,-- 创建日期-- create date
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null,-- 更新时间-- Update time
  createpersonnel char(8) not null-- 创建人员-- Create personnel
);

create table mechanismrole(-- 机构角色-- mechanism role
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号
  characterencoding char(32) not null,-- 角色编码-- character encoding
  mechanismcoding char(32) not null-- 机构编码-- mechanism coding
);
create table menubutton(-- 菜单按钮-- menu button
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号--
  functioncoding char(32) not null,-- 功能编码-- function coding
  buttoncoding char(32) not null-- 按钮代码-- button coding
);
create table role(-- 角色--
  id int unsigned not null auto_increment primary key,
  characterencoding char(32) not null,-- 角色编码-- character encoding
  rolesequence char(32) not null,-- 角色顺序-- role sequence
  rolename char(32) not null,-- 角色名称-- role name
  roledescription text(1000),-- 角色描述-- role description
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table rolecolumnpermissions(-- 角色列权限-- role column permissions
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号
  characterencoding char(32) not null,-- 角色编码-- character encoding
  functioncoding char(32) not null,-- 功能编码-- function coding
  permissiontype char(16) not null,-- 权限类型-- permission type
  fieldname char(32) not null-- 字段名称-- field name
);
create table rolemenubutton(-- 角色菜单按钮-- role menu button
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号
  characternumber char(32) not null,-- 角色编号-- character number
  functioncoding char(32) not null,-- 功能编号-- functioncoding
  buttoncode char(32) not null-- 按钮代码-- button code
);
create table authorizationcode(-- 授权代码-- authorization code
  id int unsigned not null auto_increment primary key,
  authorizationcode char(86) not null,-- 授权代码-- authorization code
  authorizationname char(32) not null,-- 授权名称-- authorization name
  supervisorcode char(86) not null,-- 上级代码-- supervisor code
  createpersonnel char(8) not null,-- 创建人员-- Create personnel
  creationtime date not null,-- 创建时间-- Creation time
  updatepersonnel char(8) not null,-- 更新人员-- Update personnel
  updatetime date not null-- 更新时间-- Update time
);
create table roleauthorization(-- 角色授权-- role authorization
  id int unsigned not null auto_increment primary key,
  number char(32) not null,-- 编号
  characterencoding char(32) not null,-- 角色编码-- character encoding
  authorizationcode char(86) not null-- 授权代码-- authorization code
);

create table systemcode(-- 系统编码-- system code
  id int unsigned not null auto_increment primary key,
  parametervalues char(16) not null,-- 参数值-- parameter values
  whethertheusercanedit char(4) not null,-- 用户是否可编辑-- whether the user can edit
  codedescribe char(100),-- 描述
  creator char(16) not null,-- 创建者
  createdate date not null,-- 创建日期-- create date
  renewperson char(16) not null,-- 更新者-- renew person
  updatedate date not null-- 更新日期-- update date
);


create table test(--
  id int unsigned not null auto_increment primary key,
  year date not null-- 更新日期-- update date
);
