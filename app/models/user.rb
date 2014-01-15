class User < ActiveRecord::Base
  has_many :reviews

  validates :username, :uniqueness => {case_sensitive: false}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login] # ** so user can use email or password for auth. **


  # for devise
  def login=(login)
    @login = login
  end

  # for devise to use either parameter for user auth.
  def login
    unless @login
      self.username ? self.username : self.email
    else
      @login
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end # of class
