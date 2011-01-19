require 'spec_helper'

module Omnisocial
  describe User do
    let(:user) do
      User.new
    end

    let(:login_account) do
      double('login_account',
        :login        => 'login',
        :name         => 'name',
        :picture_url  => 'picture_url',
        :account_url  => 'account_url',
        :access_token => 'access_token'
      )
    end

    it { should have_field(:remember_token).of_type(String) }
    it { should embed_one(:login_account) }

    it "#login" do
      user.should_receive(:login_account).twice.and_return(login_account)
      user.login.should == 'login'
    end

    it "#name" do
      user.should_receive(:login_account).twice.and_return(login_account)
      user.name.should == 'name'
    end

    it "#picture_url" do
      user.should_receive(:login_account).twice.and_return(login_account)
      user.picture_url.should == 'picture_url'
    end

    it "#account_url" do
      user.should_receive(:login_account).twice.and_return(login_account)
      user.account_url.should == 'account_url'
    end

    it "#access_token" do
      user.should_receive(:login_account).twice.and_return(login_account)
      user.access_token.should == 'access_token'
    end

    it "#to_param"

    it "#from_twitter?" do
      user.should_receive(:login_account).and_return(TwitterAccount.new)
      user.from_twitter?.should be_true
    end

    it "#from_facebook?" do
      user.should_receive(:login_account).and_return(FacebookAccount.new)
      user.from_facebook?.should be_true
    end

    it "#remember" do
      user.should_receive(:new_record?).and_return(false)
      user.should_receive(:login_account).and_return(TwitterAccount.new)
      user.should_receive(:login).and_return('login')
      ::BCrypt::Password.should_receive(:create).with(instance_of(String)).and_return('fake')
      user.should_receive(:update_attributes).with(:remember_token => 'fake')
      user.remember
    end

    it "#forget" do
      user.should_receive(:new_record?).and_return(false)
      user.should_receive(:update_attributes).with(:remember_token => nil)
      user.forget
    end
  end
end
