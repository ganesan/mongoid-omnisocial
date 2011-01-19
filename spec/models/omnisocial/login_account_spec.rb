require 'spec_helper'

module Omnisocial
  describe LoginAccount do
    it { should be_embedded_in(:user) }
    it { should have_field(:remote_account_id).of_type(String) }
    it { should have_field(:name).of_type(String) }
    it { should have_field(:login).of_type(String) }
    it { should have_field(:picture_url).of_type(String) }
    it { should have_field(:access_token).of_type(String) }

    it "::find_or_create_from_auth_hash"

    it "::create_from_auth_hash"

    it "#find_or_create_user"
  end
end
