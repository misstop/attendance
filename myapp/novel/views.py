from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.shortcuts import redirect
from django.core import serializers
import json

from .models import User, EmployeeInfo, Articles, Comments, Reply, Attendance, Statistics, Overtime, Vacate, Leave


# 首页
def index(request):
    return render(request, 'novel/index.html')


# 常用
def common(request):
    s_in = request.session['sign_in']
    s_out = request.session['sign_out']
    return render(request, 'novel/common.html', {'sign_in': s_in, 'sign_out': s_out})


# 工作
def work(request):
    return render(request, 'novel/work.html')


# 沟通
def communicate(request):
    article = Articles.objects.all()
    if request.session['q']:
        q = request.session['q']
        article_list = Articles.objects.filter(title__icontains=q)
        if len(article_list) >= 1:
            return render(request, 'novel/communicate.html', {
                'article': article, 'article_list': article_list, 'error_msg': '',
            })
        else:
            return render(request, 'novel/communicate.html', {
                'article': article, 'article_list': '', 'error_msg': '无查询结果',
            })
    else:
        return render(request, 'novel/communicate.html', {
            'article': article, 'article_list': '', 'error_msg': '',
        })


# 我的
def mine(request):
    emp_id = request.session['empID']
    user = EmployeeInfo.objects.filter(empID=emp_id)
    if len(user) >= 1:
        return render(request, 'novel/mine.html', {'user': user[0]})
    else:
        return render(request, 'novel/mine.html', {'user': ''})


# 登录视图函数
def login(request):
    if request.method == "GET":
        return render(request, 'novel/login.html')
    elif request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        try:
            user = User.objects.get(userName=username)
        except Exception:
            message = {"status": 404, "msg": "user does not exist"}
            return JsonResponse(message)
        else:
            if user.userPassword == password:
                message = {"status": 200, "msg": "success"}
                request.session['empID'] = user.empID
                request.session['q'] = ''
                request.session['sign_in'] = ''
                request.session['sign_out'] = ''
            else:
                message = {"status": 403, "msg": "password error"}
            return JsonResponse(message)


# 完善个人信息
def userInfo(request):
    # EmployeeInfo.objects.create(user='yangmv', pwd='123456')
    # 或者
    # obj = models.UserInfo(user='yangmv', pwd='123456')
    # obj.save()
    # 或者
    dic = {'empID': request.session['empID'],
           'name': request.GET['name'],
           'dept': request.GET['dept'],
           'sex': request.GET['sex'],
           'address': request.GET['address'],
           'phone': request.GET['phone'],
           'ownEmail': request.GET['mail'],
           }
    EmployeeInfo.objects.create(**dic)
    return redirect('mine')


# 签到
def sign_in(request):
    empID = request.session['empID']
    dic1 = {
        'empID': empID,
        'attNum': 1,
    }
    Attendance.objects.create(**dic1)
    sta = Statistics.objects.filter(empID=empID)
    if len(sta) >= 1:
        s = sta[0]
        s.attNum = s.attNum + 1
        s.save()
        request.session['sign_in'] = 1
        return redirect('common')
    else:
        Statistics.objects.create(
            empID=empID, attNum=1,
        )
        request.session['sign_in'] = 1
        return redirect('common')


# 签退
def sign_out(request):
    request.session['sign_out'] = 1
    return redirect('common')


# 加班
def over_time(request):
    if request.method == "GET":
        return render(request, 'novel/overtime.html')
    elif request.method == "POST":
        empID = request.session['empID']
        dic = {
            'empID': empID,
            'overType': request.POST['overType'],
            'staTime': request.POST['staTime'],
            'endTime': request.POST['endTime'],
        }
        Overtime.objects.create(**dic)
        sta = Statistics.objects.filter(empID=empID)
        # 如果查到该用户的统计数据，更新加班记录即可
        if len(sta) >= 1:
            s = sta[0]
            s.oveNum = s.oveNum + 1
            s.save()
            return render(request, 'novel/overtime.html', {'msg': 'OK! 已提交'})
        # 如果查不到该用户的统计数据，创建该用户的统计数据
        else:
            Statistics.objects.create(
                empID=empID, oveNum=1,
            )
            return render(request, 'novel/overtime.html', {'msg': 'OK! 已提交'})


# 请假
def vacate(request):
    if request.method == "GET":
        return render(request, 'novel/vacate.html')
    elif request.method == "POST":
        empID = request.session['empID']
        dic = {
            'empID': empID,
            'vacateType': '未审核',
            'vReason': request.POST['vReason'],
            'staTime': request.POST['staTime'],
            'endTime': request.POST['endTime'],
        }
        Vacate.objects.create(**dic)
        return render(request, 'novel/vacate.html', {'msg': 'OK! 已提交'})


# 请假审核
def vacate_check(request):
    ls = []
    empID = request.session['empID']
    if empID == '113':
        vl = Vacate.objects.all()
        for v in vl:
            e = EmployeeInfo.objects.get(empID=v.empID)
            dic = {
                'id': v.id,
                'name': e.name,
                'reason': v.vReason,
                'staTime': v.staTime,
                'endTime': v.endTime,
                'status': v.vacateType,
            }
            ls.append(dic)
        return render(request, 'novel/vacate_check.html', {'ls': ls, 'role': 'admin'})
    else:
        vl = Vacate.objects.filter(empID=empID)
        if len(vl) >= 1:
            for v in vl:
                e = EmployeeInfo.objects.get(empID=v.empID)
                dic = {
                    'name': e.name,
                    'reason': v.vReason,
                    'staTime': v.staTime,
                    'endTime': v.endTime,
                    'status': v.vacateType,
                }
                ls.append(dic)
            return render(request, 'novel/vacate_check.html', {'ls': ls, 'role': 'common'})
        else:
            return render(request, 'novel/vacate_check.html', {'msg': '无本人请假申请记录'})


# 同意请假
def vacate_agree(request, vid):
    v = Vacate.objects.get(id=vid)
    v.vacateType = '已同意'
    v.save()
    sta = Statistics.objects.filter(empID=v.empID)
    # 如果查到该用户的统计数据，更新请假记录即可
    if len(sta) >= 1:
        s = sta[0]
        s.vacNum = s.vacNum + 1
        s.save()
        return redirect('vacateCheck')
    # 如果查不到该用户的统计数据，创建该用户的统计数据
    else:
        Statistics.objects.create(
            empID=v.empID, vacNum=1,
        )
        return redirect('vacateCheck')


# 外出
def leave(request):
    if request.method == "GET":
        return render(request, 'novel/leave.html')
    elif request.method == "POST":
        empID = request.session['empID']
        dic = {
            'empID': empID,
            'leaveType': '未审核',
            'leaveReason': request.POST['lReason'],
            'staTime': request.POST['staTime'],
            'endTime': request.POST['endTime'],
        }
        Leave.objects.create(**dic)
        return render(request, 'novel/leave.html', {'msg': 'OK! 已提交'})


# 外出审核
def leave_check(request):
    ls = []
    empID = request.session['empID']
    if empID == '113':
        vl = Leave.objects.all()
        for v in vl:
            e = EmployeeInfo.objects.get(empID=v.empID)
            dic = {
                'id': v.id,
                'name': e.name,
                'reason': v.leaveReason,
                'staTime': v.staTime,
                'endTime': v.endTime,
                'status': v.leaveType,
            }
            ls.append(dic)
        return render(request, 'novel/leave_check.html', {'ls': ls, 'role': 'admin'})
    else:
        vl = Leave.objects.filter(empID=empID)
        if len(vl) >= 1:
            for v in vl:
                e = EmployeeInfo.objects.get(empID=v.empID)
                dic = {
                    'name': e.name,
                    'reason': v.leaveReason,
                    'staTime': v.staTime,
                    'endTime': v.endTime,
                    'status': v.leaveType,
                }
                ls.append(dic)
            return render(request, 'novel/leave_check.html', {'ls': ls, 'role': 'common'})
        else:
            return render(request, 'novel/leave_check.html', {'msg': '无本人外出申请记录'})


# 同意外出
def leave_agree(request, vid):
    v = Leave.objects.get(id=vid)
    v.leaveType = '已同意'
    v.save()
    sta = Statistics.objects.filter(empID=v.empID)
    # 如果查到该用户的统计数据，更新外出记录即可
    if len(sta) >= 1:
        s = sta[0]
        s.leaNum = s.leaNum + 1
        s.save()
        return redirect('leaveCheck')
    # 如果查不到该用户的统计数据，创建该用户的统计数据
    else:
        Statistics.objects.create(
            empID=v.empID, leaNum=1,
        )
        return redirect('leaveCheck')


# 统计
def stat(request):
    ls = []
    sta = Statistics.objects.all()
    for s in sta:
        user = EmployeeInfo.objects.get(empID=s.empID)
        dic = {
            'name': user.name,
            'sex': user.sex,
            'empID': s.empID,
            'attNum': s.attNum,
            'oveNum': s.oveNum,
            'vacNum': s.vacNum,
            'leaNum': s.leaNum,
        }
        ls.append(dic)

    return render(request, 'novel/stat.html', {'ls': ls})


# 贴吧交流
def interFlow(request):
    empID = request.session['empID']
    user = EmployeeInfo.objects.get(empID=empID)
    author = user.name
    dic = {
        'title': request.POST['title'],
        'content': request.POST['question'],
        'author': author,
           }
    Articles.objects.create(**dic)
    return redirect('communicate')


# 贴吧搜索
def searchArticle(request):
    q = request.GET.get('q')
    request.session['q'] = q
    return redirect('communicate')


# 统计搜索
def searchStat(request):
    # q = request.GET.get('q')
    # userInfo = EmployeeInfo.objects.filter(title__icontains=q)
    pass


# 签到二维码
def qr_code(request):
    return render(request, 'novel/sign_in.html')


# 签退二维码
def qr_codeB(request):
    return render(request, 'novel/sign_out.html')
