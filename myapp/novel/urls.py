from django.urls import path, re_path
from django.views.generic import TemplateView

from . import views

urlpatterns = [
    path('index/', views.index, name='index'),
    path('login/', views.login, name='login'),
    path('index/common.html', views.common, name='common'),
    path('index/work.html', views.work, name='work'),
    path('index/communicate.html', views.communicate, name='communicate'),
    path('index/mine.html', views.mine, name='mine'),

    # 完善个人信息
    path('index/mine/userInfo', views.userInfo, name='userInfo'),

    # 签到二维码
    path('index/common/qrCode', views.qr_code, name='qrCode'),

    # 签退二维码
    path('index/common/qrCodeB', views.qr_codeB, name='qrCodeB'),

    # 签到
    path('index/common/signIn', views.sign_in, name='signIn'),

    # 签退
    path('index/common/signOut', views.sign_out, name='signOut'),

    # 加班
    path('index/common/overTime', views.over_time, name='overTime'),

    # 请假
    path('index/common/vacate', views.vacate, name='vacate'),

    # 请假审批
    path('index/work/vacateCheck', views.vacate_check, name='vacateCheck'),

    # 同意请假
    re_path('^work/vacateAgree/(.+)/$', views.vacate_agree, name='vacateAgree'),

    # 外出
    path('index/common/leave', views.leave, name='leave'),

    # 外出审批
    path('index/work/leaveCheck', views.leave_check, name='leaveCheck'),

    # 同意外出
    re_path('^work/leaveAgree/(.+)/$', views.leave_agree, name='leaveAgree'),

    # 统计
    path('index/common/statInfo', views.stat, name='stat'),

    # 发表文章
    path('index/communicate/postMessage', views.interFlow, name='interFlow'),

    # 搜索文章
    path('index/communicate/search', views.searchArticle, name='searchArticle'),

    # 搜索统计结果
    path('index/stat/search', views.searchStat, name='searchStat'),

]
