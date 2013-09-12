class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  has_many :favorite_recipes
  has_many :basketed_recipes


  validate :validate_on_provider_presence

  def last_position
    favorite_recipes.count + 1
  end

  def basket
    @basket ||= Basket.new(self)
  end

  def favorites
    @favorites ||= Favorites.new(self)
  end

  def in_basket?(recipe)
    basket.include?(recipe)
  end

  def in_favorites?(recipe)
    favorites.include?(recipe)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    user = where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth["provider"]
      puts "*" * 100
      p auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      # user.image = auth["info"]["image"]
      user.email = auth["info"]["email"]
      # user.gender = auth["extra"]["raw_info"]["gender"]
      # user.token = auth["credentials"]["token"]
    end
    p auth
    "*" * 100
    p user
    user.save
    user
  end

  private

  def validate_on_provider_presence
    unless self.provider.nil?
      if !self.email.nil? && !self.password_hash.nil? 
        return
      else
        errors.add(:email, "needs email") if self.email.nil?
        errors.add(:email, "needs password") if self.password_hash.nil?
      end
    end
  end


end
