class CarbonCRelay < FPM::Cookery::Recipe
  description 'Enhanced C implementation of Carbon relay, aggregator and rewriter'
  homepage    'https://github.com/grobian/carbon-c-relay'
  maintainer  'Nick Stenning <nick@whiteink.com>'

  name    'carbon-c-relay'
  version '2.6'
  license 'Apache-2.0'

  source "https://github.com/grobian/carbon-c-relay/archive/v#{version}.tar.gz"
  sha256 '580ec4629ab63288ba73259a8b98300d649e253ac940c0343e009ed5c454053f'

  post_install   'post-install'
  post_uninstall 'post-uninstall'

  config_files '/etc/carbon-c-relay.conf'

  def build
    make
  end

  def install
    bin.install 'relay', 'carbon-c-relay'

    etc.install workdir('carbon-c-relay.conf')
    etc('default').install workdir('carbon-c-relay.default'), 'carbon-c-relay'
    etc('init').install workdir('carbon-c-relay.upstart'), 'carbon-c-relay.conf'
    etc('systemd/system').install workdir('carbon-c-relay.service'), 'carbon-c-relay.service'

    man1.install 'carbon-c-relay.1'
  end
end
