# Question1. Try out access specifiers for class methods

class Learning_Access_Modifiers
	def public_method
		puts 'Public method called'
		private_method
	end

	protected
	def protected_method
		puts 'Protected method called'
	end

	private
	def private_method
		puts 'Private method called'
	end	
end

class Sub_cls < Learning_Access_Modifiers
	def read_protected
		puts 'Sub-class method called'
		protected_method
	end
end

class Sub_sub_cls < Sub_cls
	def read_protected
		puts 'Sub-sub-class method called'
		protected_method
	end
end




obj1 = Learning_Access_Modifiers.new

obj1.public_method
# obj1.protected_method # Not possible , as protected methods 
			#are accessible in class and in nearest sub-class

# obj1.private_method # Not accessible outside class We are accessing this using public method of a class

obj2 = Sub_cls.new
obj2.read_protected  # Here protected is accessible

obj3 = Sub_sub_cls.new
obj3.read_protected  # This is also a sub-class of main class, so works

