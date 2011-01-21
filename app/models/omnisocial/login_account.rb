module Omnisocial
  class LoginAccount
    include Mongoid::Document

    field :remote_account_id, :type => String
    field :name, :type => String
    field :login, :type => String
    field :picture_url, :type => String
    field :access_token, :type => String

    referenced_in :user

    class << self
      def find_or_create_from_auth_hash(auth_hash)
        if (account = first(:conditions => { :remote_account_id => auth_hash['uid'] }))
          account.assign_account_info(auth_hash)
          account.save
          account
        else
          create_from_auth_hash(auth_hash)
        end
      end

      def create_from_auth_hash(auth_hash)
        create do |account|
          account.assign_account_info(auth_hash)
        end
      end
    end

    def find_or_create_user
      return self.user if self.user

      ::User.create do |user|
        user.login_account = self
      end
    end
  end
end
