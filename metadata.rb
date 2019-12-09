name 'twc-chef-logdna'
maintainer 'Andrew Kener'
maintainer_email 'andrew.kener@ibm.com'
description 'Installs/Configures LogDNA Agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.2'
chef_version '>= 12.1' if respond_to?(:chef_version)
license 'MIT'

issues_url 'https://github.com/TheWeatherCompany/twc-chef-logdna-cookbook/issues'
source_url 'https://github.com/TheWeatherCompany/twc-chef-logdna-cookbook'

supports 'ubuntu'
supports 'centos'

depends 'yum'
depends 'apt'

recipe 'twc-chef-logdna::default', 'Main LogDNA Agent Recipe'
recipe 'twc-chef-logdna::configure', 'Configuring LogDNA Agent after installation'
recipe 'twc-chef-logdna::install_debian', 'Installing LogDNA Agent via APT'
recipe 'twc-chef-logdna::install_redhat', 'Installing LogDNA Agent via YUM'
recipe 'twc-chef-logdna::service_debian', 'Activating LogDNA Service on DEB-based systems'
recipe 'twc-chef-logdna::service_redhat', 'Activating LogDNA Service on RPM-based systems'
