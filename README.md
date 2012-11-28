Description
===========

Installs and configures a Minecraft server for your enjoyment.

Example usage with Vagrant
==========================

If you want to quickly set up a Minecraft server with this cookbook, just
install the cookbook with knife:

    gem install vagrant
    mkdir ~/myvagrant && cd ~/myvagrant
    mkdir cookbooks
    git clone git://github.com/txus/minecraft-cookbook cookbooks/minecraft
    vim Vagrantfile

And here's the sample Vagrantfile:

```
Vagrant::Config.run do |config|
  config.vm.box = "precise"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :hostonly, "33.33.33.10"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "minecraft"

    chef.json = {
      :minecraft => {
        :options => {
          motd: "YEAH!",
          allow_flight: true,
          level_name: "superkewl",
          online_mode: false
        }
      }
    }
  end
end
```

Now, `vagrant up` and `vagrant provision` and connect to your fresh new server
at `33.33.33.10`! :)

Attributes
==========

Here are the default attributes that you can override:

```
default.minecraft.user = "minecraft"

default.minecraft.options.generator_settings = ""
default.minecraft.options.allow_nether = true
default.minecraft.options.level_name = "world"
default.minecraft.options.enable_query = false
default.minecraft.options.allow_flight = false
default.minecraft.options.server_port = 25565
default.minecraft.options.level_type = "DEFAULT"
default.minecraft.options.enable_rcon = false
default.minecraft.options.level_seed = ""
default.minecraft.options.server_ip = ""
default.minecraft.options.max_build_height = 256
default.minecraft.options.spawn_npcs = true
default.minecraft.options.white_list = false
default.minecraft.options.spawn_animals = true
default.minecraft.options.snooper_enabled = true
default.minecraft.options.hardcore = false
default.minecraft.options.texture_pack = ""
default.minecraft.options.online_mode = true
default.minecraft.options.pvp = true
default.minecraft.options.difficulty = 1
default.minecraft.options.gamemode = 0
default.minecraft.options.max_players = 20
default.minecraft.options.spawn_monsters = true
default.minecraft.options.generate_structures = true
default.minecraft.options.view_distance = 10
default.minecraft.options.motd = "Minecraft server"
```

Usage
=====


