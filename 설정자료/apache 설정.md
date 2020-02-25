# Passenger 용 apache conf



```apache
<VirtualHost *:80>

	RailsEnv production
#	RailsEnv development
	ServerName rust.kuuwang.com
	DocumentRoot /WorkSpace/Rust_Rails/public


	<Directory "/WorkSpace/Rust_Rails/public">
		AllowOverride None
		Require all granted
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
```





```apache
<IfModule mod_ssl.c>
	<VirtualHost _default_:443>
		RailsEnv production
	#	RailsEnv development
		ServerName rust.kuuwang.com
		DocumentRoot /WorkSpace/Rust_Rails/public


		<Directory "/WorkSpace/Rust_Rails/public">
			AllowOverride None
			Require all granted
		</Directory>


		ErrorLog ${APACHE_LOG_DIR}/ssl_error.log
		CustomLog ${APACHE_LOG_DIR}/ssl_access.log combined

		SSLEngine on

		SSLCertificateFile	/etc/letsencrypt/live/rust.kuuwang.com/fullchain.pem
		SSLCertificateKeyFile /etc/letsencrypt/live/rust.kuuwang.com/privkey.pem

		<FilesMatch "\.(cgi|shtml|phtml|php)$">
				SSLOptions +StdEnvVars
		</FilesMatch>
		<Directory /usr/lib/cgi-bin>
				SSLOptions +StdEnvVars
		</Directory>

	</VirtualHost>
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
```

