from django.contrib import admin
from .models import Usuario, Proveedor, Producto, Destino, Lote, LoteDet, Donacion, DonacionDetalle

admin.site.register(Usuario)
admin.site.register(Proveedor)
admin.site.register(Producto)
admin.site.register(Destino)
admin.site.register(Lote)
admin.site.register(LoteDet)
admin.site.register(Donacion)
admin.site.register(DonacionDetalle)
