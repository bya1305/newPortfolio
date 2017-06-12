class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumbnail
  after_initialize :set_defaults

  def self.angular
    where(subtitle: "Angular")
  end

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumbnail ||= "http://via.placeholder.com/350x200"
  end
end
