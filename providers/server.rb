action :start do
  execute "start minecraft" do
    command <<-EOH
    cd /home/#{node[:minecraft][:user]}/server
    killall java; java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui &
    EOH
  end
end