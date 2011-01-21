module Omnisocial
  class User
    include Mongoid::Document
    include Mongoid::Timestamps

    field :remember_token, :type => String

    references_one :login_account, :class_name => 'Omnisocial::LoginAccount'

    def login
      login_account.login unless login_account.nil?
    end

    def name
      login_account.name unless login_account.nil?
    end

    def picture_url
      login_account.picture_url unless login_account.nil?
    end

    def account_url
      login_account.account_url unless login_account.nil?
    end

    def access_token
      login_account.access_token unless login_account.nil?
    end

    def to_param
      if !self.login.include?('profile.php?')
        "#{self.id}-#{self.login.gsub('.', '-')}"
      else
        self.id.to_s
      end
    end

    def from_twitter?
      login_account.kind_of? TwitterAccount
    end

    def from_facebook?
      login_account.kind_of? FacebookAccount
    end

    def remember
      update_attributes(:remember_token => ::BCrypt::Password.create("#{Time.now}-#{self.login_account.class}-#{self.login}")) unless new_record?
    end

    def forget
      update_attributes(:remember_token => nil) unless new_record?
    end
  end
end