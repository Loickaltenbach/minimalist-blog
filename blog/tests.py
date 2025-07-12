from django.test import TestCase, Client
from django.contrib.auth.models import User
from django.urls import reverse
from .models import Category, Article


class ModelTests(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            username='testuser',
            email='test@example.com',
            password='testpass123'
        )
        self.category = Category.objects.create(name='Test Category')
    
    def test_category_str(self):
        self.assertEqual(str(self.category), 'Test Category')
    
    def test_article_creation(self):
        article = Article.objects.create(
            title='Test Article',
            content='This is a test article content.',
            category=self.category,
            author=self.user
        )
        self.assertEqual(str(article), 'Test Article')
        self.assertEqual(article.slug, 'test-article')
        self.assertEqual(article.category, self.category)
        self.assertEqual(article.author, self.user)


class ViewTests(TestCase):
    def setUp(self):
        self.client = Client()
        self.user = User.objects.create_user(
            username='testuser',
            email='test@example.com',
            password='testpass123'
        )
        self.category = Category.objects.create(name='Test Category')
        self.article = Article.objects.create(
            title='Test Article',
            content='This is a test article content.',
            category=self.category,
            author=self.user
        )
    
    def test_article_list_view(self):
        response = self.client.get(reverse('blog:article_list'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Test Article')
        self.assertContains(response, 'Test Category')
    
    def test_article_detail_view(self):
        response = self.client.get(
            reverse('blog:article_detail', kwargs={'slug': self.article.slug})
        )
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Test Article')
        self.assertContains(response, 'This is a test article content.')
    
    def test_category_filtering(self):
        response = self.client.get(
            reverse('blog:article_list') + f'?category={self.category.pk}'
        )
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Test Article')


class AdminTests(TestCase):
    def setUp(self):
        self.user = User.objects.create_superuser(
            username='admin',
            email='admin@example.com',
            password='adminpass123'
        )
        self.client = Client()
    
    def test_admin_login(self):
        response = self.client.post('/admin/login/', {
            'username': 'admin',
            'password': 'adminpass123'
        })
        self.assertEqual(response.status_code, 302)  # Redirect after login
