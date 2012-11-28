action :start do
  execute "start minecraft" do
    command <<-EOH
    cd /home/#{node[:minecraft][:user]}/server
    java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui &
    EOH
  end
end

action :stop do
  execute "stop minecraft" do
    command <<-EOH
    killall java
    EOH
  end
end