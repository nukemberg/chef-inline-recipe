class Chef
	class Provider
		class InlineRecipe < Chef::Provider::RubyBlock
			extend ::Chef::Provider::LWRPBase::InlineResources::ClassMethods
			include ::Chef::Provider::LWRPBase::InlineResources

			def action_run
				recipe_eval_with_update_check(&new_resource.block)
			end
		end
	end
end
