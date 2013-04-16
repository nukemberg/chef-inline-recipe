class Chef
	class Resource
		class InlineRecipe < Chef::Resource::RubyBlock
			def initialize(name, run_context=nil)
				super
				@resource_name = :inline_recipe
			end
		end
	end
end
