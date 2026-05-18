# Intentionally empty: overrides /opt/homebrew/share/fish/vendor_conf.d/mise-activate.fish
# to prevent the Homebrew mise package from auto-activating before user PATH
# modifications in config.fish have run. Activation happens explicitly at the
# end of config.fish so mise's tool dirs end up at the front of PATH.
