from rest_framework import serializers
from .models import User


# Serializer for the User model
class UserSerializer(serializers.ModelSerializer):
    # Metaclass containing model information and field details
    class Meta:
        model = User
        fields = ['id', 'name', 'email', 'password']
        extra_kwargs = {
            'password': {'write_only': True}  # Setting password as write-only field
        }

    # Custom create method to handle object creation
    def create(self, validated_data):
        # Extract password from validated data and remove it from the dictionary
        password = validated_data.pop('password', None)

        # Create a new instance of the User model with the provided validated data
        instance = self.Meta.model(**validated_data)

        # If a password is provided, set the password for the user instance
        if password is not None:
            instance.set_password(password)

        # Save the user instance to the database
        instance.save()
        return instance
