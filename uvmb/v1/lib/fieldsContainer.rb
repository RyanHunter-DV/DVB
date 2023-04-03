require 'svField.rb'

class FieldsContainer

	# refer to SVClass.classtype
	attr_accessor :classtype;

	attr :debug;
	attr :pool;

	def initialize(ct,d) ##{{{
		@debug=d;@classtype=ct;
		@pool={}; # registered pool for all fields.
	end ##}}}

	def register(f) ##{{{
		new = f.name;
		raise RunException.new("duplicated field declaration: #{new}") if @pool.has_key?(new);
		@pool[new] = f;
		__buildInstanceMethods__(f);
		return;
	end ##}}}
	def __buildInstanceMethods__(f) ##{{{
		setm = f.name.to_sym;
		@debug.print("create new method: #{setm}");
		self.define_singleton_method setm do
			return f;
		end
	end ##}}}

end
