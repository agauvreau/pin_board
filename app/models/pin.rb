class Pin < ApplicationRecord
    #each pin can only have one user
    belongs_to :user
    #this is from the paperclip gem page, you can also put a default image , default_url: "/images/:style/missing.png"
    #just changed :avatar to :image for clarity reason.
    has_attached_file :image, styles: { medium: "300x300>"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
