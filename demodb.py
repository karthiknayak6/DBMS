from django.db import models

# Create your models here.
class Meeting(models.Model):
    meeting_code = models.CharField(max_length=30)
    meeting_dt = models.DateField(auto_now_add=True)
    meeting_subject = models.CharField(max_length=30)




from django.http import HttpResponse
from django.shortcuts import render

from demodatabase.models import Meeting

# Create your views here.
def data_save(request):
    m = Meeting(meeting_code="101", meeting_subject="django")
    m.save()
    m = Meeting(meeting_code="102", meeting_subject="python")
    m.save()
    m = Meeting(meeting_code="103", meeting_subject="java")
    m.save()
    m = Meeting(meeting_code="104", meeting_subject="golang")
    m.save()
    
    return HttpResponse("Data updated successfully")


def retrieve(request, activity, value):
    if activity == "like":
        meet_list = Meeting.objects.filter(meeting_subject__contains=value)
    elif activity == "get":
        meet_list = [Meeting.objects.get(meeting_code=value)]
    elif activity == "limit":
        meet_list = [Meeting.objects.all()[0]]
    elif activity == "filter":
        meet_list = Meeting.objects.filter(meeting_subject=value)
    else:
        meet_list = Meeting.objects.all()
    st = "<h1>Meetings pending are</h1> <br/>"
    for m in meet_list:
        st += f"ID: {m.meeting_code}: {m.meeting_subject} is on {m.meeting_dt} <br/>"
    return render(request, "index.html", {"meet_list":meet_list})

def update_data(request):
    item = Meeting.objects.get(meeting_code="104")
    item.meeting_subject = "golang advanced"
    item.save()
    return HttpResponse("Update success")

def delete_data(request):
    Meeting.objects.get(meeting_code='102').delete()
    return HttpResponse("Delete success")




<html>
    <head>
        <title>data</title>
    </head>
    <body>
        <h1>Meeting list</h1>
        <table border="border">
            <tr>
                <th>ID</th>
                <th>subject</th>
                <th>Date</th>
            </tr>
            {% for meet in meet_list%}
            <tr>
                <td>{{meet.meeting_code}}</td>
                <td>{{meet.meeting_subject}}</td>
                <td>{{meet.meeting_dt}}</td>
            </tr>
            {%endfor%}
        </table>
    </body>

</html>




             
