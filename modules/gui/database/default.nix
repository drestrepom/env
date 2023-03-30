{config, ...}
: {
  config.services = {
    redis.servers.tic_tac = {
      enable = true;
    };
  };
}
