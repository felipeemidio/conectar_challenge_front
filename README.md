# CONECTAR CHALLENGE FRONT - Flutte Web

Tech:
- Flutter
- dio
- flutter_secure_storage
- flutter_modular
- ValueNotifier (Gerenciamento de estado)

## Architecture

Arquitetura baseada no Clean architecture da Flutterando (para saber mais [clicar aqui](https://github.com/Flutterando/Clean-Dart)).

Foram removidos os **usecases** para simplificação.

Arquitetura modular usando o pacote *flutter_modular* que também traz funções de navegação e injeção de dependência.

Todos os módulos estão na pasta `modules` e se dividem nos seguintes conceitos:

- **Presenters**: Widgets e os controller (classes para gerenciar os estados)
- **Entities**: Classes para carregar as informações pelo app.
- **Repositories**: Fazem as transformações dos dados e as chamadas de rotas pelo Datasource
- **Serviços**: Como os repositórios mas usam Drivers no lugar dos Datasources.
- **Datasources**: Fontes de consulta, no caso deste projeto é apenas a API feita ne Nest.JS.
- **Drivers**: Interface para abstração de pacotes e outros acessos externos.

A pasta `core` guarda tudo aquilo que é compartilhado pela aplicação, neste caso, constantes e classes de utilidades;

Há um módulo especial chamado `shared` que carrega todos as dependências basicas da aplicação.

# Configurações

Clonar o repositório

```bash
$ git clone https://github.com/felipeemidio/conectar_challenge_front.git
```

Instalar dependências

```bash
$ flutter pub get
```

Este projeto depende da [API](https://github.com/felipeemidio/conectar_challenge_back), para alterar a urlBase vá para o arquivo `/lib/modules/shared/external/datasources/api_datasource.dart` e alterer a propriedade `baseUrl` que está com o valor estático.



# Executando

```bash
$ flutter run --d chrome --web-browser-flag --disable-web-security
```