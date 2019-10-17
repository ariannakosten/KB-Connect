class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise  :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :lockable, :timeoutable,
  :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

#create users from omniauth provider data entered in google/fb
def self.create_from_provider_data(provider_data)
where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |student|
  student.name = provider_data.info.name
  student.email = provider_data.info.email
  student.password = Devise.friendly_token[0, 20]
  student.skip_confirmation!
  end
end
    # user.provider = auth.provider
    # user.uid = auth.uid

end
