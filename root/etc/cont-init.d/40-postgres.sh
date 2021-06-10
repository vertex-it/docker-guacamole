#!/usr/bin/with-contenv sh

mkdir -p /config/postgres
mkdir -p /var/run/postgresql 
chown postgres:postgres /var/run/postgresql
chown -R postgres:postgres /config/postgres
chmod 0700 /config/postgres

if [ -e /config/postgres/postgresql.conf ]; then
  echo "Database already configured"
else
  s6-setuidgid postgres initdb
  
#   # Adjust PostgreSQL configuration so that remote connections to the database are possible.
#   echo "host all  all    0.0.0.0/0  trust" >> /config/postgres/pg_hba.conf

#   # And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
#   echo "listen_addresses='*'" >> /config/postgres/postgresql.conf
fi

