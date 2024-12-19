from django.db import models

class Pintura(models.Model):
    titulo = models.CharField(max_length=255)
    autor = models.CharField(max_length=255)
    descripcion = models.TextField()
    anio_creacion = models.IntegerField()
    tecnica = models.CharField(max_length=255)

    def __str__(self):
        return self.titulo
