class Hub < FPM::Cookery::Recipe
  description 'hub helps you win at git.'
  homepage    'https://github.com/github/hub'
  maintainer  'Nick Stenning <nick@whiteink.com>'

  name    'hub'
  version '2.2.9'
  license 'MIT'

  source "https://github.com/github/hub/releases/download/v#{version}/hub-linux-amd64-#{version}.tgz"
  sha256 '5867647071007add582f911867fb4973354c51690ac20aecb2e73be7440875a3'

  def build
  end

  def install
    bin.install 'bin/hub'

    etc('bash_completion.d').install 'etc/hub.bash_completion.sh', 'hub'
    share('zsh/vendor-completions').install 'etc/hub.zsh_completion', '_hub'

    man1.install 'share/man/man1/hub.1'
  end
end
