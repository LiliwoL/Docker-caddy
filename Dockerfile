FROM dunglas/frankenphp

# Installation dans le système Debian de base
RUN apt update && apt install wget git zsh -y

# Force le ZSH comme shell par défaut
RUN chsh -s /usr/bin/zsh

# Extensions PHP à installer
RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip

# Install Composer
RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Install Oh MyZSH
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
