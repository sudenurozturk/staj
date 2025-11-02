# MySQL Veritabanı Kurulumu ve Uygulama Bağlantısı

Bu proje MySQL veritabanı kullanan bir uygulamadır.  
Veritabanı yapısı `new.sql` dosyasında yer almakta olup gerekli tablolar ve örnek veriler bu dosya aracılığıyla oluşturulur.

---

## Kurulum Adımları

### 1. Veritabanı Oluşturma

1. MySQL'e giriş yapın:
   ```bash
   mysql -u root -p
Yeni bir veritabanı oluşturun:

sql
Kodu kopyala
CREATE DATABASE new;
USE new;
new.sql dosyasını çalıştırarak tabloları oluşturun:

bash
Kodu kopyala
source path/to/new.sql;
Bu işlem tablo yapılarını ve örnek verileri veritabanına yükler.

2. application.properties Ayarları
src/main/resources/application.properties dosyasını açın ve kendi MySQL kullanıcı bilgilerinizi girin:

properties
Kodu kopyala
spring.datasource.url=jdbc:mysql://localhost:3306/new
spring.datasource.username=KULLANICI_ADINIZ
spring.datasource.password=SIFRENIZ
spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=true
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
KULLANICI_ADINIZ ve SIFRENIZ alanlarını kendi MySQL bilgilerinizle değiştirin.

3. Uygulamayı Çalıştırma
Uygulamayı Maven veya IDE (IntelliJ IDEA, Eclipse, VS Code vb.) üzerinden başlatabilirsiniz.

Maven üzerinden çalıştırmak için:

bash
Kodu kopyala
mvn spring-boot:run
Uygulama başarıyla başlatıldığında veritabanı bağlantısı sağlanacaktır.

Veritabanı İçeriği
new.sql dosyası aşağıdaki tabloları oluşturur ve örnek veriler içerir:

products: Ürün bilgilerini içerir

sellers: Satıcı bilgilerini içerir

promotions: Satıcılara ait promosyon oranlarını içerir

ratings: Satıcılara ait puanlamaları içerir

Tüm tablolar yabancı anahtar ilişkileriyle birbirine bağlıdır.

Bağlantı: localhost:3306/new

Bu dosya, veritabanının kolayca oluşturulması ve uygulamanın doğru şekilde bağlanabilmesi için hazırlanmıştır.
