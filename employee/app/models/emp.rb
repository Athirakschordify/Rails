class Emp < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
    validates :email, presence: true
    validates :age,presence: true
    validates :languages_known,presence: true
    mount_uploader :image, AvatarUploader


end
