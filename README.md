# Minimalist Blog Django

A simple and elegant blog built with Django, prioritizing simplicity and readability with a modern, responsive design.

## ✨ Features

- **Models**: Article and Category with proper relationships
- **Views**: Paginated ListView and DetailView for articles
- **Templates**: Modern minimalist design with responsive layout
- **Administration**: Configured admin interface for content management
- **Pagination**: Paginated article display (5 per page)
- **Multilingual**: Available in French and English
- **Modern UI**: Contemporary design with CSS custom properties and hover effects

## 🏗 Model Structure

### Article

- `title`: CharField (max 255 characters)
- `slug`: SlugField unique, auto-generated from title
- `content`: TextField for full article content
- `published_date`: DateTimeField with auto_now_add
- `category`: ForeignKey to Category
- `author`: ForeignKey to User

### Category

- `name`: CharField unique for category name

## 🚀 Installation and Usage

1. **Install dependencies**:

   ```bash
   pip install -r requirements.txt
   ```

2. **Run migrations**:

   ```bash
   python manage.py migrate
   ```

3. **Create superuser**:

   ```bash
   python manage.py createsuperuser
   ```

4. **Load sample data** (optional):

   ```bash
   python manage.py loaddata blog/fixtures/english_data.json
   ```

5. **Start development server**:

   ```bash
   python manage.py runserver
   ```

6. **Access the blog**:

   - Blog: <http://127.0.0.1:8000/>
   - Administration: <http://127.0.0.1:8000/admin/>

## 🔗 URLs

- `/`: Article list with pagination
- `/article/<slug>/`: Article detail view
- `/admin/`: Administration interface

## 🎨 Design Features

The blog features a modern minimalist design with:

- Contemporary typography (Inter + Playfair Display)
- Sophisticated color palette with CSS custom properties
- Centered, airy layout with proper whitespace
- Card-based design for articles
- Smooth animations and hover effects
- Responsive design for all devices
- Modern pagination with elegant styling
- Category tags with gradient backgrounds

## ⚡ Quick Setup Scripts

- `./setup_english.py`: Complete setup with English content
- `./setup.sh`: Automated installation script

## 🛠 Development

The project follows Django best practices:

- Models with `__str__()` and `get_absolute_url()` methods
- Class-based views (CBV)
- Template inheritance with modern CSS
- Custom admin configuration
- Named URLs with namespace
- Responsive design patterns
- Modern CSS with custom properties
