{ inputs, username, ... }: {
          home-manager = {
            users.${username} = {
              imports = [
                inputs.slippi.homeManagerModules.default
                {
                  slippi-launcher.isoPath = "/home/${username}/melee/meow.iso";
                  slippi-launcher.launchMeleeOnPlay = false;
                  slippi-launcher.enableJukebox = false;
                  slippi-launcher.useMonthlySubfolders = true;
                }
              ];
            };
          };
        }
