{ inputs, username, config, ... }: {
          home-manager = {
            users.${username} = {
              imports = [
                inputs.slippi.homeManagerModules.default
                {
                  slippi-launcher.isoPath = "/home/${username}/melee/meow.iso";
                  slippi-launcher.rootSlpPath = "/home/${username}/.local/share/Slippi";
                  slippi-launcher.spectateSlpPath = "/home/${username}/.local/share/Slippi/Spectate";
                  slippi-launcher.launchMeleeOnPlay = false;
                  slippi-launcher.enableJukebox = false;
                  slippi-launcher.useMonthlySubfolders = true;
                }
              ];
            };
          };
        }
