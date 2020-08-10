class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :name,
             :last_name,
             :gender,
             :description,
             :jti,
             :role,
             :created_at,
             :updated_at
end
