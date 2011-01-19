require 'rails/generators'

module Omnisocial
  module Generators
    class OmnisocialGenerator < Rails::Generators::Base

      desc 'Creates an omnisocial initializer and migration, and copies image and CSS assets.'

      def self.source_root
        File.join(File.dirname(__FILE__), 'templates')
      end

      def copy_initializer
        template 'omnisocial.rb', 'config/initializers/omnisocial.rb'
      end

      def copy_user_model
        template 'user.rb', 'app/models/user.rb'
      end

      def copy_assets
        copy_file 'assets/stylesheets/omnisocial.css',  'public/stylesheets/omnisocial.css'
        copy_file 'assets/images/twitter.gif',          'public/images/omnisocial/twitter.gif'
        copy_file 'assets/images/facebook.png',         'public/images/omnisocial/facebook.png'
        copy_file 'assets/images/signin_twitter.png',   'public/images/omnisocial/signin_twitter.png'
        copy_file 'assets/images/signin_facebook.png',  'public/images/omnisocial/signin_facebook.png'
      end

      def show_readme
        readme 'README' if behavior == :invoke
      end
    end
  end
end
