
module Orm
  module HasMany
    def self.extended(base)
      base.send(:include, InstanceMethods)
    end

    def has_many(klass)
      class_eval <<-RUBY
        def #{klass}
          @#{klass} ||= []
        end

        def #{klass}_add(post)
          #{klass} << post
        end

        def #{klass}_remove(post)
          #{klass}.delete(post)
        end

        def scream_#{klass}
          #{klass}.map { |e| scream(e)  }
        end
      RUBY
    end

    module InstanceMethods
      def scream(string)
        string.upcase
      end
    end
  end

  class Base
    extend HasMany
  end
end

class User < Orm::Base
  has_many :posts
  has_many :messages
end

u = User.new

puts u.posts.inspect

puts "==================="

u.posts_add("Post1")
u.posts_add("Post2")

u.messages_add("Message1")
u.messages_add("Message2")
u.messages_add("Message3")

puts u.posts.inspect
puts u.messages.inspect

puts "==================="

u.messages_remove("Message1")

puts u.posts.inspect
puts u.messages.inspect

puts "==================="

puts u.scream_posts.inspect
puts u.scream_messages.inspect
