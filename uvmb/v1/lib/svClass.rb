class SVClass < SVFile

	attr_accessor :classname;
	attr_accessor :basename;

	attr :extension;
	def initialize(cn,d) ##{{{
		@classname=cn;
		fn = setupFileName;
		super(fn,d);
	end ##}}}
	def setupFileName ##{{{
		@extension='.svh';
		fn = @classname+@extension;
		fn[0..0].downcase!;
		return fn;
	end ##}}}


end
