info() { while IFS='' read -r line; do echo "$(date) - {{ django_name }} - {{ command }} - $line" >> /root/errors.log; done; };
error() { while IFS='' read -r line; do echo "$(date) - {{ django_name }} - {{ command }} - $line" >> /root/info.log; done; };

{{ python }} {{ manage }} {{ command }} 1> >(info) 2> >(error)
