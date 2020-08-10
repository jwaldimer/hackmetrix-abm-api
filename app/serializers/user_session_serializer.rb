class UserSessionSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :role,
             :jti
end
