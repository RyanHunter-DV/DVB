require 'svTypes.rb'
class SVField

	attr_accessor :flag; # for UVM field utils
	attr :qualifier; # 'local', 'static' ...
	attr :sign; # 'unsigned', 'signed' for int.

	attr :debug;
	attr :fieldtype; # object of SVLogic, SVInt etc.
	def initialize(expr,d) ##{{{
		@debug=d;
		setup(expr);
	end ##}}}

	# scalar formats:
	# int a [= default]
	# bit [xxx] v [= default]
	# Class#(xxx) C [= default]
	def setup(expr) ##{{{
		processInt(expr) if /^int/=~expr or /^uint/=~expr;
		processVector(expr) if /^bit/=~expr or /^logic/=~expr;
	end ##}}}

	def processInt(expr) ##{{{
		@fieldtype = 'int';
		@sign = 'unsigned' if /^uint/=~expr;
		scalarp = Regexp.union("(\w+) +(\S+)$","(\w+) +(\S+) += +(\d+)");
		md = scalarp.match(expr);
		if md
			# MARK
		end
		
	end ##}}}

	def qualifier(q='',precedence=false) ##{{{
		return @qualifier if q=='';
		@qualifier = %Q|#{@qualifier} #{q}| if precedence;
		@qualifier = %Q|#{q} #{@qualifier}|;
		return;
	end ##}}}
end
