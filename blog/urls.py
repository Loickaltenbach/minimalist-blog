from django.urls import path

from .views import ArticleDetailView, ArticleListView

app_name = "blog"

urlpatterns = [
    path("", ArticleListView.as_view(), name="article_list"),
    path("article/<slug:slug>/", ArticleDetailView.as_view(), name="article_detail"),
]
