from django.db import models


# 1.用户表
class User(models.Model):
    # 账号
    userName = models.CharField(max_length=100, unique=True)
    # 密码
    userPassword = models.CharField(max_length=255)
    # 员工号
    empID = models.CharField(max_length=200, db_index=True)
    # 角色
    role = models.CharField(max_length=100, default='employee')
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 2.员工信息表
class EmployeeInfo(models.Model):
    # 员工号
    empID = models.CharField(max_length=200, db_index=True)
    # 姓名
    name = models.CharField(max_length=50)
    # 所属部门
    dept = models.CharField(max_length=200)
    # 性别
    sex = models.CharField(max_length=50)
    # 地址
    address = models.CharField(max_length=200)
    # 手机号
    phone = models.CharField(max_length=200)
    # 邮箱
    ownEmail = models.CharField(max_length=200)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 3.签到表
class Attendance(models.Model):
    # 员工号
    empID = models.CharField(max_length=200, db_index=True)
    # 签到为1，未签到为0，每天0点重置该字段
    attNum = models.IntegerField(default=0)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 4.加班表
class Overtime(models.Model):
    # 员工号
    empID = models.CharField(max_length=200, db_index=True)
    # 加班类型
    overType = models.CharField(max_length=50)
    # 起始时间
    staTime = models.CharField(max_length=200)
    # 结束时间
    endTime = models.CharField(max_length=200)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 5.请假表
class Vacate(models.Model):
    # 员工号
    empID = models.CharField(max_length=200, db_index=True)
    # 请假审核状态
    vacateType = models.CharField(max_length=50)
    # 请假原因
    vReason = models.CharField(max_length=200)
    # 起始时间
    staTime = models.CharField(max_length=200)
    # 结束时间
    endTime = models.CharField(max_length=200)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 6.外出表
class Leave(models.Model):
    # 员工号
    empID = models.CharField(max_length=200, db_index=True)
    # 外出审核状态
    leaveType = models.CharField(max_length=50)
    # 外出原因
    leaveReason = models.CharField(max_length=200)
    # 起始时间
    staTime = models.CharField(max_length=200)
    # 结束时间
    endTime = models.CharField(max_length=200)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 7.统计表
class Statistics(models.Model):
    # 员工号
    empID = models.CharField(max_length=200, db_index=True)
    # 本月当前签到次数
    attNum = models.IntegerField(default=0)
    # 本月当前加班次数
    oveNum = models.IntegerField(default=0)
    # 本月当前请假次数
    vacNum = models.IntegerField(default=0)
    # 本月当前外出次数
    leaNum = models.IntegerField(default=0)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 8.文章表
class Articles(models.Model):
    # 发帖人
    author = models.CharField(max_length=200, db_index=True)
    # 标题
    title = models.CharField(max_length=100)
    # 内容
    content = models.TextField()
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 评论表
class Comments(models.Model):
    # 评论人
    author = models.CharField(max_length=200, db_index=True)
    # 内容
    content = models.TextField()
    # 与文章表关联
    articles = models.ForeignKey(Articles, on_delete=models.CASCADE)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)


# 回复表
class Reply(models.Model):
    # 回复人
    author = models.CharField(max_length=200, db_index=True)
    # 内容
    content = models.TextField()
    # 与评论表关联
    comment = models.ForeignKey(Comments, on_delete=models.CASCADE)
    # 创建时间
    created_at = models.DateTimeField(auto_now_add=True)
    # 更新时间
    updated_at = models.DateTimeField(auto_now=True)
