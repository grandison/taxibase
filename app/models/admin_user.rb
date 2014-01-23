# -*- encoding : utf-8 -*-
class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :level_id, :strict_password, :user_id
  # attr_accessible :title, :body
  belongs_to :level
  has_many :taxists

  def ability
    @ability ||= Ability.new(self)
  end
  delegate :can?, :cannot?, :to => :ability


  if ActiveRecord::Base.connection.table_exists?('admin_users') && column_names.include?(:strict_password)
    before_validation :set_strict_password
  end

  def checked_taxists
    Taxist.checked
  end

  def not_checked_taxists
    if can? :check, Taxist
      NotCheckedTaxist.not_checked
    else
      NotCheckedTaxist.not_checked.where("user_id = ?", self.id)
    end
  end

  private

  def set_strict_password
  	self.password = strict_password
  end
end
