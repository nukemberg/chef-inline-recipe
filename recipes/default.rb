#
# Cookbook Name:: inline_recipe
# Recipe:: default
#
# Copyright (C) 2013 Avishai Ish-Shalom
# 
# License: Apache v2
#

inline_recipe "test" do
	block do
		log "testing resource group"
		file "/tmp/test1" do
			mode "0600"
		end
	end
	action :nothing
	notifies :write, "log[test]"
  only_if { ::File.exists? "/tmp/test2" }
end

log "test" do
	message "notified log resource"
	action :nothing
end

ruby_block "notify recipe" do
	block do
		true
	end
	notifies :run, "inline_recipe[test]", :delayed
end
