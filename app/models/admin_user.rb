# -*- encoding : utf-8 -*-
class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :level_id, :strict_password, :user_id, :first_phone, :second_phone, :third_phone, :scan_ogrn, :organization, :fio, :views_count
  # attr_accessible :title, :body
  belongs_to :level
  has_many :taxists

  validates :fio, :email, :first_phone, :strict_password, presence: true
  validates :scan_ogrn, presence: true, if: ->(admin_user){admin_user.organization.present?}
  validates :email, uniqueness: true
  validates :email, presence: true, unless: :first_phone?
  validates :first_phone, presence: true, unless: :email?

  mount_uploader :scan_ogrn, PhotoUploader

  def ability
    @ability ||= Ability.new(self)
  end
  delegate :can?, :cannot?, :to => :ability


  if ActiveRecord::Base.connection.table_exists?('admin_users') && column_names.include?("strict_password")
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

  def reduce_views_count
    if self.views_count > 0
      self.views_count -= 1
      self.save
    end
  end

  private

  def set_strict_password
    if strict_password_changed?
    	self.password = strict_password
    end
  end
end
