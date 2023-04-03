require 'svField.rb'
require 'fieldsContainer.rb'
class SVClass < SVFile

	attr_accessor :classname;
	attr_accessor :basename;

	attr :extension;
	attr :fields;

	attr_accessor :classtype; # :sv, :uvm_object, :uvm_component
	def initialize(cn,ct,d) ##{{{
		@classname=cn;@classtype=ct;
		fn = setupFileName;
		super(fn,d);
		@fields = FieldsContainer.new(@classtype,d);
	end ##}}}
	def setupFileName ##{{{
		@extension='.svh';
		fn = @classname+@extension;
		fn[0..0].downcase!;
		return fn;
	end ##}}}
	def code(usage) ##{{{
	end ##}}}

	def base(name) ##{{{
		"""
		setup base class name by user.
		"""
		@basename = name;
	end ##}}}

	# user input example
	# field 'int a'
	# field 'int a =10'
	# field 'int aa[int]'
	def field(expr) ##{{{
		"""
		declare a new field
		"""
		fd = SVField.new(expr,@debug);
		@fields.register(fd);
	end ##}}}
end
