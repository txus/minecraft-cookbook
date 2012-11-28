execute "update package index" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end.run_action(:run)

package "openjdk-7-jre" do
  action :install
end

username = node[:minecraft][:user]
home_dir = "/home/#{username}"

user username do
  action [:create]
end

directory home_dir do
  owner username
  mode 0700
end

directory "#{home_dir}/server" do
  owner username
  mode 0700
end

remote_file "#{home_dir}/server/minecraft_server.jar" do
  source "https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar"
  mode 0700
end

template "#{home_dir}/server/server.properties" do
  owner username
  mode 0700

  notifies :start, "minecraft_server[main]"
end

minecraft_server "main" do
  action [:start]
end