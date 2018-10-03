class PinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :description, :image_file_name, :created_at, :pin_url
  include Rails.application.routes.url_helpers
  belongs_to :user
  # has_one_attached :image

  def pin_url
    rails_blob_path(object.image, only_path: true)
  end
end
