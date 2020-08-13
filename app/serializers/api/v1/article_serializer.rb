class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :text,
             :user_id
end