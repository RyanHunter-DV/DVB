require 'debugger.rb'
require 'exceptions.rb'
require 'options.rb'


class MainEntry

	attr_accessor :debug;
	attr_accessor :options;

	attr :optionH;
	def initialize
		@debug = Debugger.new(true);
		@optionH = Options.new();
		@options = @optionH.options;
	end

	def run ##{{{
		sig = 0;
		begin
			Builder.setup;
			Builder.loadSource(@options[:entry]);
			Builder.finalize;
			Builder.publish;
		rescue RunException => e
			sig = e.process
		end
		return sig;
	end ##}}}

end
