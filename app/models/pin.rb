class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :board, optional: true
  has_one_attached :image

  # has_attached_file :image, :styles => { :medium =>"300x300>", :thumb =>"100x100>" }
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
