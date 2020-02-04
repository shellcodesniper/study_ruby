# 배포해보기



## Phusion Passenger

```bash
gem install passenger
passenger-install-apache2-module
```



### Apache 설정

위의 설정을 마치고 나면 몇가지 설정을 보여준다. 자신의 환경에 맞게 아파치 설정을 수정해 주면 된다. 

(ex) apache module

```conf
LoadModule passenger_module /usr/local/rvm/gems/ruby-2.3.0/gems/passenger-5.0.30/buildout/apache2/mod_passenger.so
    <IfModule mod_passenger.c>
    PassengerRoot /usr/local/rvm/gems/ruby-2.3.0/gems/passenger-5.0.30
    PassengerDefaultRuby /usr/local/rvm/gems/ruby-2.3.0/wrappers/ruby
</IfModule>
```

(ex) virtual host

```yml
<VirtualHost *:80>
    RailsEnv development
    ServerName yourdomain
    DocumentRoot /var/www/html/myweb/public
    <Directory "/var/www/html/myweb/public">
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>
```

### Production 배포

virtual host 설정의 ‘RailsEnv development’ 를 ‘RailsEnv production’ 으로 수정 한다. 
그다음 레일즈 프로젝트의 config/secrets.yml 의 production secret_key_base 를 설정해 주면 된다. 
secret_key 는 아래의 명령어로 생성이 가능하다. 

```
rails secret
```