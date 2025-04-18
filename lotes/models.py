from django.db import models

class Usuario(models.Model):
    ROL_CHOICES = [('Gerente','Gerente'),('Almacen','Almacén')]
    nombre = models.CharField(max_length=100)
    login = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=128)
    rol = models.CharField(max_length=20, choices=ROL_CHOICES)

    def __str__(self):
        return f"{self.nombre} ({self.rol})"

class Proveedor(models.Model):
    nombre = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200, blank=True)
    contacto = models.CharField(max_length=100, blank=True)
    telefono = models.CharField(max_length=20, blank=True)
    email = models.EmailField(blank=True)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre

class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    unidad_medida = models.CharField(max_length=50)
    codigo_barras = models.CharField(max_length=50)

    def __str__(self):
        return self.nombre

class Destino(models.Model):
    nombre = models.CharField(max_length=200)
    direccion = models.CharField(max_length=200, blank=True)
    contacto = models.CharField(max_length=100, blank=True)
    telefono = models.CharField(max_length=20, blank=True)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre

class Lote(models.Model):
    codigo = models.CharField(max_length=50, unique=True)
    fecha_caducidad = models.DateField()
    fecha_recepcion = models.DateField()
    ubicacion = models.CharField(max_length=100)
    proveedor = models.ForeignKey(Proveedor, on_delete=models.PROTECT)
    usuario_captura = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    fecha_captura = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.codigo

class LoteDet(models.Model):
    lote = models.ForeignKey(Lote, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.RESTRICT)
    cantidad = models.IntegerField()
    usuario_captura = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    fecha_captura = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.lote} - {self.producto}"

class Donacion(models.Model):
    ESTADO_CHOICES = [('Autorizado','Autorizado'),('Pendiente','Pendiente'),('Enviado','Enviado')]
    fecha_donacion = models.DateTimeField()
    destino = models.ForeignKey(Destino, on_delete=models.PROTECT)
    usuario_autoriza = models.ForeignKey(Usuario, on_delete=models.PROTECT)
    comentario = models.TextField(blank=True)
    estado = models.CharField(max_length=20, choices=ESTADO_CHOICES)

    def __str__(self):
        return f"Donacion {self.id} - {self.destino}"

class DonacionDetalle(models.Model):
    donacion = models.ForeignKey(Donacion, on_delete=models.CASCADE)
    lote = models.ForeignKey(Lote, on_delete=models.RESTRICT)
    producto = models.ForeignKey(Producto, on_delete=models.RESTRICT)
    cantidad = models.IntegerField()

    def __str__(self):
        return f"{self.donacion} - {self.producto}"
