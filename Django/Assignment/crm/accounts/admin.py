from django.contrib import admin

from .models import *


class CustomerAdmin(admin.ModelAdmin):
    search_fields = (
        "name",
        "phone",
        "email",
        "date_created",
    )
    list_display = (
        "name",
        "phone",
        "email",
        "address",
        "date_created",
    )


class ProductAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "price",
        "category",
        "desc",
        "date_created",
        # "tags",
    )


class OrderAdmin(admin.ModelAdmin):
    list_display = (
        "customer",
        "product",
        "date_created",
        "status",
        "note",
    )


admin.site.register(Customer, CustomerAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Tag)
admin.site.register(Order, OrderAdmin)