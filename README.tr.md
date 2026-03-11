# Archive App

Flutter tabanlı bir belge arşivleme ve kullanıcı yönetim uygulaması. Bu uygulama, belgeleri yönetmek, erişim haklarını belirlemek ve bir REST API aracılığıyla kullanıcı kimlik doğrulama işlemlerini gerçekleştirmek için kapsamlı bir arayüz sunar.

## Özellikler

- **Kullanıcı Doğrulama:** Güvenli giriş işlevi (`LoginView`).
- **Belge Yönetimi:** 
  - Mevcut belgeleri listeleme (`ListDocumentsView`).
  - Yeni belge ekleme veya düzenleme (`EditDocumentView`).
  - `file_picker` paketi kullanılarak cihazdan dosya seçilmesini destekler.
- **Kullanıcı Yönetimi:** 
  - Mevcut kullanıcıları listeleme (`ListUsersView`).
  - Kullanıcı detaylarını ekleme veya düzenleme (`EditUserView`).
  - Kullanıcı erişim yetkilendirmelerini yönetme (`EditAccessAuth`).
- **Arşiv Görüntüleyici:** Arşivlenmiş içerikleri görüntüleme (`ArchiveView`).
- **RESTful API Entegrasyonu:** HTTP istekleri (GET, POST, PUT, DELETE) kullanarak veri senkronizasyonu için arka uç servisine bağlanır.

## Kullanılan Teknolojiler ve Paketler

- [Flutter SDK](https://flutter.dev/) (>=3.1.2 <4.0.0)
- `http`: REST API'ye ağ istekleri yapmak için.
- `file_picker`: Cihazdan yerel dosyaları seçmek için.
- `intl`: Uluslararasılaştırma ve tarih formatlama için.
- `cupertino_icons`: iOS stili ikonlar için.

## Başlarken

Uygulamayı yerel makinenizde kurmak ve çalıştırmak için aşağıdaki adımları izleyin.

### Gereksinimler

- Sisteminizde yüklü [Flutter SDK](https://docs.flutter.dev/get-started/install).
- Flutter/Dart eklentileri yapılandırılmış [VS Code](https://code.visualstudio.com/) veya [Android Studio](https://developer.android.com/studio) gibi bir IDE.
- Çalışan bir REST API arka ucu (gerekirse `lib/service/rest_api.dart` dosyasındaki API uç noktalarını güncelleyin).

### Kurulum

1. Depoyu klonlayın:
   ```bash
   git clone <repository-url>
   cd archive_app
   ```

2. Gerekli bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```

3. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```

## Proje Yapısı

- `lib/main.dart`: Uygulamanın başlangıç noktası.
- `lib/view/`: Kullanıcı arayüzü ekranları (Giriş, Arşiv, Belge ve Kullanıcı Yönetimi).
- `lib/model/`: İş mantığı için veri modelleri.
- `lib/viewmodel/`: Durum yönetimi ve iş mantığı işleyicileri.
- `lib/service/`: Ağ katmanları ve REST API işleyicileri (`rest_api.dart`).

## Katkıda Bulunma

1. Projeyi çatallayın (Fork).
2. Özellik dalınızı oluşturun (`git checkout -b feature/MuthisOzellik`).
3. Değişikliklerinizi işleyin (`git commit -m 'MuthisOzellik eklendi'`).
4. Dalınıza gönderin (`git push origin feature/MuthisOzellik`).
5. Bir Pull Request oluşturun.

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır - daha fazla detay için LICENSE dosyasına bakınız.
