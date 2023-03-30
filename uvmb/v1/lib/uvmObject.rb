class UVMObject < SVClass

	def initialize(cn,d) ##{{{
		super(cn,d);
	end ##}}}

	def publish ##{{{
		cnts = [];
		code();
		buildfile(cnts);
	end ##}}}
end


def uvm_object(name,&block) ##{{{
	Builder.createUVMObject(name,&block);
end ##}}}
