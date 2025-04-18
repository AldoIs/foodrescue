# Tienda Django

Proyecto Django para gestión de lotes y donaciones.

## Prerrequisitos

- Python 3.x  
- MariaDB o MySQL  
- Virtualenv  
- Cliente `mysql` en PATH (para importar el script `.sql`)

## Estructura del repositorio

```
├── .gitignore
├── clear_and_insert_lotes.sql    ← Script con datos dummy
├── manage.py
├── README.md
├── requirements.txt
├── tienda/
└── lotes/
```

## Instalación y puesta en marcha

1. **Clona el repositorio**  
   ```bash
   git clone <URL_DEL_REPO>
   cd <NOMBRE_DEL_REPO>
   ```

2. **Crea y activa un entorno virtual**  
   ```bash
   python -m venv .venv
   .venV/bin/activate      # Linux/macOS
   .venv\Scripts\activate # Windows
   ```

3. **Instala dependencias**  
   ```bash
   pip install -r requirements.txt
   ```

4. **Configura la base de datos**  
   - Crea la base de datos y el usuario en MariaDB/MySQL:
     ```sql
     CREATE DATABASE tienda CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
     CREATE USER 'django'@'localhost' IDENTIFIED BY 'TuPass123!';
     GRANT ALL PRIVILEGES ON tienda.* TO 'django'@'localhost';
     FLUSH PRIVILEGES;
     ```
   - Edita `tienda/settings.py` y ajusta la sección `DATABASES` con tus credenciales.

5. **Importa datos dummy**  
   El repositorio ya incluye el script `clear_and_insert_lotes.sql` en la raíz.  
   ```bash
   mysql -u root -p tienda < clear_and_insert_lotes.sql
   ```

6. **Ejecuta migraciones**  
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

7. **Crea un superusuario**  
   ```bash
   python manage.py createsuperuser
   ```

8. **Arranca el servidor de desarrollo**  
   ```bash
   python manage.py runserver
   ```

9. **Accede al sitio**  
   - Panel de administración: http://127.0.0.1:8000/admin  
   - Tus vistas CRUD (una vez implementadas): http://127.0.0.1:8000/lotes/

---

¡Listo! Con esto tendrás el proyecto preparado, la base de datos poblada y podrás empezar a trabajar en tus pantallas CRUD o extender la lógica de negocio.
