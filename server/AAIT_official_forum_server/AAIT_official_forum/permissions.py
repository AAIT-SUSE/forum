from rest_framework import permissions
class IsOwnerOrReadOnly(permissions.BasePermission):
    def has_permission(self,request,view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.session.get('user') is not None

    def has_object_permission(self,request,view,User):
        if request.method in permissions.SAFE_METHODS:
            return True
        return User.username == request.data.get('user')