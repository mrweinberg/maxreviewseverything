# frozen_string_literal: true

class User < ApplicationRecord
  ADMIN_EMAILS = ['maxxthepenguin@gmail.com'].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create!(name: data['name'],
                          email: data['email'],
                          password: Devise.friendly_token[0, 20])

    user
  end

  def admin?
    ADMIN_EMAILS.include?(email)
  end
end