require 'debugger.rb'
require 'uvmObject.rb'

module Builder

	attr :debug;
	attr :targets;

	def self.setup ##{{{
		@debug = Debugger.new(true);
		@targets=[];
	end ##}}}

	def self.createUVMObject(name,&block) ##{{{
		uo = UVMObject.new(name,@debug);
		uo.instance_eval &block;
		@targets << uo;
	end ##}}}
	def self.finalize ##{{{
	end ##}}}
	def self.publish ##{{{
		@targets.each do |o|
			o.publish;
		end
	end ##}}}
end
