from rest_framework import serializers


from django.core.exceptions import ValidationError
import re

from AuthManager.models import UserProfile


class CustomPasswordValidator:
    """
    Custom password validator to check whether the password contains at least 1 letter, 1 digit, and 1 special character.
    """

    def validate(self, password, user=None):
        """
        Validate whether the password is valid or not.
        """
        if not re.findall('[a-zA-Z]', password):
            raise ValidationError("The password must contain at least 1 letter.")
        if not re.findall('[0-9]', password):
            raise ValidationError("The password must contain at least 1 digit.")
        if not re.findall('[!@#$%^&*(),.?":{}|<>]', password):
            raise ValidationError("The password must contain at least 1 special character.")


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = [
            'id', 'username', 'email', 'password', 'first_name',
            'last_name', 'country', 'state', 'city'
        ]
        extra_kwargs = {
            'password': {'write_only': True},
            'first_name': {'required': True},
            'last_name': {'required': True},
        }

    def validate_password(self, value):
        """
        Validate the password using the CustomPasswordValidator.
        """
        validator = CustomPasswordValidator()
        try:
            validator.validate(value)
        except ValidationError as e:
            raise serializers.ValidationError(e.messages)
        return value

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance

    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)
        if password is not None:
            instance.set_password(password)
        return super(UserProfileSerializer, self).update(instance, validated_data)


class LoginSerializer(serializers.Serializer):
    class Meta:
        model = UserProfile
        fields = ['email', 'password']

    email = serializers.EmailField(max_length=255, required=True)
    password = serializers.CharField(max_length=255, min_length=8, required=True)


class UserViewDataSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ['email', 'username', 'city', 'state', 'country']
