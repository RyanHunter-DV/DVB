class SVFile
	attr :debug;

	attr_accessor :filename;
	attr :path;

	def initialize(fn,d) ##{{{
		@filename = fn;
		@debug = d;
		@path  = './'; #default
	end ##}}}
	def path(p) ##{{{
		@path = p;
	end ##}}}
	def filemacro ##{{{
		codes=[];
		macro = @filename.sub(/\./,'__');
		codes << %Q|`ifndef #{macro}|;
		codes << %Q|`define #{macro}|;
		return codes;
	end ##}}}
	def filemacroend ##{{{
		return ['`endif'];
	end ##}}}
	def buildfile(cnts) ##{{{
		fop = FileOperator.new(@filename,@debug);
		fop.path= @path;
		fop.writefile(cnts);
	end ##}}}
end
